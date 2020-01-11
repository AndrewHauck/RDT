#include "src/serialPacket/serialPacket.h"
#include "src/serialBuffer/serialBuffer.h"

#define OPEN HIGH
#define CLOSE LOW

serialBuffer buffer1;
serialPacket outPacket;
//Pressure transducer analog pin variables
const int PT[4] = {A0, A1, A2, A3};

//Variables for raw data read on analog pins
int pdata[4] = {0};

//Pins for valves/pin_Igniter
// [0],     [1],     [2],     [3],     [4], [5]
// CH4Main, GOXMain, CH4Fire, GOXFire, N2,  Igniter
const int valvePins[6] = {1,2,3,4,5,6};
/*
const int pin_CH4Main = 1;
const int pin_GOXMain = 2;
const int pin_CH4Fire = 3;
const int pin_GOXFire = 4;
const int pin_N2 = 5;
const int pin_Igniter = 6;
*/

//Current states of each valve/igniter
// [0],     [1],     [2],     [3],     [4], [5]
// CH4Main, GOXMain, CH4Fire, GOXFire, N2,  Igniter
bool valveStates[6];

//Variable for stage
char stage = 0;
//float refresh_rate = 0.3

void setup() {
  Serial.begin(9600);   // initialize serial
  pinMode(LED_BUILTIN, OUTPUT);
  digitalWrite(LED_BUILTIN, LOW);
  for(int i=0; i<6; i++){
    pinMode(valvePins[i], OUTPUT);
    digitalWrite(valvePins[i], CLOSE);
    valveStates[i] = CLOSE;
  }
}

void loop() {
  for(int i=0; i<4; i++)
    pdata[i] = analogRead(PT[i]);
  //String data = String('A' + String(pdata[0]) + 'B' + String(pdata[1]) + 'C' + String(pdata[2]) + 'D' + String(pdata[3]));
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
        stage = 1;
        valveStates[0] = OPEN;
        valveStates[1] = OPEN;
        valveStates[2] = CLOSE;
        valveStates[3] = CLOSE;
        valveStates[4] = CLOSE;
        valveStates[5] = CLOSE;
        
        outPacket.configure("", 'V');
        for(int i=0; i<6; i++)
        {
          digitalWrite(valvePins[i], valveStates[i]);
          outPacket.append(valveStates[i]+0x30);
        }
        outPacket.transmit();
        
        outPacket.configure("IGNITER ARMED", 'M');
        outPacket.transmit();
      }
      if(inPacket.getData() == "FIRE")
      {
        digitalWrite(LED_BUILTIN, LOW);
        stage = 2;
        valveStates[0] = OPEN;
        valveStates[1] = OPEN;
        valveStates[2] = OPEN;
        valveStates[3] = OPEN;
        valveStates[4] = CLOSE;
        valveStates[5] = CLOSE;
        
        outPacket.configure("", 'V');
        for(int i=0; i<6; i++)
        {
          digitalWrite(valvePins[i], valveStates[i]+0x30);
          outPacket.append(valveStates[i]+0x30);
        }
        outPacket.transmit();
                
        outPacket.configure("IGNITER FIRING", 'M');
        outPacket.transmit();
      }
      if(inPacket.getData() == "PURGE")
      {
        digitalWrite(LED_BUILTIN, HIGH);
        stage = 3;
        valveStates[0] = CLOSE;
        valveStates[1] = CLOSE;
        valveStates[2] = OPEN;
        valveStates[3] = OPEN;
        valveStates[4] = OPEN;
        valveStates[5] = CLOSE;
        
        outPacket.configure("", 'V');
        for(int i=0; i<6; i++)
        {
          digitalWrite(valvePins[i], valveStates[i]);
          outPacket.append(valveStates[i]+0x30);
        }
        outPacket.transmit();
        
        outPacket.configure("IGNITER PURGING", 'M');
        outPacket.transmit();
      }
      if(inPacket.getData() == "CLOSE")
      {
        digitalWrite(LED_BUILTIN, LOW);

        valveStates[0] = CLOSE;
        valveStates[1] = CLOSE;
        valveStates[2] = CLOSE;
        valveStates[3] = CLOSE;
        valveStates[4] = CLOSE;
        valveStates[5] = CLOSE;
        
        outPacket.configure("", 'V');
        for(int i=0; i<6; i++)
        {
          digitalWrite(valvePins[i], valveStates[i]);
          outPacket.append(valveStates[i]+0x30);
        }
        outPacket.transmit();
        
        outPacket.configure("IGNITER CLOSED", 'M');
        outPacket.transmit();
      }
    }
    if(inPacket.getType() == 'V')
    {
      char pin = inPacket.getData().toInt();
      valveStates[pin] = !valveStates[pin];
      
      outPacket.configure("", 'V');
      for(int i=0; i<6; i++)
      {
        digitalWrite(valvePins[i], valveStates[i]);
        outPacket.append(valveStates[i]+0x30);
      }
      outPacket.transmit();

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
