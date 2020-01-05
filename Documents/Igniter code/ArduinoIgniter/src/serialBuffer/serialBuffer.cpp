#include "Arduino.h"
#include "serialBuffer.h"

serialBuffer::serialBuffer()
{
  m_serialRaw = "";
  m_stringComplete = false;
  m_serialRaw.reserve(200);   // reserve 200 bytes for the serialRaw string
}
void serialBuffer::updateBuffer()
{
  char inChar = (char)Serial.read();    // get the new byte
  m_serialRaw += inChar;    // add it to the serialRaw
  checkForCommand(inChar);
}
void serialBuffer::checkForCommand(char _inChar)
{
    if(_inChar == 0x05)  //if computer sent enquiry
    {
      Serial.write(0x06);  //acknowledge
      flushBuffer(); //clear buffer
      //this is incase of error
      //receiving data could get corrupted or incomplete, sending 0x05 (enquiry character) to arduino
      //will clear the stored data and returns if arduino is running and listening
    }
    
    // if end of transmission, set a flag so the main loop can do something with data
    if(_inChar == 0x04)
      m_stringComplete = true;
}
void serialBuffer::flushBuffer()
{
  m_serialRaw = "";
  m_stringComplete = false;
}
bool serialBuffer::isComplete() const
{
  return m_stringComplete;
}
String& serialBuffer::getBuffer()
{
  return m_serialRaw;
}
