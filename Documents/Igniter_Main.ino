

/*
  SD card basic file example

 This example shows how to create and destroy an SD card file
 The circuit:
 * SD card attached to SPI bus as follows on MEGA2560:
 ** MOSI = DI - pin 51
 ** MISO = DO - pin 50
 ** CLK - pin 52
 ** CS - pin 53 

 This example code is in the public domain.

 */
#include <SPI.h>
#include <SD.h>

File myFile;
int analogPin = A0;
int raw;
int CSpin = 53;
float Vo;
float Pressure;

void setup() {
  pinMode(3, OUTPUT);
  // Open serial communications and wait for port to open:
  Serial.begin(9600);
  while (!Serial) {
    ; // wait for serial port to connect. Needed for native USB port only
  }


  Serial.print("Initializing SD card...");

  if (!SD.begin(CSpin)) {
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
  } 
}

void loop() 
{
  analogWrite(3, 200);
  
  raw = analogRead(analogPin);
  Vo = raw*(5.0/1023.0);
  Pressure = 250.0*Vo-125.0;
  Serial.print("Raw value: ");
  Serial.print(raw);
  Serial.print(", Voltage out: ");
  Serial.print(Vo);
  Serial.print(", Pressure(psi): ");
  Serial.println(Pressure);
  delay(500);
}
