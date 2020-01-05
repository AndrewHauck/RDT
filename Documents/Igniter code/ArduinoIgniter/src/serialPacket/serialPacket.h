#ifndef serialPacket_h
#define serialPacket_h

#include "Arduino.h"
//*
//* ****SERIAL PACKET Class****
//*
//*   Coded by Thomas Francois [KXØSTL]
//*   Version 1/4/2020
//*
//*  ***[ Description ]***
//   Packets behave like a bin to throw and assemble data before it is to be sent or recieved via the
//   serial port. Packets need 2 things to function: Data(String), and Type(Hex of ASCII Letter or Number).
//   Packets are formatted and sent via serial when transmit() is called.
//   Packets are unpacked automatically when receive() is given a string containing a packet.
//   The packets, when sent or received via serial, have the following format:
//-|----------||---------------||--------------||--------------------------------||-------------||---------------||---------------|
// | Position ||       0       ||       1      ||            2 & 3               ||      4      || 5 + Pos. 2&3  ||     Last      |
//-|----------||---------------||--------------||--------------------------------||-------------||---------------||---------------|
// |   Name   ||   Start of    ||    Packet    ||       Num of Data Bytes        ||   Start of  ||     Data      ||    End of     |
// |          ||   Packet      ||     Type     ||       (in hex, max 255)        ||   Data      ||     Bytes     ||    Packet     |
//-|----------||---------------||--------------||--------------------------------||-------------||---------------||---------------|
// | Byte In  || 0x01 "Start of|| Hex of ASCII || Ex: if 20 data bytes, 20=0x14, || 0x02 "Start ||  ASCII        || 0x04 "End of  |
// |  ASCII   || Transmission" || Letter/Num   || characters 1 and 4 to be sent  ||   of Text"  ||  Nums/Letters || Transmission" |
//-|----------||---------------||------------------------------------------------||------------------------------------------------
//***[ Main Functions ]***
//   Data is added using setData() or append() functions. Data is retrieved using getData().
//   Type is set using setType().
//   isValid() returns if packet is complete enough to send (type and data specified).
//   transmit() sends packet via serial in format listed above (if valid)
//   receive() populates a packet with given packet string (if formated as shown above)

class serialPacket
{
  public:
    serialPacket();
    serialPacket(String _string);
    serialPacket(unsigned char _type);
    serialPacket(String _string, unsigned char _type);
    void append(char &_byte);   //append 1 byte to end of data string
    void append(char _bytes); //append byte array to end of data string
    void append(String _bytes); //append string to end of data string
    void setData(String _string); //clear and set data string
	void reset();	//clears packet back to default
    void setType(unsigned char _byte); //set packet type byte
    bool isValid() const; //check if packet is complete enough to be sent
    unsigned char getSize() const;  //returns size (num of bytes) of data string
    unsigned char getType() const;  //returns type (1 byte character) of packet
    String getData() const;	//returns data string inside packet
    bool transmit();  //attempts to transmit packet, returns false if failed
    bool receive(String &_inputString);	//parses through given string and trys to populate itself
	
	//****RECEIVE() STILL NEEDS TO VERIFY IF GIVEN STRING IS VALID****
  private:
    void clearData();	//empty packet of data
    String m_dataString;
    unsigned char m_dataSize;  //size of packet in num of bytes
    char m_type;  //ASCII character, 0-9 or A-Z
};

#endif
