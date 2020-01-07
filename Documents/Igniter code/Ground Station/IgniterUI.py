import PySimpleGUI as sg
import threading
import serial
import time

# Sets background and button color
sg.change_look_and_feel('DarkAmber')

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
# Buttons for valves
valves = [[sg.Text('VALVES')],
          [sg.Button('Main CH4 (1)', button_color=('White', 'Red'), key=1),
          sg.Button('Main GOX (2)', button_color=('White', 'Red'), key=2),
          sg.Button('Fire CH4 (3)', button_color=('White', 'Red'), key=3),
          sg.Button('Fire GOX (4)', button_color=('White', 'Red'), key=4),
          sg.Button('Purge (5)', button_color=('White', 'Red'), key=5),
          sg.Button('Igniter (0)', button_color=('White', 'Red'), key=0)]]

# Igniter diagram
diagram = [[sg.Image('IgniterDiagram.png', key='DIAGRAM', size=(400, 400))]]

# Staged buttons
stages = [[sg.Text('STAGES')],
          [sg.Button('ARM', button_color=('White', 'Red'), key='ARM'),
          sg.Button('FIRE', button_color=('White', 'Red'), key='FIRE'),
          sg.Button('PURGE', button_color=('White', 'Red'), key='PURGE'),
          sg.Button('CLOSE ALL', button_color=('White', 'Red'), key='CLOSE ALL')]]

# Sensor reading text elements
readings = [[sg.Text('Pressure 1:'), sg.Text('0000000000', key='P1'), sg.Text('PSI')],
            [sg.Text('Pressure 2:'), sg.Text('0000000000', key='P2'), sg.Text('PSI')],
            [sg.Text('Pressure 3:'), sg.Text('0000000000', key='P3'), sg.Text('PSI')],
            [sg.Text('Pressure 4:'), sg.Text('0000000000', key='P4'), sg.Text('PSI')]]

# Combination of all elements
layout = valves + diagram + stages + readings

# Valve states
isValveOpen = [False, False, False, False, False, False]
# Create the Window and Finalize it. Then fullscreen
window = sg.Window('RocketView', layout, grab_anywhere=True)

# Open serial port and print which port is connected
# Also declare buffer string to store serial data

ser = serial.Serial('COM3',9600,timeout=1)
print(ser.name)
buffer = ""

# Command to open valves for ARM event
arm = "ARM"
fire = "FIRE"
dataString = ""

###FIGURE OUT HOW TO ADD A DROP DOWN MENU FOR SELECTING COM PORTS

##FIND WAY TO ADD "ENQUIRE" BUTTON


# Event Loop to process "events" and get the "values" of the inputs
while True:
    event, values = window.read(timeout=10)
    # Button Reactions
    if event is None:
        break
    if event == 'ARM':
        print("arming...")
        isValveOpen[1] = True
        isValveOpen[2] = True
        # Send command to arm
        packet = [0x01, 0x43, 0x30, 0x33, 0x02, 0x41, 0x52, 0x4d, 0x04]
        ser.write(bytearray(packet))
    elif event == 'FIRE':
        print("firing...")
        isValveOpen[3] = True
        isValveOpen[4] = True
        isValveOpen[0] = True
        #time.sleep(6)
        #print('Valve 1 closed. Valve 2 closed. Exciter off')
        isValveOpen[1] = False
        isValveOpen[2] = False
        isValveOpen[0] = False
        packet = [0x01, 0x43, 0x30, 0x34, 0x02, 0x46, 0x49, 0x52, 0x45, 0x04]
        ser.write(bytearray(packet))
    elif event == 'PURGE':
        print("purging...")
        isValveOpen[5] = True
        packet = [0x01, 0x43, 0x30, 0x35, 0x02, 0x50, 0x55, 0x52, 0x47, 0x45, 0x04]
        ser.write(bytearray(packet))
    elif event == 'CLOSE ALL':
        #print('Valve 5 closed')
        #print('Valve 3 closed. Valve 4 closed.')
        print("closing...")
        for x in range(6):
            isValveOpen[x] = False
        packet = [0x01, 0x43, 0x30, 0x35, 0x02, 0x43, 0x4c, 0x4f, 0x53, 0x45, 0x04]
        ser.write(bytearray(packet))

    # Updating GUI to reflect valve states
    for x in range(6):
        if isValveOpen[x] == True:
            window.FindElement(x).Update(button_color=('White', 'Green'))
        else:
            window.FindElement(x).Update(button_color=('White', 'Red'))

    #*****UPDATE PRESSURE READINGS*****
    # Parses serial buffer from microcontroller
    # Converts raw data into float value, used to update GUI
    while ser.in_waiting:
        inChar = ser.read().decode('ASCII')
        buffer = buffer + inChar
        if(inChar == chr(4)):
            if(buffer.find(chr(1)) >= 0):
                buffer = buffer[buffer.find(chr(1)):(buffer.find(chr(4))+1)] # Trim off excess characters before and after packet
                packet_type = buffer[1]

                upperNibble: int = ord(buffer[2])
                lowerNibble: int = ord(buffer[3])
                # UPPER NIBBLE
                if (upperNibble > 0x40): # if a letter
                    upperNibble = upperNibble & 0b00001111 # strip off upper nibble(only indicates that value is a letter)
                    upperNibble = upperNibble + 0b00001001 # upperNibble now equals 0x0A - 0x0F
                else:
                    upperNibble = upperNibble & 0b00001111 # upperNibble now equals 0x00 - 0x09
                upperNibble = upperNibble << 4 # upperNibble now represents upper byte of dataBytes
                # LOWER NIBBLE
                if (lowerNibble > 0x40): # if letter
                    lowerNibble = lowerNibble & 0b00001111 # strip off upper nibble
                    lowerNibble = lowerNibble + 0b00001001 # lowerNibble now equals 0x0A - 0x0F
                lowerNibble = lowerNibble & 0b00001111 # lowerNibble now equals 0x00 - 0x09 if it was a number

                packet_dataSize = upperNibble | lowerNibble # combining upper and lower bytes to make final char(UUUU LLLL)
                dataString = buffer[5:-1] # sets data string of packet to data pulled from _inputString
                buffer = "" # Clear buffer

                # ***  UPDATE PRESSURE READINGS ***
                # ***  CAN WE CHECK THESE CALCULATIONS???
                # ***  5V ON PIN = 28 PSI???
                if(packet_type == 'D'):
                    pdata1 = dataString[dataString.find('A')+1:dataString.find('B')]
                    pdata1 = int(pdata1)*(5.0/1023.0)*(14000.0/2500.0)
                    window.Element('P1').Update(round(pdata1, 2))

                    pdata2 = dataString[dataString.find('B')+1:dataString.find('C')]
                    pdata2 = int(pdata2)*(5.0/1023.0)*(14000.0/2500.0)
                    window.Element('P2').Update(round(pdata2, 2))

                    pdata3 = dataString[dataString.find('C')+1:dataString.find('D')]
                    pdata3 = int(pdata3)*(5.0/1023.0)*(14000.0/2500.0)
                    window.Element('P3').Update(round(pdata3, 2))

                    pdata4 = dataString[dataString.find('D')+1:]
                    pdata4 = int(pdata4)*(5.0/1023.0)*(14000.0/2500.0)
                    window.Element('P4').Update(round(pdata4, 2))
                if(packet_type == 'M'):
                    print(dataString)
            else:
                buffer = "" # If only 1 end of packet is found, data somehow corrupted, clear buffer
window.close()

