# This module is designed to make the sending and receiving of serial packets simple to the programmer
# Packet format documentation can be found in "Igniter code\packetProtocol.txt"
import serial

# Constants for various interstitials in the message
B_START = bytearray([0x1])
B_MSG   = bytearray([0x2])
B_END   = bytearray([0x4])

def sendMessage(handle: serial.Serial, msgType: str, msg: str) -> bool:
  """
  This function sends a message using our serial communication protocol. Inputs longer than
    desired are truncated
  param handle: The serial port handle that we write messages through
  param msgType: A single character that represents the message to be sent
  param msg: The message to be sent over serial. Can only be 255 characters long
  returns: True if the message was sent in its entirety, false otherwise
  """
  # Convert all to bytearrays
  msgType = msgType[0].encode("utf-8")
  msg     = msg[:255].encode("utf-8")
  # Organize our message according to spec
  toSend = B_START + msgType + "{:02X}".format(len(msg)) + B_MSG + msg + B_END
  numSent = handle.write(toSend) # Double check that we sent the full message
  return numSent == len(toSend) # Returns true if we sent all bytes