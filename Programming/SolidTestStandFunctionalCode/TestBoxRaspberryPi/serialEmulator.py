import serial, sys
from time import time, sleep

help = """
This program is designed to take in files where each line starts with a 15-digit timestamp which is followed by data
It will replay the entire file or file set in real time over a specified serial port
Serial port should be specified as the string port and an integer baud rate after a colon

  usage:
    python serialEmulator.py SerialPort:Baud file1[, file2, ...]
    
"""

if len(sys.argv) < 3:
  print(help)
  sys.exit(1)
  
port = sys.argv[1]
files = sys.argv[2:]

lines = [] # List of lines. Each entry should be a two-tuple of float timestamp and string line (including newline)

print("Parsing files")
for file in files:
  numLines = 0
  numErrors = 0
  print("Parsing", file)
  with open(file) as handle:
    for line in handle:
      numLines += 1
      if len(line) <= 15: # If line is too short move on
        numErrors += 1
        continue
      timestamp = line[:15]
      try:
        timestamp = float(timestamp)
      except ValueError:
        numErrors += 1
        continue
      if not (1e9 < timestamp < 1e10): # If not correct number of seconds
        numErrors += 1
        continue
      lines.append((timestamp, line))
  print("Finished file with {:,} lines, {:,} errors. {:0.2%} bad lines".format(numLines, numErrors, numErrors/numLines))
  
print("Acquired {:,} values. Sorting...".format(len(lines)))
lines.sort()

print("Connecting to COM Device")
if port == "TEST":
  port = open("testFile.txt", "w")
else:
  port, baud = port.split(":")
  baud = int(baud)
  port = serial.Serial(port, baud)

print("Program will take {:,} seconds to run! Starting in 5".format(int(lines[-1][0] - lines[0][0])))
for i in reversed(range(5)):
  print(i+1)
  sleep(1)

startTime = time()
startLineTime = lines[0][0]
for i, line in enumerate(lines):
  timestamp, text = line
  sleepTime = (timestamp - startLineTime) - (time() - startTime)
  print("Line {: 9}: Sleeping {:0.6f} seconds".format(i, sleepTime))
  sleep(max(0, sleepTime))
  port.write(line[1])