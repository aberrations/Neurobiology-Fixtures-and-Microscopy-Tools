void setup() {
  pinMode(2, OUTPUT);   // Chose most convenient pin for your set up
}

void loop() {
  int stim = 1000/40; // stimulation frequency 
  digitalWrite(2, HIGH);   // turns the LED strip on at stimulation frequency
  delay(stim);
  digitalWrite(2, LOW);
  delay(stim);
}
