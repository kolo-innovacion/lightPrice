//CURRENT OBJECTIVE: to set the value of 3 displays using the display class
//Display d1 = new Display(0, "A");
//Display d2 = new Display(1, "A");
//Display d3 = new Display(2, "B");

Block b1;

//Station s1 = new Station();
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
  //b1 = new Block(3, 0);//instanciation; 3 displays, COM port in index 0
  //b1.setValue(0, "12.34");
  //b1.setValue(1, "56.78");
  //b1.setValue(2, "99.99");
  //println(b1.getValue(0));
  //b1.formatValues();

  //s1.updateValues();
  //blockAssign();
}
void draw() {
}

void instanceStation() {
  s0=new Station();
}
