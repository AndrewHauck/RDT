import PySimpleGUI as sg

diagram = sg.Image('ArduinoUnoImg1.png', key='DIAGRAM')

left_col = []
for i in range(5+1):
  left_col.append([sg.Button("Pin A" + str(i), button_color=('White', 'Red'), key="ConfigPinA" + str(i))])
  

right_col_buttons = []
for i in reversed(range(13+1)):
  right_col_buttons.append([sg.Button("Pin " + str(i), button_color=('White', 'Red'), key="ConfigPin" + str(i))])


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