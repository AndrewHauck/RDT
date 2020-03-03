"""
  This file is designed to fix Jack's mistakes in which he saved the raw hex output from the XBEE to file
    instead of properly formatting the file.
  Unfortunately, for whatever reason we also received some lines that were mal-formed. Some had times partly cut off,
    others had multiple lines mushed into one. Did not see any with lines interlaced as sometimes happens with multithread, so that's good.

"""

from sys import argv, exit
import os.path

try:
  filename = argv[1]
except IndexError:
  print("The first argument should be the file to fix")
  exit(1)
  
  
try:
  with open(filename) as file:
    # Ignore the first line because it should be a header line
    theFile = file.readlines()[1:]
except FileNotFoundError:
  print("This selected file: '", filename,"' does not exist")
  exit(0)

fullText = ""
for line in theFile:
  line = line[35:-1] # First 35 characters are timing information and a colon. Last is a newline
  # Interpret each pair of characters as a hexidecimal number.
  line = "".join([chr(int(line[i:i+2], 16)) for i in range(0, len(line), 2)])
  # Just for our use, replace tabs with commas and normalize newlines
  line = line.replace("\t", ",").replace("\r\n", "\n").replace("\r", "\n")
  fullText += line
  
lines = fullText.split("\n") # Then split by line
# Make a filename that has "fixed" prepend to it while being the same path
fixedFileName = os.path.join(*os.path.split(filename)[:-1], "fixed_"+os.path.split(filename)[-1])

malformed_lines = 0
with open(fixedFileName, "w") as file:
  for line in lines: # Go through each line to see if its valid
    # "Valid" means that it has 4 or 5 commas (depending on which arduino it came from) and it starts with a timestamp starting with 157
    if line.count(",") not in (4, 5) or not line.startswith("157"):
      # If it isn't valid, print it out as malformed
      print("Malformed line:", line)
      malformed_lines += 1
      continue
    # If its valid, write it to file
    file.write(line+"\n")

# Give statistics at the end.
print("Report:")
print("Malformed Lines:", malformed_lines)
print("Percent of Total Lines:", round(malformed_lines/len(lines)*100, 2), "%")