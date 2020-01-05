#include "src/serialPacket/serialPacket.h"
#include "src/serialBuffer/serialBuffer.h"

serialBuffer buffer1;
serialPacket packet1;

void setup() {
  Serial.begin(9600);   // initialize serial
}

void loop() {
  // when an end of transmission character arrives
  if (buffer1.isComplete()) //if buffer contains valid raw packet data
  {
    packet1.receive(buffer1.getBuffer()); //extract buffer to packet1
    
    if(packet1.getType() == 'A')
    {
      packet1.transmit();
    }
    packet1.reset();
    buffer1.flushBuffer();  //clear buffer1
  }
}

/*
  SerialEvent occurs whenever a new data comes in the hardware serial RX. This
  routine is run between each time loop() runs, so using delay inside loop can
  delay response. Multiple bytes of data may be available.
*/
void serialEvent() {
  while (Serial.available()) {
    buffer1.updateBuffer();
  }
}
