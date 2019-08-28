/*
 Igniter Test Code

 The purpose of this program is to test the Missouri University of Science and
 Technology (Missouri S&T) Liquid-Fuel Rocket Design Team's igniter. A 500 psi
 pressure transducer is used to measure the pressure in the igniter, which gives
 a voltage that is converted to psi and logged to an external SD card. the buttons
 on the Tiva are used to signal when ignition should begin, and then the Tiva sends
 a signal to a MOSFET to begin ignition. Every time the button designated as the on
 button is pressed, ignition will be attempted continuously until the button
 designated as the off button is pressed.

 The circuit:
 * analog sensors on analog ins PE_3 (A0)
 * SD card attached to SPI bus as follows:
 ** MOSI - pin PD_1
 ** MISO - pin PD_0
 ** CLK - pin PD_3
 ** CS - pin PD_2
 * digital output on pin PF_1

 created  23 Feb 2018
 by Usman Bajwa
 last modified 2 April 2018
 by Usman Bajwa
 last modified 24 August 2019

 */

#include <SPI.h>
#include <SD.h>

const int chipSelect = PD_2;              // CS pin
const String FILE_NAME = "datalog.csv";   // Data logged to a .csv file to make data analysis easier
const int switchOn = PUSH1;               // Button on Tiva designated as the on-button
const int switchOff = PUSH2;              // Button on Tiva designated as the off-button
const int OUTPUT2MOSFET = PF_1;           // Output pin to start the spark
const int TRANSDUCER = A0;                // Analog pin number for the pressure transducer
const int MAX_ATTEMPTS = 5;               // Maximum number of times to try to spark
//const int DELAY = 100;                    // Delay between each data collection and ignition attempt
const int FREQ = 100;
float Period;
int DELAY;
int attempts = 0;                         // Number of times a spark has been attempted
bool ignite;                              // Condition for ignition

void setup()
{
	Period = 1/(FREQ);
	DELAY = Period/2;

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

  // Initialize inputs and outputs
  pinMode(switchOn, INPUT_PULLUP);
  pinMode(switchOff, INPUT_PULLUP);
  pinMode(OUTPUT2MOSFET, OUTPUT);

  ignite = false;
}

void loop()
{
  if(!digitalRead(switchOn))
    ignite = true;

  if(!digitalRead(switchOff))
    ignite = false;
  
  digitalWrite(OUTPUT2MOSFET, 0);                     // Spark attempts are stopped

  // Pressure transducer data is taken and coverted to psi
  int sensor = analogRead(TRANSDUCER) - 520;                   // Raw pressure data should be about 100 with no added pressure
  float voltage = sensor*(5/1024.0);                           // Conversion found online
  float pressure_psi = 125*voltage - 62.5;                     // Conversion found in datasheet

  // Switch input is read. If the switch is on, sparks are attempted until the max number of attempts has been reached
  // Note: the max attempts part was removed for the purpose of testing. Adding "&& attempts <= MAX_ATTEMPTS" to this
  // if-statement condition should add it back in if it's needed. If that doesn't work, you might need to play around
  // with where the ignition conditions are being set to true or false.
  if(ignite)
  {
    digitalWrite(OUTPUT2MOSFET, 1);  // Start ignition; attempt a spark
    
  }
  else
    if(!ignite)
      attempts = 0;                  // Reset attempt count to allow the switch to flipped again for more attempts

  // Open the file and record data. Note that only one file can be open at a time,
  // so you have to close this one before opening another.
  //File dataFile = SD.open(FILE_NAME, FILE_WRITE);

  // If the file is available, write to it:
  //if (dataFile)
  //{
    // Record sensor values to a .csv file
    /*dataFile.print(millis()/1000.0);     // Time of reading
    dataFile.print(", ");
    dataFile.print(sensor);              // Raw signal
    dataFile.print(", ");
    dataFile.print(voltage);             // Signal converted to a voltage value
    dataFile.print(", ");
    dataFile.print(pressure_psi);        // Voltage converted to a pressure reading
    if(digitalRead(OUTPUT2MOSFET))
      dataFile.print(", Ignite!");       // Record when the spark was attempted
    dataFile.println("");
    dataFile.close();
    // print to the serial port too:
    Serial.print(millis()/1000.0);
    Serial.print(", ");
    Serial.print(sensor);
    Serial.print(", ");
    Serial.print(voltage);
    Serial.print(", ");
    Serial.print(pressure_psi);*/
    if(digitalRead(OUTPUT2MOSFET))
    {
      Serial.print(", Ignite!");         // Record when the spark was attempted
      digitalWrite(OUTPUT2MOSFET, 0);
    }
    Serial.println("");
  //}
  // If the file isn't open, pop up an error:
  //else
  //  Serial.println("error opening " + FILE_NAME);

}









