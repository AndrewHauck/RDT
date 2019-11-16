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

//Define SPI pins for SD card interface
int CS = 53;
int MOSI = 51;
int MISO = 50;
int CLK = 52;

void setup()
{
  pinMode(3, OUTPUT);
  // Open serial communications and wait for port to open:
  Serial.begin(9600);
  while (!Serial)
  {
    ; // wait for serial port to connect. Needed for native USB port only
  }

/*
  Serial.print("Initializing SD card...");

  if (!SD.begin(CS)) {
    Serial.println("initialization failed!");
    while (1);
  }
  Serial.println("initialization done.");

  if (SD.exists("example.txt")) {
    Serial.println("example.txt exists.");
  } else {
    Serial.println("example.txt doesn't exist.");
  }

  // open a new file and immediately close it:
  Serial.println("Creating example.txt...");
  myFile = SD.open("example.txt", FILE_WRITE);

  if (myFile)
  {
    Serial.print("Writing to SD...");
    myFile.println("Testing");
    myFile.close();
  } */
}

void loop()
{
  pdata1 = analogRead(PT1);
  V1 = pdata1*(5.0/1023.0);
  P1 = (14000/2500)*V1;
  //Serial.print("Raw value: ");
  //Serial.print(raw);
  //Serial.print(", Voltage out: ");
  //Serial.println(Vo);
  //Serial.print(", Pressure(psi): ");
  Serial.println(P1);
  delay(sleep);
}
