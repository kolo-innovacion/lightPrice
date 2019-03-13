Block b1;

Station s0;

String[] values = {"88.88", "99.99", "77.77"};
String[] types = {"A", "A", "B"};

void setup() {
  size(300, 400);

  instanceStation();
  s0.createStation();
  s0.updateBook();
  delay(50);
  println("After delay");
  s0.accessBlocks();
  s0.updateBlocks();
}
void draw() {
}

void instanceStation() {
  s0=new Station();
}
