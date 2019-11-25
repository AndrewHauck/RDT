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
# test test test

# Igniter diagram
diagram = [[sg.Image('IgniterDiagram.png', key='DIAGRAM', size=(400, 400))]]

# Staged buttons
stages = [[sg.Text('STAGES')],
          [sg.Button('ARM', button_color=('White', 'Red'), key='ARM'),
          sg.Button('FIRE', button_color=('White', 'Red'), key='FIRE'),
          sg.Button('PURGE', button_color=('White', 'Red'), key='PURGE'),
          sg.Button('CLOSE ALL', button_color=('White', 'Red'), key='CLOSE ALL')]]

# Combination of all elements
layout = valves + diagram + stages

# Valve states

isValveOpen = [False, False, False, False, False, False]
# Create the Window and Finalize it. Then fullscreen
window = sg.Window('Igniter GUI', layout, grab_anywhere=True)
#ser = serial.Serial('COM3', baudrate=9600)

# Event Loop to process "events" and get the "values" of the inputs
while True:
    event, values = window.read()
    # Button Reactions
    if event is None:
        break
    if event == 'ARM':
        print('ARMED')
        isValveOpen[1] = True
        isValveOpen[2] = True
        # ser.write('1')
    elif event == 'FIRE':
        print('FIRING')
        # timer = threading.Timer(1, igniterLoop)
        # timer.start()
        isValveOpen[3] = True
        isValveOpen[4] = True
        isValveOpen[0] = True
        time.sleep(6)
        print('Valve 1 closed. Valve 2 closed. Exciter off')
        isValveOpen[1] = False
        isValveOpen[2] = False
        isValveOpen[0] = False
        # ser.write('2')
    elif event == 'PURGE':
        print('Valve 5 open')
        isValveOpen[5] = True
        # ser.write('3')
    elif event == 'CLOSE ALL':
        print('Valve 5 closed')
        print('Valve 3 closed. Valve 4 closed.')
        for x in range(5):
            isValveOpen[x] = False
        # ser.write('4')

    # Updating GUI to reflect valve states
    for x in range(5):
        if x == 0:
            print("Exciter = ", isValveOpen[x])
        else:
            print("Valve ", x, " = ", isValveOpen[x])

        if isValveOpen[x] == True:
            window.FindElement(x).Update(button_color=('White', 'Green'))
        else:
            window.FindElement(x).Update(button_color=('White', 'Red'))
    print("\n")
window.close()

