import PySimpleGUI as sg
import threading
import serial
import math
import serial.tools.list_ports
from datetime import datetime
from GSModules import ListComPorts
from GSModules import UIElements
from GSModules import SerialStuff as sb

# def igniterLoop():
#     global isValveOpen
#     print('Valve 3 open. Valve 4 open. Exciter on')
#     isValveOpen[3] = True
#     isValveOpen[4] = True
#     isValveOpen[0] = True
#     time.sleep(6)
#     print('Valve 1 closed. Valve 2 closed. Exciter off')
#     isValveOpen[1] = False
#     isValveOpen[2] = False
#     isValveOpen[0] = False

# List of items inside of window
# COM Port Selector

#layout = valves + COMSelector + diagram + rawDisplay + stages + readings

# Valve states
isValveOpen = [False, False, False, False, False, False]
# Create the Window and Finalize it. Then fullscreen
window = sg.Window('RocketView', UIElements.layout, grab_anywhere=False)

# Declaring buffer string to store serial data
buffer = ""
dataString = ""
ser = serial.Serial(None) #Create serial port object


# Event Loop to process "events" and get the "values" of the inputs
while True:
    event, values = window.read(timeout=10)
    # Button Reactions
    if event is None:
        break
    if not ser.is_open:
        if event == 'COM_Connect':
            try:  # OPENING SERIAL PORT
                ser = serial.Serial(values['COM_Combo'], 9600, timeout=1)
                ser.write(bytearray([0x05]))
                if __name__ == '__main__':
                    window.FindElement('COM_Combo').update(values=ListComPorts.serial_ports())
                    window.FindElement('COM_Connect').update(values['COM_Combo'], button_color=('White', 'Green'))
                    window.FindElement('COM_Enquire').update(button_color=('White', 'Red'))
                    f = open("test.txt", "w+")
            except serial.SerialException: #IF PORT CAN'T BE OPENED
                print("Unable to Open Port")
    else:
        if event == 'COM_Connect':  # CLOSING SERIAL PORT
            ser.close()
            f.close()
            window.FindElement('COM_Combo').update(values=ListComPorts.serial_ports())
            window.FindElement('COM_Connect').update('Open', button_color=('White', 'Red'))
            window.FindElement('COM_Enquire').update(button_color=('White', 'Red'))
            window.Element('P1').Update("XXXXXXXXXX")
            window.Element('P2').Update("XXXXXXXXXX")
            window.Element('P3').Update("XXXXXXXXXX")
            window.Element('P4').Update("XXXXXXXXXX")
            window.Element('ARM').Update(button_color=('White', 'Red'))
            window.Element('FIRE').Update(button_color=('White', 'Red'))
            window.Element('PURGE').Update(button_color=('White', 'Red'))
            window.Element('CLOSE ALL').Update(button_color=('White', 'Red'))
            for x in range(6):
                window.Element("valve" + str(x)).Update(button_color=('White', 'Red'))
        elif event == 'dropdown':
            #filename = sg.popup_get_file('file to open', no_window=True)
            print("Got em")
        elif event == 'COM_Refresh':
            print(datetime.datetime.now())
            if __name__ == '__main__':
                window.FindElement('COM_Combo').update(values=ListComPorts.serial_ports())
        elif event == 'COM_Enquire':
            try:
                ser.write(bytearray([0x05]))
            except serial.SerialException:
                print("Port Closed")
        elif event == "valve" + str(0):
            packet = [0x01, 0x56, 0x30, 0x31, 0x02, 0x30, 0x04]
            ser.write(bytearray(packet))
        elif event == "valve" + str(1):
            packet = [0x01, 0x56, 0x30, 0x31, 0x02, 0x31, 0x04]
            ser.write(bytearray(packet))
        elif event == "valve" + str(2):
            packet = [0x01, 0x56, 0x30, 0x31, 0x02, 0x32, 0x04]
            ser.write(bytearray(packet))
        elif event == "valve" + str(3):
            packet = [0x01, 0x56, 0x30, 0x31, 0x02, 0x33, 0x04]
            ser.write(bytearray(packet))
        elif event == "valve" + str(4):
            packet = [0x01, 0x56, 0x30, 0x31, 0x02, 0x34, 0x04]
            ser.write(bytearray(packet))
        elif event == "valve" + str(5):
            packet = [0x01, 0x56, 0x30, 0x31, 0x02, 0x35, 0x04]
            ser.write(bytearray(packet))
        elif event == 'ARM':
            print("arming...")
            # Send command to arm
            packet = [0x01, 0x43, 0x30, 0x33, 0x02, 0x41, 0x52, 0x4d, 0x04]
            ser.write(bytearray(packet))
        elif event == 'FIRE':
            print("firing...")
            packet = [0x01, 0x43, 0x30, 0x34, 0x02, 0x46, 0x49, 0x52, 0x45, 0x04]
            ser.write(bytearray(packet))
        elif event == 'PURGE':
            print("purging...")
            packet = [0x01, 0x43, 0x30, 0x35, 0x02, 0x50, 0x55, 0x52, 0x47, 0x45, 0x04]
            ser.write(bytearray(packet))
        elif event == 'CLOSE ALL':
            #print('Valve 5 closed')
            #print('Valve 3 closed. Valve 4 closed.')
            print("closing...")
            packet = [0x01, 0x43, 0x30, 0x35, 0x02, 0x43, 0x4c, 0x4f, 0x53, 0x45, 0x04]
            ser.write(bytearray(packet))

        # Updating GUI to reflect valve states
        for x in range(6):
            if isValveOpen[x] == True:
                window.FindElement("valve" + str(x)).Update(button_color=('White', 'Green'))
            else:
                window.FindElement("valve" + str(x)).Update(button_color=('White', 'Red'))

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
                            f.write(str(datetime.now().time()) + ": Pressure 1: " + str(pdata1) + "\r\n")
                            pdata2 = dataString[dataString.find('B') + 1:dataString.find('C')]
                            pdata2 = int(pdata2) * (5.0 / 1023.0) * (14000.0 / 2500.0)
                            window.Element('P2').Update(round(pdata2, 2))
                            f.write(str(datetime.now().time()) + ": Pressure 2: " + str(pdata2) + "\r\n")
                            pdata3 = dataString[dataString.find('C') + 1:dataString.find('D')]
                            pdata3 = int(pdata3) * (5.0 / 1023.0) * (14000.0 / 2500.0)
                            window.Element('P3').Update(round(pdata3, 2))
                            f.write(str(datetime.now().time()) + ": Pressure 3: " + str(pdata3) + "\r\n")
                            pdata4 = dataString[dataString.find('D') + 1:]
                            pdata4 = int(pdata4) * (5.0 / 1023.0) * (14000.0 / 2500.0)
                            window.Element('P4').Update(round(pdata4, 2))
                            f.write(str(datetime.now().time()) + ": Pressure 4: " + str(pdata4) + "\r\n")

                        if (packet_type == 'M'):
                            if (dataString == "IGNITER ARMED"):
                                window.Element('ARM').Update(button_color=('White', 'Green'))
                                window.Element('FIRE').Update(button_color=('White', 'Red'))
                                window.Element('PURGE').Update(button_color=('White', 'Red'))
                                window.Element('CLOSE ALL').Update(button_color=('White', 'Red'))
                            if (dataString == "IGNITER FIRING"):
                                window.Element('ARM').Update(button_color=('White', 'Red'))
                                window.Element('FIRE').Update(button_color=('White', 'Green'))
                                window.Element('PURGE').Update(button_color=('White', 'Red'))
                                window.Element('CLOSE ALL').Update(button_color=('White', 'Red'))
                            if (dataString == "IGNITER PURGING"):
                                window.Element('ARM').Update(button_color=('White', 'Red'))
                                window.Element('FIRE').Update(button_color=('White', 'Red'))
                                window.Element('PURGE').Update(button_color=('White', 'Green'))
                                window.Element('CLOSE ALL').Update(button_color=('White', 'Red'))
                            if (dataString == "IGNITER CLOSED"):
                                window.Element('ARM').Update(button_color=('White', 'Red'))
                                window.Element('FIRE').Update(button_color=('White', 'Red'))
                                window.Element('PURGE').Update(button_color=('White', 'Red'))
                                window.Element('CLOSE ALL').Update(button_color=('White', 'Green'))
                            print(dataString)
                        if (packet_type == 'V'):
                            for x in range(6):
                                isValveOpen[x] = bool(int(dataString[x]))
                            print(dataString)
                    else:
                        buffer = ""  # If only 1 end of packet is found, data somehow corrupted, clear buffer
window.close()

