import threading, os, sys
import serial
import serial.tools.list_ports as list_ports
import atexit
from datetime import datetime
import time
import re

# If we don't read anything from any component serial device in this amount of time,
#   shut down the entire program. (Prevents hung code if a component disconnected)
SERIAL_TIMEOUT = 30

# Serial Numbers of our specific components that we find from connected serial ports
# These will be found after a "SER=" line in list_ports.comports
# This will be a dictionary of component string: list of serial numbers
SERIAL_NUMBERS = {
  "ARDUINO": [],
  "OPENSCALE": [],
  "XBEE": [],
}
SERIAL_NUMBER_FILE = "testFireSerialNumber.txt"

# Baud rates of each component
# NOTE: We use this list to know what components to search for.
COMPONENT_BAUD = {
  "ARDUINO":   115200,
  "OPENSCALE": 115200,
  "XBEE_BAUD": 9600,
}

# Will contain a mapping of component: serial object
# Populated with same keys as COMPONENT_BAUD
SERIAL_OBJS = {}

OUTPUT_DIR = "Test_Fire_Runs"
FILE_EXT = ".txt"
# These will be followed by a number indicating the run
ARDUINO_BASE   = "Thermocouple "
OPENSCALE_BASE = "Load Cell    "

def loadSerialNumbers(serialFile = SERIAL_NUMBER_FILE):
  """
  Loads a serial number file into our dict.
  A serial file should consist of component names in brackets [ARDUINO]
    followed by lines of serial numbers
  
  """
  try:
    with open(serialFile) as file:
      currentHeading = None
      for line in file:
        line = line.rstrip() # Strip trailing newline
        if line.startswith("["):
          currentHeading = line
        elif currentHeading: # Ignore other lines if we have no heading
          # If we don't have this heading, add an entry
          if currentHeading not in SERIAL_NUMBERS:
            SERIAL_NUMBERS[currentHeading] = []
          # Add the line to our list of serial numbers for this one
          SERIAL_NUMBERS[currentHeading].append(line)
      
  except FileNotFoundError as e:
    with open(serialFile, "w") as file:
      # Initialize the file with headings
      for heading in sorted(SERIAL_NUMBERS):
        file.write("["+heading+"]\n")
      
    print("ERROR: No serial number file found, blank one created")
    raise e


def findMatchingPort(serialList):
  """
  Function to find a serial port that matches one of the serial numbers in serialList
  :param serialList: An iterable containing strings of component serial numbers
  :returns: A string address of the COM port matching the serial number, or None
  """
  portList = list_ports.comports()
  for port in portList:
    if any(serialNum in port[2] for serialNum in serialList):
      return port[0]

def componentThread(serialComponent, serialXbee, fileObj, xbeeLock: threading.Lock, stopEvent: threading.Event):
  print("Starting thread", threading.current_thread().name)
  # Continue in this loop until we get the stopEvent
  while not stopEvent.is_set():
    # Get the next line of data from the component
    line = serialComponent.readline()
    if not line: # Indicates the timeout has been exceeded
      stopEvent.set() # Tell other threads to stop
      break # Exit our own loop with getting a line
    
    # Add in the current time just printed as a float with 4 decimal precision
    fullLine = "{:.4}\t".format(time()).encode() + line
    # Write to our file
    fileObj.write(fullLine)
    # Wait for xbee if in use and write to xbee
    with xbeeLock:
      serialXbee.write(fullLine)
    # For good measure, print it out to terminal
    print("Arduino - " + line)
    
  # When done, close all of our ports and files
  serialComponent.close()
  if serialXbee.isOpen():
    serialXbee.close()
  fileObj.close()
 
print("Looking for COM Port Components!")
for component, baud in COMPONENT_BAUD.items():
  port = findMatchingPort(SERIAL_NUMBERS)
  # If there was no component here we can't continue
  if not port:
    print("ERROR: No component found matching a serial number for:", component)
    sys.exit(1)
  # Create the serial connections
  SERIAL_OBJS[component] = ser = serial.Serial(port, baud, timeout = SERIAL_TIMEOUT)
  print("Component '{}' .isOpen() = {}".format(component, ser.isOpen()))
  
# Now we have open serial connections to all necessary components
# We need to create folders and files for all components
if not os.path.isdir(OUTPUT_DIR):
  print("Output directory did not exist, creating")
  os.makedirs(OUTPUT_DIR)

maxNum = 0 # Initialize our maximum.
for dir, subdirs, files in os.walk(OUTPUT_DIR):
  subdirs.clear() # Just in case, don't go into any subdirs
  for file in files:
    name, ext = os.path.splitext(file)
    if ext == FILE_EXT: # If the file matches our extension, check it.
      numMatch = re.search("\d+$", name) # Find numbers at the end of the file
      if numMatch: # If there were numbers at the end of the file
        # Check if these numbers are higher than existing numbers
        num = int(numMatch.group())
        if num > maxNum:
          maxNum = num
# Now we have found what this run should be
runNumber = str(maxNum + 1)
print("This is run number", runNumber,"!")

# Now we make our files
arduinoFile   = open(os.path.join(OUTPUT_DIR, ARDUINO_BASE+runNumber+FILE_EXT), "wb")
openscaleFile = open(os.path.join(OUTPUT_DIR, OPENSCALE_BASE+runNumber+FILE_EXT), "wb")

# Now we make our threads
stopEvent = threading.Event()
xbeeLock  = threading.Lock()
# Readability alias
ardu = SERIAL_OBJS["ARDUINO"]
opsc = SERIAL_OBJS["OPENSCALE"]
xbee = SERIAL_OBJS["XBEE"]

arduinoThread   = threading.Thread(target=componentThread, args=(ardu, xbee, xbeeLock, arduinoFile, stopEvent), name="Arduino")
openscaleThread = threading.Thread(target=componentThread, args=(opsc, xbee, xbeeLock, openscaleFile, stopEvent), name="Openscale")

# Start running each thread
arduinoThread.start()
openscaleThread.start()

# Wait for each thread to finish
# This can be exited with a KeyboardInterrupt or maybe any other error
# Each thread should be waiting for the stop signal, and should stop
#   if any component takes more than SERIAL_TIMEOUT to do a read
try:
  arduinoThread.join()
  openscaleThread.join()
except:
  stopEvent.set()
 