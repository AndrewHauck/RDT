#include "src/serialPacket/serialPacket.h"
#include "src/serialBuffer/serialBuffer.h"

serialBuffer buffer1;
serialPacket outPacket;
//Pressure transducer analog pin variables
int PT1 = A0;
int PT2 = A1;
int PT3 = A2;
int PT4 = A3;
//Variables for raw data read on analog pins
int pdata1;
int pdata2;
int pdata3;
int pdata4;
//Variable for stage
char stage = 0;
//float refresh_rate = 0.3

void setup() {
  Serial.begin(9600);   // initialize serial
  pinMode(LED_BUILTIN, OUTPUT);
  digitalWrite(LED_BUILTIN, LOW);
}

void loop() {
  pdata1 = analogRead(PT1);
  pdata2 = analogRead(PT2);
  pdata3 = analogRead(PT3);
  pdata4 = analogRead(PT4);  
  String data = String('A' + String(pdata1) + 'B' + String(pdata2) + 'C' + String(pdata3) + 'D' + String(pdata4));
  outPacket.configure(data, 'D');
  outPacket.transmit();
  
  delay(300);

  if(buffer1.isComplete()) //if incoming buffer throws flag
  {
    serialPacket inPacket(buffer1);
    buffer1.flushBuffer();  //clear buffer1
    
    if(inPacket.getType() == 'C')
    {
      if(inPacket.getData() == "ARM")
      {
        digitalWrite(LED_BUILTIN, HIGH);
        stage = 1;
        outPacket.configure("IGNITER ARMED", 'M');
        outPacket.transmit();
      }
      if(inPacket.getData() == "FIRE")
      {
        digitalWrite(LED_BUILTIN, LOW);
        stage = 2;
        outPacket.configure("IGNITER FIRING", 'M');
        outPacket.transmit();
      }
      if(inPacket.getData() == "PURGE")
      {
        digitalWrite(LED_BUILTIN, HIGH);
        stage = 3;
        outPacket.configure("IGNITER PURGING", 'M');
        outPacket.transmit();
      }
      if(inPacket.getData() == "CLOSE")
      {
        digitalWrite(LED_BUILTIN, LOW);
        stage = 0;
        outPacket.configure("IGNITER CLOSE", 'M');
        outPacket.transmit();
      }
    }
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
