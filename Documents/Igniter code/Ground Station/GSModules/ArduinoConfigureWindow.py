import PySimpleGUI as sg
from os.path import join
import serial as ser

class CFGWindow(object):
    def __init__(self):
        self.active = False
        self.connectedMC = ""  # Connected microcontroller type
        self.window = None
        self.dragging = False
        self.grabbedItem = None
        self.buttons_pos = {  "A": {
                                    "X": 8,
                                    "Y": {
                                        0: 593,
                                        1: 620,
                                        2: 647,
                                        3: 674,
                                        4: 701,
                                        5: 728}},
                                "D": {
                                    "X": 680,
                                    "Y": {
                                        13: 361,
                                        12: 388,
                                        11: 415,
                                        10: 442,
                                        9: 469,
                                        8: 496,
                                        7: 539,
                                        6: 566,
                                        5: 593,
                                        4: 620,
                                        3: 647,
                                        2: 674,
                                        1: 701,
                                        0: 728}}}
# THIS IS A DIFFERENT WAY OF STORING THE XY VALUES, LET ME KNOW IF THIS WOULD BE BETTER - Thomas
        # self.buttons_pos = {"A":{
        #                         0: (8,593),
        #                         1: (8,620),
        #                         2: (8,647),
        #                         3: (8,674),
        #                         4: (8,701),
        #                         5: (8,728),},
        #                     "D":{
        #                         13: (680, 361),
        #                         12: (680, 388),
        #                         11: (680, 415),
        #                         10: (680, 442),
        #                         9: (680, 469),
        #                         8: (680, 496),
        #                         7: (680, 539),
        #                         6: (680, 566),
        #                         5: (680, 593),
        #                         4: (680, 620),
        #                         3: (680, 647),
        #                         2: (680, 674),
        #                         1: (680, 701),
        #                         0: (680, 728),}}
        self.graph_items = {"ID": {
                            "img": {
                                "A": {
                                    0: None,
                                    1: None,
                                    2: None,
                                    3: None,
                                    4: None,
                                    5: None},
                                "D": {
                                    13: None,
                                    12: None,
                                    11: None,
                                    10: None,
                                    9: None,
                                    8: None,
                                    7: None,
                                    6: None,
                                    5: None,
                                    4: None,
                                    3: None,
                                    2: None,
                                    1: None,
                                    0: None},},
                            "txt": {
                                "A": {
                                    0: None,
                                    1: None,
                                    2: None,
                                    3: None,
                                    4: None,
                                    5: None},
                                "D": {
                                    13: None,
                                    12: None,
                                    11: None,
                                    10: None,
                                    9: None,
                                    8: None,
                                    7: None,
                                    6: None,
                                    5: None,
                                    4: None,
                                    3: None,
                                    2: None,
                                    1: None,
                                    0: None},},},
        }
    def getLayout(self):
        graph = [sg.Graph(
            canvas_size=(850, 795),
            graph_bottom_left=(0, 795),
            graph_top_right=(800, 0),
            key="DIAGRAM",
            change_submits=True,
            drag_submits=True,)]
        title = [sg.Text("Arduino Configuration", justification="center", size=(45,1), font=("Helvetica", 25))]
        load = [sg.Button("Load Arduino", button_color=('White', 'Red'), key="LOAD"), sg.Text("Detected Microcontroller: " + self.connectedMC, justification="center", size=(107,1))]
        layout = [title, load, graph]
        return layout
    def read(self):
        if self.active:
            cfgEvent, cfgValues = self.window.read(timeout=100)
            if cfgEvent is None or cfgEvent == "Exit":
                self.active = False
                self.connectedMC = None
                self.window.Close()
            elif "LOAD" in cfgEvent:
                print("Button Pressed")
            elif "DIAGRAM" in cfgEvent:
                x, y = cfgValues["DIAGRAM"]  # X and Y coordinates of mouse-click event in DIAGRAM
                self.grabbedItem = self.window.Element("DIAGRAM").GetFiguresAtLocation((x, y))  # Returns tuple of elements clicked on
                if len(self.grabbedItem) > 1:    # if mouse clicked over some amount of items
                    self.grabbedItem = self.grabbedItem[1] # "Grab" the bubble
                    test = [key for (key, value) in self.graph_items["ID"]["img"]["A"].items() if value == self.grabbedItem]
                    print(test)
                    self.dragging = True

                if self.grabbedItem:
                    self.window.Element("DIAGRAM").delete_figure(self.grabbedItem)
                    self.graph_items["ID"]["img"]["A"][test] = self.window.Element("DIAGRAM").DrawImage(filename=(join("img", 'ConfigButtonRed.png')), location=(self.getButtonPos("D", x)))
                    #self.graph_items["ID"]["txt"]["D"][test] = self.window.Element("DIAGRAM").DrawText("D" + str(x),location=(self.getTextPos("D", x)), color="black", font=("Helvetica", 14))
            elif "+UP" in cfgEvent:
                self.dragging = False
                self.window.Element("DIAGRAM").delete_figure(self.grabbedItem)
                # if cfgEvent.endswith('+UP'):  # Effect takes place on mouse-click up event
                #     x, y = cfgValues["DIAGRAM"]  # X and Y coordinates of mouse-click up event
                #     pinSelect = self.window.Element("DIAGRAM").GetFiguresAtLocation(
                #         (x, y))  # Returns tuple of elements clicked on
                #     if len(pinSelect) > 1:
                #         print(pinSelect[1])
        elif not self.active and self.connectedMC == "328P":
            self.window = self.buildWindow()
            self.window.Element("DIAGRAM").DrawImage(filename=(join("img", 'ArduinoUnoImg.png')), location=(0, 0))
            for x in range(13 + 1):
                self.graph_items["ID"]["img"]["D"][x] = self.window.Element("DIAGRAM").DrawImage(filename=(join("img", 'ConfigButtonRed.png')), location=(self.getButtonPos("D", x)))
                self.graph_items["ID"]["txt"]["D"][x] = self.window.Element("DIAGRAM").DrawText("D" + str(x), location=(self.getTextPos("D", x)), color="black", font=("Helvetica", 14))
            for x in range(5 + 1):
                self.graph_items["ID"]["img"]["A"][x] = self.window.Element("DIAGRAM").DrawImage(filename=(join("img", 'ConfigButtonRed.png')), location=(self.getButtonPos("A", x)))
                self.graph_items["ID"]["txt"]["A"][x] = self.window.Element("DIAGRAM").DrawText("A" + str(x), location=(self.getTextPos("A", x)), color="black", font=("Helvetica", 14))
            self.active = True
    def setMC(self, mc):
        self.connectedMC = mc
    def getMC(self):
        return self.connectedMC
    def setActive(self, state: bool):
        self.active = state
    def isActive(self):
        return self.active
    def buildWindow(self):
        tmp = self.getLayout()
        return sg.Window('Arduino Configuration', tmp, grab_anywhere=False, resizable=True, finalize=True)
    def getButtonPos(self, type, num):
        x = self.buttons_pos[type]["X"]
        y = self.buttons_pos[type]["Y"][num]
        return (x,y)
    def getTextPos(self, type, num):
        x = self.buttons_pos[type]["X"] + 57
        y = self.buttons_pos[type]["Y"][num] + 12
        return (x,y)