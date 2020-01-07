#include "Arduino.h"
#include "serialPacket.h"

//----------DEFAULT CONSTRUCTORS----------
serialPacket::serialPacket()
{
  m_dataString = "";
  m_type = 0x00;
  m_dataSize = 0; //max 255
}
serialPacket::serialPacket(String _string)
{
  serialPacket();
  setData(_string);
}
serialPacket::serialPacket(String _string, unsigned char _type)
{
  serialPacket();
  setData(_string);
  setType(_type);
}
serialPacket::serialPacket(serialBuffer _buffer)
{
  serialPacket();
  receive(_buffer.getBuffer());
}
serialPacket::serialPacket(unsigned char _type)
{
  serialPacket();  
  setType(_type);
}
//----------END OF DEFAULT CONSTRUCTORS----------

//----------APPEND FUNCTIONS----------
void serialPacket::append(char &_byte)
{
  m_dataString += _byte;
  m_dataSize++; //size increased by 1 byte
  return;
}
/* WORK IN PROGRESS FUNCTION
void serialPacket::append(char _bytes)
{
  m_dataString = String(m_dataString + _bytes);
  m_dataSize = m_dataSize + temp.length(); //size increased
  return;
}
*/
void serialPacket::append(String _bytes)
{
  m_dataString += _bytes;
  m_dataSize = m_dataSize + _bytes.length(); //size increased
  return;
}
//-----------END OF APPEND FUNCTIONS----------

//----------MUTATOR FUNCTIONS----------
void serialPacket::setData(String _string)
{
  clearData();
  m_dataString = _string;
  m_dataSize = _string.length();
  return;
}
void serialPacket::clearData()
{
  m_dataString.remove(0); //clear stored data string
  m_dataSize = 0;
  return;
}
void serialPacket::setType(char _byte)
{
  m_type = _byte;
  return;
}
void serialPacket::configure(String _string, char _byte)
{
	setData(_string);
	setType(_byte);
}
//----------END OF MUTATOR FUNCTIONS----------

//----------ACCESSOR FUNCTIONS----------
bool serialPacket::isValid() const
{
  if(m_dataSize > 0 && m_type > 0)
    return true;
  return false;
}
unsigned char serialPacket::getSize() const
{
  return m_dataSize;
}
char serialPacket::getType() const
{
  return m_type;
}
String serialPacket::getData() const
{
	return m_dataString;
}
//----------END OF ACCESSOR FUNCTIONS----------

bool serialPacket::transmit()
{
    if(isValid())      //Values will be converted to ascii characters
    {
      //****PRINT START OF PACKET****
      Serial.write(0x01); //"Start of Heading" ASCII character
      
      //****PRINT PACKET TYPE****
      Serial.print(m_type);

      //****PRINT PACKET SIZE****
      char upperNibble = m_dataSize & 0b11110000;  //strip off lower nibble
      upperNibble = upperNibble >> 4; //now storing upper nibble as char (0b0000xxxx)
      if(upperNibble > 0x09)  //if a letter (A-F)
        upperNibble = upperNibble + 0x37; //ascii offset for characters
      else //if a number
        upperNibble = upperNibble + 0x30; //ascii offset for numbers
      Serial.print(upperNibble);
      
      char lowerNibble = m_dataSize & 0b00001111;  //strip off upper nibble
      if(lowerNibble > 0x09)  //if a letter (A-F)
        lowerNibble = lowerNibble + 0x37; //ascii offset for characters
      else //if a number
        lowerNibble = lowerNibble + 0x30; //ascii offset for numbers
	  Serial.print(lowerNibble);

      //****PRINT START OF DATA CHARACTER****
      Serial.write(0x02);

      //****PRINT DATA****
      Serial.print(m_dataString);

      //****PRINT END OF TRANSMISSION CHARACTER****
      Serial.write(0x04);
	  return true;
    }
    return false;
}

bool serialPacket::receive(String &_inputString)
{
    if(_inputString.indexOf(0x01) >= 0 && _inputString.indexOf(0x04) >=0)	//tests if buffer contains both start of packet and end of packet bytes, used to remove junk data
	{
		_inputString = _inputString.substring(_inputString.indexOf(0x01), _inputString.indexOf(0x04));	//trim off excess characters before and after packet
		m_type = _inputString.charAt(1);  //ascii number between 0x30-0x39 (Num 0-9), between 0x41-0x46 (A-F), between 0x61-0x66 (a-f)
		char upperNibble = _inputString.charAt(2);  //ascii for upper nibble of dataBytes
		char lowerNibble = _inputString.charAt(3);  //ascii for lower nibble of dataBytes

		
		//UPPER NIBBLE
		if(upperNibble > 0x40) //if a letter
		{
		  upperNibble = upperNibble & 0b00001111;  //strip off upper nibble (only indicates that value is a letter)
		  upperNibble = upperNibble + 0b00001001;  //upperNibble now equals 0x0A-0x0F
		}
		else  //if a number
		  upperNibble = upperNibble & 0b00001111; //upperNibble now equals 0x00-0x09 
		upperNibble = upperNibble << 4; //upperNibble now represents upper byte of dataBytes
		
		//LOWER NIBBLE
		if(lowerNibble > 0x40) //if letter
		{
		  lowerNibble = lowerNibble & 0b00001111;  //strip off upper nibble
		  lowerNibble = lowerNibble + 0b00001001;  //lowerNibble now equals 0x0A-0x0F
		}
		lowerNibble = lowerNibble & 0b00001111; //lowerNibble now equals 0x00-0x09 if it was a number    

		m_dataSize = upperNibble | lowerNibble; //combining upper and lower bytes to make final char (UUUU LLLL)
		setData(_inputString.substring(5,5+m_dataSize));  //sets data string of packet to data pulled from _inputString
		return true;
	}
	return false;
}
