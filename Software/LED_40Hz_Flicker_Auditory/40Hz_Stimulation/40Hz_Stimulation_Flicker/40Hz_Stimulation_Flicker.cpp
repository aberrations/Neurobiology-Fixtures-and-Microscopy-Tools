void setup() {
  pinMode(2, OUTPUT);   // Chose most convenient pin for your set up
}
int frequency = 1000/40;
void loop() {
  digitalWrite(2, HIGH);   // turn the LED strip on 
  delay(frequency);                       // wait for a second
  digitalWrite(2, LOW);    // turn the LED strip off
  delay(frequency);                       // wait for a second
  // turn off tone function for pin 7:
  noTone(7);
  // play a note on pin 6 for 200 ms:
  tone(7, 10000, 1);
  delay(frequency);
}
