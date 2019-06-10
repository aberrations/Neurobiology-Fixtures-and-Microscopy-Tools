void setup() {
  pinMode(7, OUTPUT);   // Chose most convenient pin for your set up
}

void loop() {
  digitalWrite(7, HIGH);   // turn the LED strip on (HIGH is the voltage level)
  delay(1000/40);                       // wait for a second
  digitalWrite(7, LOW);    // turn the LED strip off by making the voltage LOW
  delay(1000/40);                       // wait for a second
}
