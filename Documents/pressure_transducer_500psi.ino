void setup()
{
  Serial.begin(9600);
}

void loop()
{
  int sensorVal = analogRead(A0);
  Serial.print("Sensor Value: ");
  Serial.print(sensorVal);
  Serial.print("  ");

  float voltage = sensorVal * (5 / 1024.0);
  Serial.print("Volts: ");
  Serial.print(voltage);
  Serial.print("  ");
  
  float pressure_psi = 125 * voltage - 62.5;
  Serial.print("Pressure = ");
  Serial.print(pressure_psi);
  Serial.println(" psi");

  delay(100);
}
