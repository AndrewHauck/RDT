#include "src/serialPacket/serialPacket.h"
#include "src/serialBuffer/serialBuffer.h"
#include "src/valves/valves.h"

#define OPEN HIGH
#define CLOSE LOW

serialBuffer buffer1; //Serial Buffer object used to store incoming serial data
serialPacket outPacket; //Packet object used to format data being sent out serial port

const int PT[4] = {A0, A1, A2, A3}; //Pressure transducer analog pin variables
int pdata[4] = {0}; //Variables for raw data read on analog pins

//Pins for valves/pin_Igniter
// [0],     [1],     [2],     [3],     [4], [5]
// CH4Main, GOXMain, CH4Fire, GOXFire, N2,  Igniter
valves vs;  //Valves object used to store and control pin states for valves


//float refresh_rate = 0.3

void setup() {
  Serial.begin(9600);   // initialize serial
  pinMode(LED_BUILTIN, OUTPUT);
  digitalWrite(LED_BUILTIN, LOW);
  int pins[6] = {1,2,3,4,5,6};
  vs.setPins(pins);
}

void loop() {
  for(int i=0; i<4; i++)
    pdata[i] = analogRead(PT[i]);
  outPacket.configure(String('A' + String(pdata[0]) + 'B' + String(pdata[1]) + 'C' + String(pdata[2]) + 'D' + String(pdata[3])), 'D');
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
        bool states[6] = {OPEN, OPEN, CLOSE, CLOSE, CLOSE, CLOSE};
        vs.setStates(states);
        vs.transmit();
        
        outPacket.configure("IGNITER ARMED", 'M');
        outPacket.transmit();
      }
      if(inPacket.getData() == "FIRE")
      {
        digitalWrite(LED_BUILTIN, LOW);
        bool states[6] = {OPEN, OPEN, OPEN, OPEN, CLOSE, CLOSE};
        vs.setStates(states);
        vs.transmit();
                
        outPacket.configure("IGNITER FIRING", 'M');
        outPacket.transmit();
      }
      if(inPacket.getData() == "PURGE")
      {
        digitalWrite(LED_BUILTIN, HIGH);
        bool states[6] = {CLOSE, CLOSE, OPEN, OPEN, OPEN, CLOSE};
        vs.setStates(states);
        vs.transmit();
        
        outPacket.configure("IGNITER PURGING", 'M');
        outPacket.transmit();
      }
      if(inPacket.getData() == "CLOSE")
      {
        digitalWrite(LED_BUILTIN, LOW);
        bool states[6] = {CLOSE, CLOSE, CLOSE, CLOSE, CLOSE, CLOSE};
        vs.setStates(states);
        vs.transmit();
        
        outPacket.configure("IGNITER CLOSED", 'M');
        outPacket.transmit();
      }
    }
    if(inPacket.getType() == 'V')
    {
      char pin = inPacket.getData().toInt();
      vs.toggleSingle(pin);
      vs.transmit();

      outPacket.configure("VALVE TOGGLED", 'M');
      outPacket.transmit();
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
    if(buffer1.updateBuffer())
    {
      /*
      switch (stage){
        case 1: outPacket.configure("pin_Igniter ARMED", 'M'); outPacket.transmit(); break;
        case 2: outPacket.configure("pin_Igniter FIRING", 'M'); outPacket.transmit(); break;
        case 3: outPacket.configure("pin_Igniter PURGING", 'M'); outPacket.transmit(); break;
        case 0: outPacket.configure("pin_Igniter CLOSING", 'M'); outPacket.transmit(); break;
      }
      */
    }
  }
}
