//CURRENT OBJECTIVE: to set the value of 3 displays using the display class
Display d1 = new Display(0, "A");
Display d2 = new Display(1, "A");
Display d3 = new Display(2, "B");

Block b1;

Station s1 = new Station();
Station s0;

String[] values = {"11.11", "33.33", "77.77"};
String[] types = {"A", "A", "B"};

void setup() {
  size(300, 400);

  b1 = new Block(3, 0);//instanciation; 3 displays, COM port in index 0
  b1.setValue(0, "12.34");
  b1.setValue(1, "56.78");
  b1.setValue(2, "99.99");
  println(b1.getValue(0));
  b1.formatValues();

  s1.updateValues();
  //blockAssign();

  createConfig();
}
void draw() {
}
