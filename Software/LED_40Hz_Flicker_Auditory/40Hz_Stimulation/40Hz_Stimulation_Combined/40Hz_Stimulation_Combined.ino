void setup() {
  pinMode(2, OUTPUT);   // Chose most convenient pin for your set up
}

void loop() {
  int stim = 1000/40; // stimulation frequency

  digitalWrite(2, HIGH);   // turns the LED strip on at stimulation frequency
  delay(stim);
  digitalWrite(2, LOW);
  delay(stim);
  
  noTone(7);    // turn the tone on at stimulation frequency
  tone(7, 10000, 1); // 10kHz tone on pin 7 for 1 ms:
  delay(stim);

  if (micros()<36000000)
  {
    digitalWrite(2, LOW);
    digitalWrite(7,LOW);
  }
}
