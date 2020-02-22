/*
 * Andrew's code for trying to read i2c sensors 
 * on the berryIMUv3
 * 
 * external 10k pullup used
 * pull pin 11 LOW to read sensor
 * 
 * This program depends on i2c_t3.h which can be found at https://forum.pjrc.com/threads/21680-New-I2C-library-for-Teensy3
 * 
 */
#include <i2c_t3.h>
//#include "LSM9DS0.h"

#define GYR_ADDRESS 0x6A
#define OUT_X_L_G 0x28
#define CTRL_REG1_G     0x20
#define CTRL_REG2_G     0x21
#define CTRL_REG3_G     0x22
#define CTRL_REG4_G     0x23
#define CTRL_REG5_G     0x24

// Memory
byte databuf[6];
int gyrRaw[3];
int count;

void setup() {
  Serial.begin(9600);
  Serial.println("Serial connection established");

  pinMode(LED_BUILTIN,OUTPUT);    // LED
  digitalWrite(LED_BUILTIN,LOW);  // LED off
  pinMode(12,INPUT_PULLUP);       // Control for Send
  pinMode(11,INPUT_PULLUP);       // Control for Receive
  
  Wire.begin(I2C_MASTER, 0x00, I2C_PINS_18_19, I2C_PULLUP_EXT, 400000);
  Wire.setDefaultTimeout(200000); // 200ms

  // Enable Gyro
  writeTo(GYR_ADDRESS, CTRL_REG1_G, 0b00001111); // Normal power mode, all axes enabled
  writeTo(GYR_ADDRESS, CTRL_REG4_G, 0b00110000); // Continuos update, 2000 dps full scale

 // Data init
  memset(databuf, 0, sizeof(databuf));
  count = 0;
  
}

void loop() 
{
  uint8_t target = 0x6A;    

     // Read string from Slave
    //
    if(digitalRead(11) == LOW)
    {
        digitalWrite(LED_BUILTIN,HIGH);   // LED on

        // Print message
        //Serial.print("Reading from Slave: ");
        
        // Read from Slave
        //Wire.requestFrom(target, (size_t)MEM_LEN); // Read from Slave (string len unknown, request full buffer)

        // Check if error occured
        //if(Wire.getError())
        //    Serial.print("FAIL\n");
        //else
        //{
            // If no error then read Rx data into buffer and print
            //Wire.read(databuf, Wire.available());
            //Serial.printf("'%s' OK\n",databuf);

            readFrom(GYR_ADDRESS, 0x80 | OUT_X_L_G, 6, databuf);
            gyrRaw[0] = (int)(databuf[0] | (databuf[1] << 8));   
            gyrRaw[1] = (int)(databuf[2] | (databuf[3] << 8));
            gyrRaw[2] = (int)(databuf[4] | (databuf[5] << 8));
            if (gyrRaw[0] >= 32768) gyrRaw[0] = gyrRaw[0]- 65536;
            if (gyrRaw[1] >= 32768) gyrRaw[1] = gyrRaw[1]- 65536;
            if (gyrRaw[2] >= 32768) gyrRaw[2] = gyrRaw[2]- 65536;

          Serial.print("gryRaw0: ");
          Serial.println(gyrRaw[0]);
          Serial.print("gryRaw1: ");
          Serial.println(gyrRaw[1]);
          Serial.print("gryRaw2: ");
          Serial.println(gyrRaw[2]);
        //}

        digitalWrite(LED_BUILTIN,LOW);    // LED off
        delay(100);                       // Delay to space out tests
    }
}

void writeTo(int device, byte address, byte val) {
   Wire.beginTransmission(device); //start transmission to device 
   Wire.write(address);        // send register address
   Wire.write(val);        // send value to write
   Wire.endTransmission(); //end transmission
}
void readFrom(int device, byte address, int num, byte buff[]) {
  Wire.beginTransmission(device); //start transmission to device 
  Wire.write(address);        //sends address to read from
  Wire.endTransmission(); //end transmission
  
  Wire.beginTransmission(device); //start transmission to device (initiate again)
  Wire.requestFrom(device, num);    // request 6 bytes from device
  
  int i = 0;
  while(Wire.available())    //device may send less than requested (abnormal)
  { 
    buff[i] = Wire.read(); // receive a byte
    i++;
  }
  Wire.endTransmission(); //end transmission
}
