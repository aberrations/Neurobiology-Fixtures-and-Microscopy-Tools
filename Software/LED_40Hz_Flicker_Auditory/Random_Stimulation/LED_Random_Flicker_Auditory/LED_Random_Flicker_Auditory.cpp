void setup() {
  pinMode(2, OUTPUT);   // Chose most convenient pin for your set up
}

void loop() {
  int stim = random(1,80); // stimulation frequency 
  
  digitalWrite(2, HIGH);   // turns the LED strip on at stimulation frequency
  delay(stim);
  digitalWrite(2, LOW);
  delay(stim);
  
  noTone(7);    // turn the tone on at stimulation frequency
  tone(7, 10000, 1); // 10kHz tone on pin 7 for 1 ms:
  delay(stim); 

  if (micros() < 3600000): // Checks time, and stops if greater than 1 hour
    continue
  else
  {
    break
  }
}