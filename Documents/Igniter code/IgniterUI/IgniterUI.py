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

# Event Loop to process "events" and get the "values" of the inputs
while True:
    event, values = window.read(timeout=10)
    # Button Reactions
    if event is None:
        break
    if event == 'ARM':
        print('ARMED')
        isValveOpen[1] = True
        isValveOpen[2] = True
        # Send command to arm
        print("Sending" + arm)
        ser.write(bytearray(arm, 'utf-8'))
        ser.write(bytearray('\3', 'utf-8'))
    elif event == 'FIRE':
        #print('FIRING')
        # timer = threading.Timer(1, igniterLoop)
        # timer.start()
        isValveOpen[3] = True
        isValveOpen[4] = True
        isValveOpen[0] = True
        #time.sleep(6)
        #print('Valve 1 closed. Valve 2 closed. Exciter off')
        isValveOpen[1] = False
        isValveOpen[2] = False
        isValveOpen[0] = False
        ser.write(bytearray(fire, 'utf-8'))
        ser.write(bytearray('\3', 'utf-8'))
    elif event == 'PURGE':
        #print('Valve 5 open')
        isValveOpen[5] = True
        # ser.write('3')
    elif event == 'CLOSE ALL':
        #print('Valve 5 closed')
        #print('Valve 3 closed. Valve 4 closed.')
        for x in range(6):
            isValveOpen[x] = False
        # ser.write('4')

    # Updating GUI to reflect valve states
    for x in range(6):
        if isValveOpen[x] == True:
            window.FindElement(x).Update(button_color=('White', 'Green'))
        else:
            window.FindElement(x).Update(button_color=('White', 'Red'))

    #*****UPDATE PRESSURE READINGS*****
    buffer = buffer + ser.read().decode('utf-8') #assmble string buffer of inbound serial data
    # s = ser.read()
    #hex_string = binascii.hexlify(s).decode('utf-8')

    # Parses serial buffer from microcontroller
    # Expects serial data w/ ',' as delimiter between data elements
    # Ex: 123a,456b,789c,...
    # Converts raw data into float value, used to update GUI
    print(buffer)
    if '\3' in buffer:
        buffer = buffer.replace('\3','')                 # Remove delimiter from buffer string
        print(buffer)
        identifier = buffer[len(buffer)-1]              # Store identifier
        buffer = buffer[:-1]                            # Remove identifier from buffer string
        pressureVal = float(buffer)*(7.0/256.0)         # See calculation note below
            #Pressure Calculation = pdata#*(5.0/1023.0)(14000/2500)
            #Simplified to constant: (7.0/256.0)
        pressureVal = round(pressureVal, 2)             # Round value to 2 decimal places
        if identifier == 'a':
            window.Element('P1').Update(pressureVal)
        elif identifier == 'b':
             window.Element('P2').Update(pressureVal)
        elif identifier == 'c':
             window.Element('P3').Update(pressureVal)
        elif identifier == 'd':
             window.Element('P4').Update(pressureVal)
        buffer = ""                                     # Clear buffer
window.close()

