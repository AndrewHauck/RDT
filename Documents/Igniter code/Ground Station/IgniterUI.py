import PySimpleGUI as sg
import threading
import serial
import math
import serial.tools.list_ports
from datetime import datetime
from GSModules import ListComPorts
from GSModules import UIElements
from GSModules import SerialStuff as sb
from GSModules.Logging import Logger
from GSModules import ArduinoConfigureWindow as cfg

# Valve states
isValveOpen = [False, False, False, False, False, False]
# Create the Window and Finalize it. Then fullscreen
window = sg.Window('RocketView', UIElements.layout, grab_anywhere=False, resizable=True)

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
        cfg.config_active = True
        layout = cfg.layout
        configureWindow = sg.Window('Arduino Configuration', layout, grab_anywhere=True, resizable=True)
    if cfg.config_active:
        cfgEvent, cfgValues = configureWindow.read(timeout=10)
        if cfgEvent is None:
            cfg.config_active = False
            configureWindow.Close()
        elif "ConfigPin" in cfgEvent:
            print("Button Pressed")
    # Button Reactions
    #if "Configure" in event:
    if not ser.is_open:
        if mainEvent == 'COM_Connect':
            try:  # OPENING SERIAL PORT
                ser = serial.Serial(mainValues['COM_Combo'], 9600, timeout=1)
                ser.write(bytearray([0x05]))
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
                window.Element('P1').Update("XXXXXXXXXX")
                window.Element('P2').Update("XXXXXXXXXX")
                window.Element('P3').Update("XXXXXXXXXX")
                window.Element('P4').Update("XXXXXXXXXX")
                window.Element("STAGE" + str(1)).Update(button_color=('White', 'Red'))
                window.Element("STAGE" + str(2)).Update(button_color=('White', 'Red'))
                window.Element("STAGE" + str(3)).Update(button_color=('White', 'Red'))
                window.Element("STAGE" + str(4)).Update(button_color=('White', 'Red'))
                for x in range(6):
                    window.Element("valve" + str(x)).Update(button_color=('White', 'Red'))
                if f.is_open():
                    f.halt()
                    window.Element('filein').update('Start Recording', button_color=('White', 'Red'))
            elif "Refresh" in mainEvent:
                if __name__ == '__main__':
                    window.FindElement('COM_Combo').update(values=ListComPorts.serial_ports())
            elif "Enquire" in mainEvent:
                try:
                    ser.write(bytearray([0x05]))
                except serial.SerialException:
                    print("Port Closed")
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
                    packet = [0x01, 0x56, 0x30, 0x31, 0x02, x+0x30, 0x04]
                    ser.write(bytearray(packet))
        elif "STAGE" in mainEvent:
            if str(0) in mainEvent:
                print("closing...")
                # Send command to close all valves
                packet = [0x01, 0x43, 0x30, 0x35, 0x02, 0x43, 0x4c, 0x4f, 0x53, 0x45, 0x04]
                ser.write(bytearray(packet))
                if (f.is_open()):
                    f.log("Closing..." + "\r")
            elif str(1) in mainEvent:
                print("arming...")
                # Send command to arm
                packet = [0x01, 0x43, 0x30, 0x33, 0x02, 0x41, 0x52, 0x4d, 0x04]
                ser.write(bytearray(packet))
                if (f.is_open()):
                    f.log("Arming..." + "\r")
            elif str(2) in mainEvent:
                print("firing...")
                packet = [0x01, 0x43, 0x30, 0x34, 0x02, 0x46, 0x49, 0x52, 0x45, 0x04]
                ser.write(bytearray(packet))
                if (f.is_open()):
                    f.log("Firing..." + "\r")
            elif str(3) in mainEvent:
                print("purging...")
                packet = [0x01, 0x43, 0x30, 0x35, 0x02, 0x50, 0x55, 0x52, 0x47, 0x45, 0x04]
                ser.write(bytearray(packet))
                if (f.is_open()):
                    f.log("Purging..." + "\r")

        # Updating GUI to reflect valve states
        for x in range(0,6):
            if isValveOpen[x] == True:
                window.FindElement("VALVE" + str(x)).Update(button_color=('White', 'Green'))
            else:
                window.FindElement("VALVE" + str(x)).Update(button_color=('White', 'Red'))

        #*****UPDATE PRESSURE READINGS*****
        # Parses serial buffer from microcontroller
        # Converts raw data into float value, used to update GUI
        if ser.is_open:
            while ser.in_waiting:
                inChar = ser.read().decode('ASCII')
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

                        # ***  UPDATE PRESSURE READINGS ***
                        # ***  CAN WE CHECK THESE CALCULATIONS???
                        # ***  5V ON PIN = 28 PSI???
                        if (packet_type == 'D'):
                            pdata1 = dataString[dataString.find('A') + 1:dataString.find('B')]
                            pdata1 = int(pdata1) * (5.0 / 1023.0) * (14000.0 / 2500.0)
                            window.Element('P1').Update(round(pdata1, 2))
                            pdata2 = dataString[dataString.find('B') + 1:dataString.find('C')]
                            pdata2 = int(pdata2) * (5.0 / 1023.0) * (14000.0 / 2500.0)
                            window.Element('P2').Update(round(pdata2, 2))
                            pdata3 = dataString[dataString.find('C') + 1:dataString.find('D')]
                            pdata3 = int(pdata3) * (5.0 / 1023.0) * (14000.0 / 2500.0)
                            window.Element('P3').Update(round(pdata3, 2))
                            pdata4 = dataString[dataString.find('D') + 1:]
                            pdata4 = int(pdata4) * (5.0 / 1023.0) * (14000.0 / 2500.0)
                            window.Element('P4').Update(round(pdata4, 2))

                            if(f.is_open()):
                                f.log("Pressure 1: " + str(round(pdata1, 2)) + "\r")
                                f.log("Pressure 2: " + str(round(pdata2, 2)) + "\r")
                                f.log("Pressure 3: " + str(round(pdata3, 2)) + "\r")
                                f.log("Pressure 4: " + str(round(pdata4, 2)) + "\r")

                        if (packet_type == 'M'):
                            if (dataString == "IGNITER ARMED"):
                                window.Element("STAGE" + str(1)).Update(button_color=('White', 'Green'))
                                window.Element("STAGE" + str(2)).Update(button_color=('White', 'Red'))
                                window.Element("STAGE" + str(3)).Update(button_color=('White', 'Red'))
                                window.Element("STAGE" + str(0)).Update(button_color=('White', 'Red'))
                            if (dataString == "IGNITER FIRING"):
                                window.Element("STAGE" + str(1)).Update(button_color=('White', 'Red'))
                                window.Element("STAGE" + str(2)).Update(button_color=('White', 'Green'))
                                window.Element("STAGE" + str(3)).Update(button_color=('White', 'Red'))
                                window.Element("STAGE" + str(0)).Update(button_color=('White', 'Red'))
                            if (dataString == "IGNITER PURGING"):
                                window.Element("STAGE" + str(1)).Update(button_color=('White', 'Red'))
                                window.Element("STAGE" + str(2)).Update(button_color=('White', 'Red'))
                                window.Element("STAGE" + str(3)).Update(button_color=('White', 'Green'))
                                window.Element("STAGE" + str(0)).Update(button_color=('White', 'Red'))
                            if (dataString == "IGNITER CLOSED"):
                                window.Element("STAGE" + str(1)).Update(button_color=('White', 'Red'))
                                window.Element("STAGE" + str(2)).Update(button_color=('White', 'Red'))
                                window.Element("STAGE" + str(3)).Update(button_color=('White', 'Red'))
                                window.Element("STAGE" + str(0)).Update(button_color=('White', 'Green'))
                            print(dataString)
                            if (f.is_open()):
                                f.log(dataString + "\r")
                        if (packet_type == 'V'):
                            for x in range(6):
                                isValveOpen[x] = bool(int(dataString[x]))
                            print("Valve States: " + dataString)
                            if (f.is_open()):
                                f.log("Valve States: " + dataString + "\r")
                    else:
                        buffer = ""  # If only 1 end of packet is found, data somehow corrupted, clear buffer
window.close()