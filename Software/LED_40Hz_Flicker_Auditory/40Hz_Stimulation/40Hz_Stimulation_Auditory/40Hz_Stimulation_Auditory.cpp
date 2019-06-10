void setup() {
}

void loop() {
noTone(7);    // turn the tone on at stimulation frequency
  tone(7, 10000, 1); // 10kHz tone on pin 7 for 1 ms:
  delay(stim); 
}
