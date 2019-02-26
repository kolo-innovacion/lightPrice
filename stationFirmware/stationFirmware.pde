//CURRENT OBJECTIVE: to set the value of 3 displays using the display class
Display d1 = new Display(0, "A");
Display d2 = new Display(1, "A");
Display d3 = new Display(2, "B");

String value1="11.11";
String value2="33.33";
String value3="77.77";

String[] values = {"11.11", "33.33", "77.77"};

void setup() {
  size(300, 400);
  d1.setValue(value1);
  d2.setValue(value2);
  d3.setValue(value3);
}
void draw() {
}
