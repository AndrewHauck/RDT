/*
OFFICIAL ROCKET IGNITER CODE
This .ino file is the main program to be run on the 2560 board

 * SD card attached to SPI bus as follows on MEGA2560:
 ** MOSI = DI - pin 51
 ** MISO = DO - pin 50
 ** CLK - pin 52
 ** CS - pin 53

*/
#include <SPI.h>
#include <SD.h>

File myFile;

//Define pressure transducer analog pin variables
int PT1 = A0;
int PT2 = A1;
int PT3 = A2;
int PT4 = A3;

//Define variables for raw data read on analog pins
int pdata1;
int pdata2;
int pdata3;
int pdata4;

//Define pressure pin voltage variables
float V1 = A0;
float V2 = A1;
float V3 = A2;
float V4 = A3;

//Define pressure variables
float P1;
float P2;
float P3;
float P4;

//Time in msec for delay function
int sleep=200;
const int TIMEOUT = 5000; 

//Define SPI pins for SD card interface
int CS = 53;
int MOSi = 51;
int MISo = 50;
int CLK = 52;

//String to receive python UI input
String receive;

void setup()
{
  pinMode(3, OUTPUT);
  // Open serial communications and wait for port to open:
  Serial.begin(9600);
  
  while (!Serial)
  {
    ; // wait for serial port to connect. Needed for native USB port only
  }


  //Serial.print("Initializing SD card...");

  if (!SD.begin(CS)) {
    //Serial.println("initialization failed!");
    int a = 0;
    while(a < TIMEOUT)
    {
    	a++;
    };
  }
  //Serial.println("initialization done.");

  if (SD.exists("example.txt")) {
    //Serial.println("example.txt exists.");
  } else {
    //Serial.println("example.txt doesn't exist.");
  }

  // open a new file and immediately close it:
  //Serial.println("Creating example.txt...");
  myFile = SD.open("example.txt", FILE_WRITE);

  if (myFile)
  {
    //Serial.print("Writing to SD...");
    myFile.println("Testing");
    myFile.close();
  }

  pinMode(LED_BUILTIN, OUTPUT);
  digitalWrite(LED_BUILTIN, LOW);
}

void loop()
{
  // Calculate pressure readings from raw values
  pdata1 = analogRead(PT1);
  V1 = pdata1*(5.0/1023.0);
  P1 = (14000/2500)*V1;

  pdata2 = analogRead(PT2);
  V2 = pdata2*(5.0/1023.0);
  P2 = (14000/2500)*V2;

  pdata3 = analogRead(PT3);
  V3 = pdata3*(5.0/1023.0);
  P3 = (14000/2500)*V3;

  pdata4 = analogRead(PT4);
  V4 = pdata4*(5.0/1023.0);
  P4 = (14000/2500)*V4;

  // Print pressure readings to serial bus to be read by the UI
  Serial.print(String(P1)+'a'+String(P2)+'b'+String(P3)+'c'+String(P4)+'d');

  // Listen for commands sent from UI over serial
  if (Serial.find("V1"))
  {
    digitalWrite(LED_BUILTIN, HIGH);
  }
  else
  {digitalWrite(LED_BUILTIN, LOW);}  
}
