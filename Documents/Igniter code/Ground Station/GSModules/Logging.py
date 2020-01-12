import os
from datetime import datetime
import time

class Logger(object):
    def __init__(self):
        self.startTime = time.time()
        self.isOpen = False
    def start(self, filepath):
        self.startDate = datetime.now()
        self.fname = "IgniterUILog-" + self.startDate.strftime("%Y%m%d-%H%M%S") + ".txt"
        self.filepath = os.path.join(filepath, self.fname)
        if not os.path.exists(filepath):
            os.makedirs(filepath)
        global fil
        fil = open(self.filepath, 'w+')
        self.isOpen = True
        fil.writelines([
            "FileType=text/igniter/pressure\r",
            "FileVersion=0.1\r",
            "StartTime=" + self.startDate.strftime("%Y-%m-%dT%H:%M:%S") + "\r",
            "Title=IgniterPressureLog" + self.startDate.strftime("%Y%m%d-%H%M%S") + "\r",
            "Author=Missouri S&T Rocket Design Team" + "\r",
        ])
    def log(self, strn):
        fil.write(str(round((time.time() - self.startTime), 3)) + ": " + strn)
    def halt(self):
        self.isOpen = False
        fil.close()
    def is_open(self):
        return self.isOpen
