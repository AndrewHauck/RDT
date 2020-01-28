import os
from datetime import datetime
import time

class Logger(object):
    def __init__(self):
        self.startTime = time.time()
        self.isOpen = False
        self.fil = None # File descriptor of log
        
    def start(self, filepath):
        self.startDate = datetime.now()
        self.fname = "IgniterUILog-" + self.startDate.strftime("%Y%m%d-%H%M%S") + ".txt"
        self.filepath = os.path.join(filepath, self.fname)
        if not os.path.exists(filepath):
            os.makedirs(filepath)
        self.fil = open(self.filepath, 'w+')
        self.isOpen = True
        self.fil.writelines([
            "FileType=text/igniter/pressure\r",
            "FileVersion=0.1\r",
            "StartTime=" + self.startDate.strftime("%Y-%m-%dT%H:%M:%S") + "\r",
            "Title=IgniterPressureLog" + self.startDate.strftime("%Y%m%d-%H%M%S") + "\r",
            "Author=Missouri S&T Rocket Design Team" + "\r",
        ])

    def log(self, *strn, onlyFile: bool=False):
        toWrite = str(round((time.time() - self.startTime), 3)) + ": " + "".join(map(str, strn))
        if onlyFile:
          print(toWrite)
        if self.isOpen:
          self.fil.write(toWrite+"\r\n") # Also include windows line endings
          
    def logFile(self, *strn):
      return self.log(onlyFile=True)

    def halt(self):
        self.isOpen = False
        self.fil.close()

    def is_open(self):
        return self.isOpen
