import controlP5.*;

Block b1;

Station s0;

String[] values = {"88.88", "99.99", "77.77"};
String[] types = {"A", "A", "B"};

int globalAux=0;

void setup() {
  size(800, 600);

  guiSetup();
  instanceStation();
  s0.createStation();
  s0.updateBook();
  delay(50);
  println("After delay");
  s0.accessBlocks();
  s0.updateBlocks();
}
void draw() {
  background(backColor);
  //ellipse(mouseX, mouseY, 100, 100);
}

void instanceStation() {
  s0=new Station();
}
