/*
 Igniter Test Code

 The purpose of this program is to test the Missouri University of Science and
 Technology (Missouri S&T) Liquid-Fuel Rocket Design Team's igniter. A 500 psi
 pressure transducer is used to measure the pressure in the igniter, which gives
 a voltage that is converted to psi and logged to an external SD card. A switch
 is used as an input to the Arduino to signal when ignition should begin, and then
 the Arduino sends a signal to a MOSFET to begin ignition. Every time the switch is
 flipped, ignition will be attempted five times and then stopped.

 The circuit:
 * analog sensors on analog ins 0
 * SD card attached to SPI bus as follows:
 ** MOSI - pin 11
 ** MISO - pin 12
 ** CLK - pin 13
 ** CS - pin 4 (for MKRZero SD: SDCARD_SS_PIN)
 * digital input on pin 7
 * digital output on pin 8

 created  23 Feb 2018
 by Usman Bajwa
 last modified 23 Feb 2018
 by Usman Bajwa

 */

#include <SPI.h>
#include <SD.h>

const int chipSelect = 4;                 // CS pin
const String FILE_NAME = "datalog.csv";   // Data logged to a .csv file to make data analysis easier
const int inputSwitch = 7;                // Input pin receiving signal from switch
const int OUTPUT2MOSFET = 8;              // Output pin to start the spark
const int TRANSDUCER = 0;                 // Analog pin number for the pressure transducer
const int MAX_ATTEMPTS = 5;               // Maximum number of times to try to spark
const int DELAY = 100;                    // Delay between each data collection and ignition attempt
int attempts = 0;                         // Number of times a spark has been attempted

void setup()
{
  // Open serial communications and wait for port to open:
  Serial.begin(9600);
  while (!Serial)
  {
    ; // Wait for serial port to connect. Needed for native USB port only
  }


  Serial.print("Initializing SD card...");

  // See if the card is present and can be initialized:
  if (!SD.begin(chipSelect))
  {
    Serial.println("Card failed, or not present");
    // Don't do anything more:
    return;                               // For the purpose of the test data needs to be recorded for analysis, so 
  }                                       // the test can't be started without a means to record the data
  Serial.println("card initialized.");

  // Values stored in file along with units of measurement
  String dataHeader = "Time (s), Raw Data, Transducer Reading (V), Pressure (psi)";

  File dataFile = SD.open(FILE_NAME, FILE_WRITE);
  
  // If the file is available, write to it:
  if (dataFile)
  {
    dataFile.println(dataHeader);
    dataFile.close();
    // Print to the serial port too:
    Serial.println(dataHeader);
  }
  else
    Serial.println("Error opening " + FILE_NAME);

  // Initialize input and output pins
  pinMode(inputSwitch, INPUT);
  pinMode(OUTPUT2MOSFET, OUTPUT);
}

void loop()
{
  digitalWrite(OUTPUT2MOSFET, 0);                     // Spark attempts are stopped
  
  // Make a string for assembling the data to log:
  String dataString = "";

  // Pressure transducer data is taken and coverted to psi
  int sensor = analogRead(TRANSDUCER);
  float voltage = sensor * (5 / 1024.0);                         // Conversion found online
  float pressure_psi = 125 * voltage - 62.5;                     // Conversion found in datasheet
  dataString += String(millis()/1000.0) + ", " + String(sensor) + ", " + String(voltage) + ", " + String(pressure_psi);

  // Switch input is read. If the switch is on, sparks are attempted until the max number of attempts has been reached
  if(digitalRead(inputSwitch) && attempts < MAX_ATTEMPTS)
  {
    digitalWrite(OUTPUT2MOSFET, 1);  // Start ignition; attempt a spark
    attempts++;                      // Increment attempt counter
  }
  else
    if(!digitalRead(inputSwitch))
      attempts = 0;                  // Reset attempt count to allow the switch to flipped again for more attempts

  if(digitalRead(OUTPUT2MOSFET))
    dataString += ", Ignite!";       // Record when the spark was attempted


  // Open the file and record data. Note that only one file can be open at a time,
  // so you have to close this one before opening another.
  File dataFile = SD.open(FILE_NAME, FILE_WRITE);

  // If the file is available, write to it:
  if (dataFile)
  {
    dataFile.println(dataString);
    dataFile.close();
    // print to the serial port too:
    Serial.println(dataString);
  }
  // If the file isn't open, pop up an error:
  else
    Serial.println("error opening " + FILE_NAME);

  delay(DELAY);
}
