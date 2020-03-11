#include <Adafruit_MAX31856.h>

// Use software SPI: CS, DI, DO, CLK
Adafruit_MAX31856 maxthermo1 = Adafruit_MAX31856(11, 12, 7, 13);
Adafruit_MAX31856 maxthermo2 = Adafruit_MAX31856(10, 12, 6, 13);
Adafruit_MAX31856 maxthermo3 = Adafruit_MAX31856(9, 12, 5, 13);
Adafruit_MAX31856 maxthermo4 = Adafruit_MAX31856(8, 12, 4, 13);

// use hardware SPI, just pass in the CS pin
//Adafruit_MAX31856 maxthermo = Adafruit_MAX31856(10);

void setup() {
  Serial.begin(115200);
  Serial.println("MAX31856 thermocouple test");
  
  maxthermo1.begin();
  maxthermo2.begin();
  maxthermo3.begin();
  maxthermo4.begin();
  
  maxthermo1.setThermocoupleType(MAX31856_TCTYPE_K);
  maxthermo2.setThermocoupleType(MAX31856_TCTYPE_K);
  maxthermo3.setThermocoupleType(MAX31856_TCTYPE_K);
  maxthermo4.setThermocoupleType(MAX31856_TCTYPE_K);
      
  Serial.print("Thermocouple 1 type: ");
  switch (maxthermo1.getThermocoupleType() ) {
    case MAX31856_TCTYPE_B: Serial.println("B Type"); break;
    case MAX31856_TCTYPE_E: Serial.println("E Type"); break;
    case MAX31856_TCTYPE_J: Serial.println("J Type"); break;
    case MAX31856_TCTYPE_K: Serial.println("K Type"); break;
    case MAX31856_TCTYPE_N: Serial.println("N Type"); break;
    case MAX31856_TCTYPE_R: Serial.println("R Type"); break;
    case MAX31856_TCTYPE_S: Serial.println("S Type"); break;
    case MAX31856_TCTYPE_T: Serial.println("T Type"); break;
    case MAX31856_VMODE_G8: Serial.println("Voltage x8 Gain mode"); break;
    case MAX31856_VMODE_G32: Serial.println("Voltage x8 Gain mode"); break;
    default: Serial.println("Unknown"); break;
  }
  Serial.print("Thermocouple 2 type: ");
  switch (maxthermo2.getThermocoupleType() ) {
    case MAX31856_TCTYPE_B: Serial.println("B Type"); break;
    case MAX31856_TCTYPE_E: Serial.println("E Type"); break;
    case MAX31856_TCTYPE_J: Serial.println("J Type"); break;
    case MAX31856_TCTYPE_K: Serial.println("K Type"); break;
    case MAX31856_TCTYPE_N: Serial.println("N Type"); break;
    case MAX31856_TCTYPE_R: Serial.println("R Type"); break;
    case MAX31856_TCTYPE_S: Serial.println("S Type"); break;
    case MAX31856_TCTYPE_T: Serial.println("T Type"); break;
    case MAX31856_VMODE_G8: Serial.println("Voltage x8 Gain mode"); break;
    case MAX31856_VMODE_G32: Serial.println("Voltage x8 Gain mode"); break;
    default: Serial.println("Unknown"); break;
  }
  Serial.print("Thermocouple 3 type: ");
  switch (maxthermo3.getThermocoupleType() ) {
    case MAX31856_TCTYPE_B: Serial.println("B Type"); break;
    case MAX31856_TCTYPE_E: Serial.println("E Type"); break;
    case MAX31856_TCTYPE_J: Serial.println("J Type"); break;
    case MAX31856_TCTYPE_K: Serial.println("K Type"); break;
    case MAX31856_TCTYPE_N: Serial.println("N Type"); break;
    case MAX31856_TCTYPE_R: Serial.println("R Type"); break;
    case MAX31856_TCTYPE_S: Serial.println("S Type"); break;
    case MAX31856_TCTYPE_T: Serial.println("T Type"); break;
    case MAX31856_VMODE_G8: Serial.println("Voltage x8 Gain mode"); break;
    case MAX31856_VMODE_G32: Serial.println("Voltage x8 Gain mode"); break;
    default: Serial.println("Unknown"); break;
  }
  Serial.print("Thermocouple 4 type: ");
  switch (maxthermo4.getThermocoupleType() ) {
    case MAX31856_TCTYPE_B: Serial.println("B Type"); break;
    case MAX31856_TCTYPE_E: Serial.println("E Type"); break;
    case MAX31856_TCTYPE_J: Serial.println("J Type"); break;
    case MAX31856_TCTYPE_K: Serial.println("K Type"); break;
    case MAX31856_TCTYPE_N: Serial.println("N Type"); break;
    case MAX31856_TCTYPE_R: Serial.println("R Type"); break;
    case MAX31856_TCTYPE_S: Serial.println("S Type"); break;
    case MAX31856_TCTYPE_T: Serial.println("T Type"); break;
    case MAX31856_VMODE_G8: Serial.println("Voltage x8 Gain mode"); break;
    case MAX31856_VMODE_G32: Serial.println("Voltage x8 Gain mode"); break;
    default: Serial.println("Unknown"); break;
  }

}

void loop() {
  Serial.print("Cold Junction Temp (1): "); 
  Serial.println(maxthermo1.readCJTemperature());

  Serial.print("Cold Junction Temp (2): "); 
  Serial.println(maxthermo2.readCJTemperature());

  Serial.print("Cold Junction Temp (3): "); 
  Serial.println(maxthermo3.readCJTemperature());

  Serial.print("Cold Junction Temp (4): "); 
  Serial.println(maxthermo4.readCJTemperature());

  Serial.print("Thermocouple (1) Temp: "); 
  Serial.println(maxthermo1.readThermocoupleTemperature());
  // Check and print any faults
  uint8_t fault1 = maxthermo1.readFault();
  if (fault1) {
    if (fault1 & MAX31856_FAULT_CJRANGE) Serial.println("Cold Junction Range Fault (1)");
    if (fault1 & MAX31856_FAULT_TCRANGE) Serial.println("Thermocouple Range Fault (1)");
    if (fault1 & MAX31856_FAULT_CJHIGH)  Serial.println("Cold Junction High Fault (1)");
    if (fault1 & MAX31856_FAULT_CJLOW)   Serial.println("Cold Junction Low Fault (1)");
    if (fault1 & MAX31856_FAULT_TCHIGH)  Serial.println("Thermocouple High Fault (1)");
    if (fault1 & MAX31856_FAULT_TCLOW)   Serial.println("Thermocouple Low Fault (1)");
    if (fault1 & MAX31856_FAULT_OVUV)    Serial.println("Over/Under Voltage Fault (1)");
    if (fault1 & MAX31856_FAULT_OPEN)    Serial.println("Thermocouple Open Fault (1)");
  }
  
  Serial.print("Thermocouple (2) Temp: "); 
  Serial.println(maxthermo2.readThermocoupleTemperature());
  // Check and print any faults
  uint8_t fault2 = maxthermo2.readFault();
  if (fault2) {
    if (fault2 & MAX31856_FAULT_CJRANGE) Serial.println("Cold Junction Range Fault (2)");
    if (fault2 & MAX31856_FAULT_TCRANGE) Serial.println("Thermocouple Range Fault (2)");
    if (fault2 & MAX31856_FAULT_CJHIGH)  Serial.println("Cold Junction High Fault (2)");
    if (fault2 & MAX31856_FAULT_CJLOW)   Serial.println("Cold Junction Low Fault (2)");
    if (fault2 & MAX31856_FAULT_TCHIGH)  Serial.println("Thermocouple High Fault (2)");
    if (fault2 & MAX31856_FAULT_TCLOW)   Serial.println("Thermocouple Low Fault (2)");
    if (fault2 & MAX31856_FAULT_OVUV)    Serial.println("Over/Under Voltage Fault (2)");
    if (fault2 & MAX31856_FAULT_OPEN)    Serial.println("Thermocouple Open Fault (2)");
  }
  
  Serial.print("Thermocouple (3) Temp: "); 
  Serial.println(maxthermo3.readThermocoupleTemperature());
  // Check and print any faults
  uint8_t fault3 = maxthermo3.readFault();
  if (fault3) {
    if (fault3 & MAX31856_FAULT_CJRANGE) Serial.println("Cold Junction Range Fault (3)");
    if (fault3 & MAX31856_FAULT_TCRANGE) Serial.println("Thermocouple Range Fault (3)");
    if (fault3 & MAX31856_FAULT_CJHIGH)  Serial.println("Cold Junction High Fault (3)");
    if (fault3 & MAX31856_FAULT_CJLOW)   Serial.println("Cold Junction Low Fault (3)");
    if (fault3 & MAX31856_FAULT_TCHIGH)  Serial.println("Thermocouple High Fault (3)");
    if (fault3 & MAX31856_FAULT_TCLOW)   Serial.println("Thermocouple Low Fault (3)");
    if (fault3 & MAX31856_FAULT_OVUV)    Serial.println("Over/Under Voltage Fault (3)");
    if (fault3 & MAX31856_FAULT_OPEN)    Serial.println("Thermocouple Open Fault (3)");
  }

  Serial.print("Thermocouple (4) Temp: "); 
  Serial.println(maxthermo4.readThermocoupleTemperature());
  // Check and print any faults
  uint8_t fault4 = maxthermo4.readFault();
  if (fault4) {
    if (fault4 & MAX31856_FAULT_CJRANGE) Serial.println("Cold Junction Range Fault (4)");
    if (fault4 & MAX31856_FAULT_TCRANGE) Serial.println("Thermocouple Range Fault (4)");
    if (fault4 & MAX31856_FAULT_CJHIGH)  Serial.println("Cold Junction High Fault (4)");
    if (fault4 & MAX31856_FAULT_CJLOW)   Serial.println("Cold Junction Low Fault (4)");
    if (fault4 & MAX31856_FAULT_TCHIGH)  Serial.println("Thermocouple High Fault (4)");
    if (fault4 & MAX31856_FAULT_TCLOW)   Serial.println("Thermocouple Low Fault (4)");
    if (fault4 & MAX31856_FAULT_OVUV)    Serial.println("Over/Under Voltage Fault (4)");
    if (fault4 & MAX31856_FAULT_OPEN)    Serial.println("Thermocouple Open Fault (4)");
  }
  
  fault1 = 0;
  fault2 = 0;
  fault3 = 0;
  fault4 = 0;
  
  delay(1000);
}
