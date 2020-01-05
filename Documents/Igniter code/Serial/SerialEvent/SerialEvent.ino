/*
  Serial Event example

  When new serial data arrives, this sketch adds it to a String.
  When a newline is received, the loop prints the string and clears it.

  A good test for this is to try it with a GPS receiver that sends out
  NMEA 0183 sentences.

  NOTE: The serialEvent() feature is not available on the Leonardo, Micro, or
  other ATmega32U4 based boards.

  created 9 May 2011
  by Tom Igoe

  This example code is in the public domain.

  http://www.arduino.cc/en/Tutorial/SerialEvent
*/

String inputString = "";         // a String to hold incoming data
bool stringComplete = false;  // whether the string is complete
bool established = false;
bool receiveDone = false;
unsigned char inChar;
    int i = 0;
unsigned char inData[32];
struct Packet
{
  unsigned char type;
  unsigned char dataSize;
  unsigned char data[32];
};
unsigned char stage = 0x00;
struct Packet p1;
void setup() {

  // initialize serial:
  Serial.begin(9600);
  // reserve 200 bytes for the inputString:
  inputString.reserve(200);
  pinMode(LED_BUILTIN, OUTPUT);

}

void loop() {
  if (receiveDone)
  {
    digitalWrite(LED_BUILTIN, HIGH);
    while(true)
    {
      Serial.write(0xFF);
    }
  }

/*  // print the string when a newline arrives:
  if (stringComplete) {
    Serial.println(inputString);
    // clear the string:
    inputString = "";
    stringComplete = false;
  }
*/
//RECEIVE DATA AND STORE IN PACKET
/*
    while(true)
    {
      Serial.read();  //discard start of data byte
      inChar = (unsigned char)Serial.read();
      if(inChar > 0x00)
      {
        p1.type = inChar;
        Serial.write(0xF0);
        inChar = (unsigned char)Serial.read();
        p1.dataSize = inChar;
        Serial.write(0xFF);
      while(true)
        {
          Serial.write(p1.type);
          Serial.write(0xF2);
          Serial.write(p1.dataSize);
          Serial.write(0xF5);
        }
    }
*/
/*    for(unsigned char i=0; i<p1.dataSize; i++)
    {
      p1.data[i] = (unsigned char)Serial.read();
      Serial.write(p1.data[i]);
    }
  }
*/
    // get the new byte
/* 
    // add it to the inputString:
    inputString += inChar;
    // if the incoming character is a newline, set a flag so the main loop can
    // do something about it:
    if (inChar == '\n') {
      stringComplete = true;
    }
*/
}
void serialEvent()
{
  if(!established)  //if connection not established, might be PC trying to establish
  {
    inChar = (unsigned char)Serial.read();
    if (inChar == 0x05) //if PC has sent enquiry
    {
      Serial.write(0x06); //return acknowledge to PC, declaring ready to receive
      established = true;
      stage++;
    }
  }
  else  //connection established, must be data incoming
  {
    while (Serial.available())  //throw incoming bytes into inData array
    {
      inChar = (unsigned char)Serial.read();
      inData[i] = inChar;
      i++;
      Serial.write(inChar);
      if(inChar == 3) //if null, meaning last piece of data has been sent
      {
        receiveDone = true;
      }
    }
  }
}


void receiveData()
{
  while (Serial.available())
  {
    char inChar = (char)Serial.read();
    while(true)
      Serial.println("Received!");
/*  if (inChar == '\1')
    {
        Serial.println("\1 received!");
        char packetType = (char)Serial.read();
        Serial.print("Packet Type: ");
        Serial.println(packetType);
        char dataSize = (char)Serial.read();
        Serial.print("Data Size: ");
        Serial.println(dataSize);
    }
*/
  }
  delay(1000);
  digitalWrite(LED_BUILTIN, LOW);
}
