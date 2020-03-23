import serial.tools.list_ports as list_ports

def loadSerialNumbers(serialFile, serialNumbers = None):
  """
  Loads a serial number file into our dict.
  A serial file should consist of component names in brackets [ARDUINO]
    followed by lines of serial numbers
    
  Example File matching {"ARDUINO": [], "XBEE": [], "OPENSCALE": []}
    [ARDUINO]
    64935343733351415081
    [XBEE]
    DN01J0HD
    DN0509M8
    [OPENSCALE]
    DN03GPZS
    
  :returns: A dict of COMPONENT_NAME: [list of serial numbers as strings]
  """
  if not serialNumbers:
    serialNumbers = {}
  
  defaultHeadings = list(serialNumbers)
  
  try:
    with open(serialFile) as file:
      currentHeading = None
      for line in file:
        line = line.rstrip() # Strip trailing newline
        if line.startswith("["):
          currentHeading = line[1:-1]
        elif currentHeading: # Ignore other lines if we have no heading
          # If we don't have this heading, add an entry
          if currentHeading not in serialNumbers:
            serialNumbers[currentHeading] = []
          # Add the line to our list of serial numbers for this one
          serialNumbers[currentHeading].append(line)
          
    # If we have loaded file and not all headings have a component associated, error
    if not all(len(serialNumbers[key]) > 0 for key in defaultHeadings):
      raise ValueError("Not all default headings have associated serial devices in config files")
      
  except FileNotFoundError as e:
    with open(serialFile, "w") as file:
      # Initialize the file with headings
      for heading in sorted(serialNumbers):
        file.write("["+heading+"]\n")
    
    if len(defaultHeadings) > 0: # If there was a default set, error that we don't have values
      print("ERROR: No serial number file found, blank one created")
      raise e
    
  return serialNumbers
  

def findMatchingPort(serialList):
  """
  Function to find a serial port that matches one of the serial numbers in serialList
  :param serialList: An iterable containing strings of desired component serial numbers
  :returns: A string address of the COM port matching the serial number, or None
    This value can be passed to serial.Serial to make a serial object
  """
  portList = list_ports.comports()
  print("Searching for any Serial of: ", serialList)
  for port in portList:
    print("Port:", list(port))
    if any(serialNum in port[2] for serialNum in serialList):
      print("Matches!")
      return port[0]
  else:
    print("No port matches!")
      
      
def printComPorts():
  """
  Displays information about the components attached to the computer's COM ports
  Values should be "Address", "Name", "Serial Number"
  """
  portList = list_ports.comports()
  for port in portList:
    print(" | ".join(port))
    
    
if __name__ == "__main__":
  print("Printing out information on serial ports")
  printComPorts()