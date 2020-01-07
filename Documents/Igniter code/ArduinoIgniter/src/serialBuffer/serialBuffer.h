#ifndef serialBuffer_h
#define serialBuffer_h

#include "Arduino.h"
//*
//* ****SERIAL BUFFER Class****
//*
//*   Coded by Thomas Francois [KXØSTL]
//*   Version 1/4/2020
//*
//*  ***[ Description ]***
//	 This buffer class is sort of an upgraded string to hold data as it comes in from the serial port.
//   Class contains all the functions necessary to respond to serial data, makes handling data easier
//   and more straight forward.
//   ***[ How To Use]***
//   Create a serialBuffer object in global scope of program. In reserved function "serialEvent()," which
//   is executed at end of loop() if serial data arrives, call updateBuffer() inside while loop to give
//   incoming bytes to the buffer to handle.
//   Ex: void serialEvent()
//       {
//         while (Serial.available())
//           buffer1.updateBuffer();
//       }
//   Buffer class reacts to enquiry character, used to clearing of buffer before new data arrives
//   Buffer contains boolean member variable, tells if complete packet has arrived

class serialBuffer
{
  public:
    serialBuffer();
    void flushBuffer();
    void updateBuffer();
    bool isComplete() const;
    String& getBuffer();
  private:
    bool checkForCommand(char _inChar);
    String m_serialRaw;
    bool m_stringComplete;
};

#endif
