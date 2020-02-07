import PySimpleGUI as sg
import threading
import serial
import math
import serial.tools.list_ports
from datetime import datetime
from GSModules import ListComPorts
from GSModules import UIElements as ui
from GSModules import PacketHelper
from GSModules.Logging import Logger
from GSModules import ArduinoConfigureWindow as cfg
from copy import deepcopy

# Valve states
isValveOpen = [False, False, False, False, False, False]
# Create the Window and Finalize it. Then fullscreen
window = sg.Window('RocketView', ui.layout, grab_anywhere=False, resizable=True)
window.Finalize()
window.Element("graph").DrawImage(filename=("img\IgniterDiagram.png"), location=(0, 0))
# Declaring buffer string to store serial data
buffer = ""
dataString = ""
ser = serial.Serial(None) #Create serial port object
f = Logger()

# Event Loop to process "events" and get the "values" of the inputs
while True:
    mainEvent, mainValues = window.read(timeout=10)
    if mainEvent is None:
        break
    if not cfg.config_active and "Configure" in mainEvent:
        ser.write(bytearray([0x05]))
        #layout = deepcopy(cfg.layout)
        layout = deepcopy(cfg.layout)
    if not cfg.config_active and cfg.connectedMC:
        configureWindow = sg.Window('Arduino Configuration', layout, grab_anywhere=True, resizable=True)
        cfg.config_active = True
    elif cfg.config_active:
        cfgEvent, cfgValues = configureWindow.read(timeout=10)
        if cfgEvent is None:
            cfg.config_active = False
            configureWindow.Close()
        elif "ConfigPin" in cfgEvent:
            if(cfg.connectedMC == "328P"):
                print("328P")
            configureWindow.Element('DIAGRAM').update(data='ArduinoMegaImg.png')
            print("Button Pressed")
    # Button Reactions
    #if "Configure" in event:
    if not ser.is_open:
        if mainEvent == 'COM_Connect':
            try:  # OPENING SERIAL PORT
                ser = serial.Serial(mainValues['COM_Combo'], 9600, timeout=1)
                if __name__ == '__main__':
                    window.FindElement('COM_Combo').update(values=ListComPorts.serial_ports())
                    window.FindElement('COM_Connect').update(mainValues['COM_Combo'], button_color=('White', 'Green'))
                    window.FindElement('COM_Enquire').update(button_color=('White', 'Red'))
            except serial.SerialException: #IF PORT CAN'T BE OPENED
                print("Unable to Open Port")
    else:
        if "COM" in mainEvent:
            if "Connect" in mainEvent:  # CLOSING SERIAL PORT
                ser.close()
                window.FindElement('COM_Combo').update(values=ListComPorts.serial_ports())
                window.FindElement('COM_Connect').update('Open', button_color=('White', 'Red'))
                window.FindElement('COM_Enquire').update(button_color=('White', 'Red'))
                for i in range(4):
                  window.Element('P'+str(i+1)).Update("XXXXXXXXXX")
                  window.Element("STAGE" + str(i)).Update(button_color=('White', 'Red'))
                
                for x in range(6):
                    window.Element("VALVE" + str(x)).Update(button_color=('White', 'Red'))
                if f.is_open():
                    f.halt()
                    window.Element('filein').update('Start Recording', button_color=('White', 'Red'))
            elif "Refresh" in mainEvent:
                if __name__ == '__main__':
                    window.FindElement('COM_Combo').update(values=ListComPorts.serial_ports())
            #elif "Enquire" in mainEvent:
        elif "dropdown" in mainEvent:
            #filename = sg.popup_get_file('file to open', no_window=True)
            print("Got em")
        elif "filein" in mainEvent:
            if not f.is_open():
                f.start(mainValues['input'])
                window.Element('filein').update('Recording', button_color=('White', 'Green'))
            else:
                f.halt()
                window.Element('filein').update('Start Recording', button_color=('White', 'Red'))
        elif "VALVE" in mainEvent:
            for x in range(0,6):
                if str(x) in mainEvent:
                    PacketHelper.sendMessage(ser, "V", str(x))
        elif "STAGE" in mainEvent:
            if str(0) in mainEvent:
                # Send command to arm
                f.log("Arming...")
                PacketHelper.sendMessage(ser, "C", "ARM")
            elif str(1) in mainEvent:
                f.log("Firing...")
                PacketHelper.sendMessage(ser, "C", "FIRE")
            elif str(2) in mainEvent:
                f.log("Purging...")
                PacketHelper.sendMessage(ser, "C", "PURGE")
            elif str(3) in mainEvent:
                # Send command to close all valves
                f.log("Closing...")
                PacketHelper.sendMessage(ser, "C", "CLOSE")

        # Updating GUI to reflect valve states
        window.Element("graph").erase()
        window.Element("graph").DrawImage(filename=("img\IgniterDiagram.png"), location=(0, 0))
        for x in range(0,6):
            if isValveOpen[x]: color = "Green"
            else: color = "Red"
            window.FindElement("VALVE" + str(x)).Update(button_color=('White', color))
            window.Element("graph").DrawImage(filename=(ui.valves_imgs[color][x]), location=ui.valves_pos[x])
        #*****UPDATE PRESSURE READINGS*****
        # Parses serial buffer from microcontroller
        # Converts raw data into float value, used to update GUI
        if ser.is_open:
            while ser.in_waiting:
                inChar = ser.read().decode('utf-8')
                buffer = buffer + inChar
                if (inChar == chr(6)):
                    buffer = ""
                    window.FindElement('COM_Enquire').update(button_color=('White', 'Green'))
                if (inChar == chr(4)):
                    if (buffer.find(chr(1)) >= 0):
                        buffer = buffer[buffer.find(chr(1)):(
                                    buffer.find(chr(4)) + 1)]  # Trim off excess characters before and after packet
                        packet_type = buffer[1]

                        upperNibble: int = ord(buffer[2])
                        lowerNibble: int = ord(buffer[3])
                        # UPPER NIBBLE
                        if (upperNibble > 0x40):  # if a letter
                            upperNibble = upperNibble & 0b00001111  # strip off upper nibble(only indicates that value is a letter)
                            upperNibble = upperNibble + 0b00001001  # upperNibble now equals 0x0A - 0x0F
                        else:
                            upperNibble = upperNibble & 0b00001111  # upperNibble now equals 0x00 - 0x09
                        upperNibble = upperNibble << 4  # upperNibble now represents upper byte of dataBytes
                        # LOWER NIBBLE
                        if (lowerNibble > 0x40):  # if letter
                            lowerNibble = lowerNibble & 0b00001111  # strip off upper nibble
                            lowerNibble = lowerNibble + 0b00001001  # lowerNibble now equals 0x0A - 0x0F
                        lowerNibble = lowerNibble & 0b00001111  # lowerNibble now equals 0x00 - 0x09 if it was a number

                        packet_dataSize = upperNibble | lowerNibble  # combining upper and lower bytes to make final char(UUUU LLLL)
                        dataString = buffer[5:-1]  # sets data string of packet to data pulled from _inputString
                        buffer = ""  # Clear buffer

                        if (packet_type == 'Q'):
                            cfg.connectedMC = dataString

                        # ***  UPDATE PRESSURE READINGS ***
                        # ***  CAN WE CHECK THESE CALCULATIONS???
                        # ***  5V ON PIN = 28 PSI???
                        if (packet_type == 'D'):
                            letterBase = ord('A') # Because i starts at 1, start at letter less than 1
                            for i in range(4):
                              # Find the position of each letter from A to D 
                              startLetterPos = dataString.find(chr(letterBase+i))
                              endLetterPos   = dataString.find(chr(letterBase+i+1))
                              # Get the data in between the letters. If end letter isn't found, just go to end
                              pdata = int(dataString[startLetterPos+1 : endLetterPos if endLetterPos > 0 else None])
                              # Convert from voltage using transformation formula
                              pdata = 1250*(pdata*(5/1023))-1250
                              # Update the GUI element
                              window.Element('P'+str(i+1)).Update(round(pdata, 2))
                              # Update the logfile
                              f.logFile("Pressure {}: {:.2}".format(i+1, pdata))

                        if (packet_type == 'M'):
                            # Mapping of dataString to which numbered GUI button should light up
                            greenStage = {
                              "IGNITER ARMED":   0,
                              "IGNITER FIRING":  1,
                              "IGNITER PURGING": 2,
                              "IGNITER CLOSED":  3,
                            }
                            if dataString in greenStage:
                              for guiItem in range(4):
                                if guiItem == greenStage[dataString]: 
                                  color = "Green"
                                else:
                                  color = "Red"
                                window.Element("STAGE" + str(i)).Update(button_color=('White', color))
                            f.log(dataString)
                        if (packet_type == 'V'):
                            for x in range(6):
                                isValveOpen[x] = bool(int(dataString[x]))
                            f.log("Valve States: ", dataString)
                    else:
                        buffer = ""  # If only 1 end of packet is found, data somehow corrupted, clear buffer
window.close()