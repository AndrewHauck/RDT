import PySimpleGUI as sg

diagram = sg.Image('ArduinoUnoImg1.png', key='DIAGRAM')

left_col = [[sg.Button("Pin A" + str(0), button_color=('White', 'Red'), key="ConfigPinA" + str(0))],
            [sg.Button("Pin A" + str(1), button_color=('White', 'Red'), key="ConfigPinA" + str(1))],
            [sg.Button("Pin A" + str(2), button_color=('White', 'Red'), key="ConfigPinA" + str(2))],
            [sg.Button("Pin A" + str(3), button_color=('White', 'Red'), key="ConfigPinA" + str(3))],
            [sg.Button("Pin A" + str(4), button_color=('White', 'Red'), key="ConfigPinA" + str(4))],
            [sg.Button("Pin A" + str(5), button_color=('White', 'Red'), key="ConfigPinA" + str(5))],]

right_col_buttons = [[sg.Button("Pin " + str(13), button_color=('White', 'Red'), key="ConfigPin" + str(13))],
                     [sg.Button("Pin " + str(12), button_color=('White', 'Red'), key="ConfigPin" + str(12))],
                     [sg.Button("Pin " + str(11), button_color=('White', 'Red'), key="ConfigPin" + str(11))],
                     [sg.Button("Pin " + str(10), button_color=('White', 'Red'), key="ConfigPin" + str(10))],
                     [sg.Button("Pin " + str(9), button_color=('White', 'Red'), key="ConfigPin" + str(9))],
                     [sg.Button("Pin " + str(8), button_color=('White', 'Red'), key="ConfigPin" + str(8))],
                     [sg.Button("Pin " + str(7), button_color=('White', 'Red'), key="ConfigPin" + str(7))],
                     [sg.Button("Pin " + str(6), button_color=('White', 'Red'), key="ConfigPin" + str(6))],
                     [sg.Button("Pin " + str(5), button_color=('White', 'Red'), key="ConfigPin" + str(5))],
                     [sg.Button("Pin " + str(4), button_color=('White', 'Red'), key="ConfigPin" + str(4))],
                     [sg.Button("Pin " + str(3), button_color=('White', 'Red'), key="ConfigPin" + str(3))],
                     [sg.Button("Pin " + str(2), button_color=('White', 'Red'), key="ConfigPin" + str(2))],
                     [sg.Button("Pin " + str(1), button_color=('White', 'Red'), key="ConfigPin" + str(1))],
                     [sg.Button("Pin " + str(0), button_color=('White', 'Red'), key="ConfigPin" + str(0))],]

layout = [[sg.Text("This is a test")], [sg.Column(left_col), diagram, sg.Column(right_col_buttons)]]
config_active = False
#configureWindow = sg.Window('Arduino Configuration', layout, grab_anywhere=True, resizable=True)
"""
while True:
    event, values = configureWindow.read(timeout=10)
    if event is None:
        break
    if "ConfigPin" in event:
        name = "Main CH4"
        pin = 4
        if event == "ConfigPin" + str(pin):
            configureWindow.element("ConfigPin" + str(pin)).Update(name)
"""