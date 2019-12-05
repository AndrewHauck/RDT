/*
  OFFICIAL ROCKET IGNITER CODE
  This .ino file is the main program to be run on the 2560 board

   SD card attached to SPI bus as follows on MEGA2560:
 ** MOSI = DI - pin 51
 ** MISO = DO - pin 50
 ** CLK - pin 52
 ** CS - pin 53

*/
#include <SPI.h>
#include <SD.h> //Allows SD card reader functions

File myFile;

//Define variables for raw data read on analog pins
int PT1 = A0;
int PT2 = A1;
int PT3 = A2;
int PT4 = A3;

//Time in msec for delay function
int sleep = 200;
const int TIMEOUT = 5000;

//Define SPI pins for SD card interface
int CS = 53;
int MOSi = 51;
int MISo = 50;
int CLK = 52;

//String to receive python UI input
char ARM[32] = "ARM";
char FIRE[32] = "FIRE";
char inputString[32];
//bool transferStatus = false;
int i = 0;

void serial_flush(void) {
 while (true)
   {
   delay (20);  // give data a chance to arrive
   if (Serial.available ())
     {
     // we received something, get all of it and discard it
     while (Serial.available ())
       Serial.read ();
     continue;  // stay in the main loop
     }
  else
    break;  // nothing arrived for 20 ms
   }
}

void setup()
{
  //*****SERIAL INIT*****
  pinMode(LED_BUILTIN, OUTPUT);
  while (!Serial) {} // wait for serial port to connect. Needed for native USB port only

  Serial.begin(9600);  // Open serial communications and wait for port to open:
  //*****END OF SERIAL INIT*****

  //*****SD CARD INIT*****
  /*
    //pinMode(3, OUTPUT);
    //Serial.print("Initializing SD card...");
    if (!SD.begin(CS))
    {
      //Serial.println("initialization failed!");
      int a = 0;
      while(a < TIMEOUT)
      {a++;};
    }
    //Serial.println("initialization done.");
    if (SD.exists("example.txt")) {
      Serial.println("example.txt exists.");
    } else {
      Serial.println("example.txt doesn't exist.");
    }
    //open a new file and immediately close it:
    //Serial.println("Creating example.txt...");
    //myFile = SD.open("example.txt", FILE_WRITE);
    if (myFile)
    {
      //Serial.print("Writing to SD...");
      myFile.println("Testing");
      myFile.close();
    }
  */
  //*****END OF SD CARD INIT*****

}

void loop()
{  
  
  //Transmit as chars
    Serial.print(analogRead(PT1));
    Serial.print('a');
    Serial.print('\3');    
    Serial.print(analogRead(PT2));
    Serial.print('b');
    Serial.print('\3');
    Serial.print(analogRead(PT3));
    Serial.print('c');
    Serial.print('\3');
    Serial.print(analogRead(PT4));
    Serial.print('d');
    Serial.print('\3');

/*
   //Transmit as hex
    Serial.write(analogRead(PT1));
    Serial.write(0x1D);
    Serial.write(analogRead(PT2));
    Serial.write(0x1D);
    Serial.write(analogRead(PT3));
    Serial.write(0x1D);
    Serial.write(analogRead(PT4));
    Serial.write(0x1D);
*/

  if (Serial.available())
  {
    char inByte = Serial.read();
    if (inByte == '\3')
    {
      transferStatus = true;
      inputString[i] = '\0';
      if (strcmp(inputString, ARM)==0)
      {
        digitalWrite(LED_BUILTIN, HIGH);   // turn the LED on (HIGH is the voltage level)
        delay(1000);                       // wait for a second
        digitalWrite(LED_BUILTIN, LOW);    // turn the LED off by making the voltage LOW
        memset(inputString, 0, 32);
      }
      if (strcmp(inputString, FIRE)==0)
      {
        digitalWrite(LED_BUILTIN, HIGH);   // turn the LED on (HIGH is the voltage level)
        delay(1000);                       // wait for a second
        digitalWrite(LED_BUILTIN, LOW);    // turn the LED off by making the voltage LOW
        memset(inputString, 0, 32);
      }
      i = -1;
      serial_flush();
    }
    else
      inputString[i] = inByte;
    i++;
  }
}
