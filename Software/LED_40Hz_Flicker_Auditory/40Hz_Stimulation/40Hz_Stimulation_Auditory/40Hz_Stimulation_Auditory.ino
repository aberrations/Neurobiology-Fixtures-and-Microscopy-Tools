void setup() {
}
  int frequency = 1000 / 40;

void loop() {
  // turn off tone function for pin 7:
  noTone(7);
  // play a 10kHz tone on pin 7 for 1 ms:
  tone(7, 10000, 1);
  delay(frequency);
}
