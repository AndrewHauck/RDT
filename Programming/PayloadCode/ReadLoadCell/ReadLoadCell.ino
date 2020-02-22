/*  Connect data output of HX711 to Teensy pin A0
 *  Connect SCK pin of HX711 board to Teensy pin A1
 *  Code follows HX711 communication timing diagram
 */ 

long x = 0; //output measured voltage
unsigned long dataArray[128];
int j = 0;
const int numsample = 1028;
const float cal = 1.2e9;
float force_meas = 0;
float fullscale = 88.185;
float excite = 3.3;

void setup() {
  Serial.begin(9600);
  pinMode(A0, OUTPUT); //SCK for HX711
  pinMode(A1, INPUT);  //DOUT for HX711
}

void clk() //Create the SCK signal and write to HX711
{
  digitalWrite(A0, HIGH);
  digitalWrite(A0, LOW);
}

void loop() {
  //Serial.print("Reading: ");

  for (int j=0; j >= 0 ; j++) //loops to collect numsample amount of samples
  {                                //each iteration takes one sample
    Serial.print("Sample (mV): ");
    
    digitalWrite(A0, LOW); //set clock low
    
    while (digitalRead(A1) != LOW);
    {
      //below for loop collects one data frame
      for (int i=0; i<24; i++) //HX711 data frame length is 24 bits
      {
        clk();
        bitWrite(x, 0 ,digitalRead(A1)); //read the logic level of DOUT and write to x variable
        x = x<<1; //shift x left by 1 bit
      }
      
      clk();
      Serial.println(x, HEX); //print sampled values in hexadecimal

      force_meas = fullscale*(x/(excite*cal));
      Serial.print("Force (lbs): ");
      Serial.println(force_meas);
      
      x=0; //clear x variable
      //delay(1000); //delay between samples
    }
    //dataArray[j]=y; //for each sample, move bits stored in y into dataArray
  }
}
