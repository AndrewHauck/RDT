"""
  This file is designed to properly parse the mixed-output file we get from the Xbee into two separate streams
  One stream will contain temperature data and the other load cell data

"""

from sys import argv, exit
import os.path, time

TIMESTAMP_FMT = "%Y-%m-%d %H:%M:%S"
NUM_THERMOCOUPLES = 4 # For error-checking in XbeeParser

def modifyFilename(filename, prepend, ext=None, split="_"):
  filename, extension = os.path.splitext(filename)
  if ext is None:
    ext = extension
  # Add the majority of the path, followed by the prepend value, splitter, and the desired extension
  return os.path.join(*os.path.split(filename)[:-1], prepend+split+os.path.split(filename)[-1] + ext)

def parseLoadCellFile(filename):
  loadCell = [] # List of 3-tuples time, force, ambient temp
  numBad = 0
  numLines = 0
  try:
    with open(filename) as file:
      for line in file:
        line = line.replace("\t", ",").rstrip() # Convert tabs to commas, remove trailing newline
        # There are some setup lines at the very start, ignore those.
        if "lbs" not in line:
          continue
        numLines += 1
        sepLine = line.split(",") # Split by commas
        if len(sepLine[0]) != 15:
          print("Improper Timestamp Line, skipping:", sepLine)
          numBad += 1
          continue
        try:
          # Catch any lines that are obviously incorrect
          if any(not (-200 < val < 1000) for val in map(float, [sepLine[1], sepLine[4]])) or len(sepLine) != 6:
            print("Improper load cell line:", line)
            numBad += 1
            continue
        except ValueError:
          print("Improper load cell line:", line)
          numBad += 1
          continue
        loadCell.append(tuple(map(float, (sepLine[0], sepLine[1], sepLine[4], sepLine[3]))))
        
  except FileNotFoundError:
    print("This selected file: '", filename,"' does not exist")
    exit(0)
    
  print("Percentage of Invalid Lines: {:0.2f}% out of {} lines".format(numBad/numLines*100, numLines))
  
  return loadCell

def parseTemperatureFile(filename):
  temperatures = [] # List of 3-tuples time, force, ambient temp
  numBad = 0
  numLines = 0
  try:
    with open(filename) as file:
      for line in file:
        # There are some setup lines at the very start, ignore those.
        if line.count("\t") != 4:
          continue
        line = line.replace("\t", ",").rstrip() # Convert tabs to commas, remove trailing newline
        numLines += 1
        sepLine = line.replace("\t",",").rstrip().split(",") # Convert tabs to commas, remove trailing newline, then split
        if len(sepLine[0]) != 15:
          print("Improper Timestamp Line, skipping:", sepLine)
          numBad += 1
          continue
        try:
          # Catch any lines that are obviously incorrect
          if any(not (-200 < val < 1000) for val in map(float, sepLine[1:])) or len(sepLine) != NUM_THERMOCOUPLES+1:
            print("Improper temperatures:", line)
            numBad += 1
            continue
        except ValueError:
          print("Improper temperatures:", line)
          numBad += 1
          continue
        temperatures.append(tuple(map(float, sepLine)))
        
  except FileNotFoundError:
    print("This selected file: '", filename,"' does not exist")
    exit(0)
    
  print("Percentage of Invalid Lines: {:0.2f}% out of {} lines".format(numBad/numLines*100, numLines))
  
  return temperatures


def parseXbeeFile(filename):
  loadCell = [] # List of 3-tuples time, force, ambient temp
  temps = [] # List of tuples time, thermocouples

  numBad = 0
  numLines = 0
  try:
    with open(filename) as file:
      for line in file:
        numLines += 1
        line = line.rstrip() # Remove trailing newline
        sepLine = line.replace("\t",",").split(",")
        if len(sepLine[0]) != 15:
          print("Improper Timestamp Line, skipping:", sepLine)
          numBad += 1
          continue
        
        if "lbs" in line: # All the lines from the load cell have "lbs" in the line
          try:
            if len(sepLine) != 6 or any(not (-200 < val < 1000) for val in map(float, [sepLine[1], sepLine[4]])):
              print("Improper load cell line:", line)
              numBad += 1
              continue
          except ValueError:
            print("Improper load cell line:", line)
            numBad += 1
            continue
          loadCell.append((sepLine[0], sepLine[1], sepLine[4], sepLine[3]))
        else: # If the line did not have "lbs" in it
          try:
            if any(not (-200 < val < 1000) for val in map(float, sepLine[1:])) or len(sepLine) != NUM_THERMOCOUPLES+1:
              print("Improper temperatures:", line)
              numBad += 1
              continue
          except ValueError:
            print("Improper temperatures:", line)
            numBad += 1
            continue
          temps.append(tuple(sepLine))
  except FileNotFoundError:
    print("This selected file: '", filename,"' does not exist")
    exit(0)

  print("Percentage of Invalid Lines: {:0.2f}%".format(numBad/numLines*100))

  # Convert everything to floats to save my sanity
  loadCell = list(map(lambda val: tuple(map(float, val)), loadCell))
  temps    = list(map(lambda val: tuple(map(float, val)), temps))
  
  return loadCell, temps

def writeRawCSV(loadCellVals, tempVals, filename):
  fileThermo = modifyFilename(filename, "Thermo", ".csv")
  fileLoadCell = modifyFilename(filename, "LoadCell", ".csv")
  
  firstLineThermo = ",".join(["Timestamp", "Raw Seconds"] + ["Thermocouple "+str(i+1)+" ºC" for i in range(NUM_THERMOCOUPLES)])+"\n"
  firstLineLoadCell = ",".join(["Timestamp", "Raw Seconds", "Load (lbs)", "Reported Temp"])+"\n"
  
  # Do the same thing for both temp file and load cell file
  for filename, firstLine, values in (
    (fileThermo, firstLineThermo, tempVals),
    (fileLoadCell, firstLineLoadCell, loadCellVals),
  ):
    with open(filename, "w") as file:
      file.write(firstLine)
      for line in values:
        # Assumes that [0] is the float timestamp
        formattedTimestamp = time.strftime(TIMESTAMP_FMT, time.localtime(line[0]))
        file.write(",".join([formattedTimestamp, *map(str, line)]) + "\n")

def writePostProcessCSV(loadCellVals, tempVals, filename):
  # Now that we have written the base files, we search for events
  # "Events" are defined as a 1-second period in which the force readings are 5 pounds over the average
  average = sum([val[1] for val in loadCellVals])/len(loadCellVals)
  buckets = [] # Sets of load readings, each reading having the same second.
  secondValue = None # Initialize this
  readingTemp = []
  for reading in loadCellVals:
    if int(reading[0]) != secondValue:
      secondValue = int(reading[0]) # Go to a new second
      readingTemp = [] # Make a new temp array
      buckets.append(readingTemp) # Put a pointer to this new temp array at the end of buckets
    readingTemp.append(reading)
    
  startEvent = None
  stopEvent = None
  for i, bucket in enumerate(buckets):
    if sum([val[1] for val in bucket])/len(bucket) > (5 + average):
      try:
        startEvent = buckets[i-2][0][0]
      except IndexError:
        startEvent = buckets[i][0][0]
    if startEvent and sum([val[1] for val in bucket])/len(bucket) < (5 + average):
      try:
        stopEvent = buckets[i+2][0][0]
      except IndexError:
        stopEvent = buckets[i][0][0]
        
  if not startEvent: print("No Start Event Found!")
  if not stopEvent: print("No Stop Event Found!")

  tempBuffer = []
  loadBuffer = []
  for reading in loadCellVals:
    if startEvent <= reading[0] <= stopEvent:
      loadBuffer.append((reading[0]-startEvent, reading[1]-average, reading[2]))
  for reading in tempVals:
    if startEvent <= reading[0] <= stopEvent:
      tempBuffer.append((reading[0]-startEvent,) + reading[1:])

  with open(modifyFilename(filename, "output", ".csv"), "w") as file:
    file.write(",".join(["Load Timestamp", "Load (lbs)", "Ambient Temp (ºC)", "", "Temp Timestamp"] + ["Thermocouple "+str(i)+" (ºC)" for i in range(1,4+1)])+"\n")
    for lineNumber in range(max(len(loadBuffer), len(tempBuffer))):
      if lineNumber >= len(loadBuffer):
        file.write(","*5)
      else:
        file.write(",".join(map(str, loadBuffer[lineNumber]))+",,")
      if lineNumber >= len(tempBuffer):
        pass
      else:
        file.write(",".join(map(str, tempBuffer[lineNumber])))
      file.write("\n")
      
      
  try:
    import xlsxwriter as excel
  except ImportError:
    print("No excel writer detected, not writing excel")
  else:
    print("Writing excel file with pretty graphs!")
    workbook = excel.Workbook(modifyFilename(filename, "Excel", ".xlsx"))
    worksheet = workbook.add_worksheet()
    # First write the section headers
    for i, val in enumerate(["Load Timestamp", "Load (lbs)", "Ambient Temp (ºC)", "", "Temp Timestamp"] + ["Thermocouple "+str(i)+" (ºC)" for i in range(1,4+1)]):
      if 0 <= i <= 2:
        worksheet.write_column(chr(ord("A")+i)+"1", [val]+[v[i] for v in loadBuffer])
      if 4 <= i:
        worksheet.write_column(chr(ord("A")+i)+"1", [val]+[v[i-4] for v in tempBuffer])
        
    chart = workbook.add_chart({"type": "scatter", "subtype": "straight"})
    
    loadCategories = ["Sheet1", 1, 0, len(loadBuffer)+1, 0]
    tempCategories = ["Sheet1", 1, 4, len(tempBuffer)+1, 4]
    
    chart.add_series({"categories": loadCategories, "values": ["Sheet1", 1, 1, len(loadBuffer)+1, 1], "name": ["Sheet1", 0, 1]})
    chart.add_series({"categories": loadCategories, "values": ["Sheet1", 1, 2, len(loadBuffer)+1, 2], "name": ["Sheet1", 0, 2], 'y2_axis': True,})
    chart.add_series({"categories": tempCategories, "values": ["Sheet1", 1, 5, len(tempBuffer)+1, 5], "name": ["Sheet1", 0, 5], 'y2_axis': True,})
    chart.add_series({"categories": tempCategories, "values": ["Sheet1", 1, 6, len(tempBuffer)+1, 6], "name": ["Sheet1", 0, 6], 'y2_axis': True,})
    chart.add_series({"categories": tempCategories, "values": ["Sheet1", 1, 7, len(tempBuffer)+1, 7], "name": ["Sheet1", 0, 7], 'y2_axis': True,})
    chart.add_series({"categories": tempCategories, "values": ["Sheet1", 1, 8, len(tempBuffer)+1, 8], "name": ["Sheet1", 0, 8], 'y2_axis': True,})
    
    chart.set_size({"width": 1200, "height": 400})
    chart.set_legend({"position": "bottom"})
    chart.set_x_axis({"name": "Time Since Event Start"})
    chart.set_y_axis({"name": "Force (lbs)"})
    chart.set_y2_axis({"name": "Temperature (ºC)"})
    
    worksheet.insert_chart("A1", chart)
    
    workbook.close()
    # Then write the load cell values
  
  
  
if __name__ == "__main__":
  help = """
  Format of arguments should be
  [none]: Display help
  -x XbeeFile [startTime]: Takes in a processed Xbee file which contains mixed load and thermometer readings
  LoadCellFile ThermocoupleFile OutputFile [startTime]: Three arguments, one is the raw load cell file, the other is the raw thermocouple file, last is output file name
  
  The "startTime" argument indicates a timestamp from which we start checking for the test fire
  """
  if len(argv) == 1:
    print(help)
    exit(0)
  def askHelp():
    print("Program must have necessary number of arguments. Call without arguments to see help")
    exit(1)
  
  # For each of these, the following format is expected
  # loadCellVals: list of tuples (each value is a float) - [timestamp, load (lbs), ambient temp (ºC), raw voltage counts]
  # tempVals: list of tuples (each value is a float) - [timestamp, *temps for each temp reader (ºC)]. Variable number of temp sensors
  startTime = None # Initialize this to none in case its not set
  if argv[1] == "-x": # Xbee Mode
    if len(argv) == 3:
      pass
    elif len(argv) == 4:
      startTime = float(argv[-1])
    else: # Improper number of arguments
      askHelp()
    filenameBase = argv[2] # Just use the xbee file name
    loadCellVals, tempVals = parseXbeeFile(argv[2])
    
  else: # Two files for thermocouples and load cells
    if len(argv) == 4:
      pass # Just fine
    elif len(argv) == 5:
      startTime = float(argv[-1])
    else: # Improper number of arguments
      askHelp()
    filenameBase = argv[3] # Must be specified separately
    loadCellVals = parseLoadCellFile(argv[1])
    time.sleep(3) # Wait for reading the error values for a bit
    tempVals = parseTemperatureFile(argv[2])

  
  if startTime:
    print("Start Time of",startTime,"used. Dropping readings")
    for i in range(len(loadCellVals)):
      if loadCellVals[i][0] >= startTime:
        print("Cutting off loads after",i,"values")
        loadCellVals = loadCellVals[i:]
        break
    for i in range(len(tempVals)):
      if tempVals[i][0] >= startTime:
        tempVals = tempVals[i:]
        print("Cutting off temps after",i,"values")
        break
    
  print("Writing basic CSV files")
  # This will just write out the processed values to CSV with nice descriptive timestamps and column titles
  writeRawCSV(loadCellVals, tempVals, filenameBase)

  # This will find the most likely occurance of an event (the first time 1-second average thrust is >5 lbs the average overall)
  # Then it will write to both CSV and an actual excel file making the graph all nicely :)
  writePostProcessCSV(loadCellVals, tempVals, filenameBase)