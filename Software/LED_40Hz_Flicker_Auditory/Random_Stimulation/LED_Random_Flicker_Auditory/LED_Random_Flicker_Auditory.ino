void setup() {
  pinMode(2, OUTPUT);   // Chose most convenient pin for your set up
}

void loop() {
  int stim = random(1,80);
  digitalWrite(2, HIGH);   // turn the LED strip on 
  delay(stim);                       // wait for a second
  digitalWrite(2, LOW);    // turn the LED strip off
  delay(stim);                       // wait for a second
  // turn off tone function for pin 7:
  noTone(7);
  // play a 10kHz tone on pin 7 for 1 ms:
  tone(7, 10000, 1);
  delay(stim);
}
