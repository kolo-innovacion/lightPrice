import controlP5.*;

Block b1;

Station s0;

String[] values = {"88.88", "99.99", "77.77"};
String[] types = {"A", "A", "B"};


void setup() {
  size(850, 725);

  guiSetup();
  instanceStation();
  s0.createStation();
  //s0.updateBook();
  //delay(50);
  //println("After delay");
  //s0.accessBlocks();
  //s0.updateBlocks();
  createConsole();
  timerSetup();
}
int aux=0;
void draw0() {
  background(backColor);
  image(logo, 33*module, 31.25*module, 150, 150*0.4470);

  if (aux<1) {
    printole("Station is up and running.");
    aux++;
  }
}
void draw() {
  guiUpdate();
  //timersUpdate();
}

void guiUpdate() {

  background(backColor);
  image(logo, 33*module, 31.25*module, 150, 150*0.4470);
}

void instanceStation() {
  s0=new Station();
}

void notifyStart() {
}

void printole(String input) {
  //println(input);
  //this functionis for debugging
}

void display(String input) {
  println(input);
}

void updateRoutine() {
  //console.clear();
  //println("THIS A CONSOLE TEST");

  s0.updateBook();
  delay(50);
  s0.accessBlocks();
  s0.updateBlocks();
  display("updated values");
}

void keyPressed() {
  println("Starting timer...");
  //timer.start();
  timer = CountdownTimerService.getNewCountdownTimer(this).configure(100, refTime).start();
}
