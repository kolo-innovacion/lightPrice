int interval=10;

void loopFrame(int input) {
  //input is the number of seconds desired between updates
  int frames = 20*input;
  if ((frameCount%frames)==0) {
    //trigger
    updateRoutine();
  } else {
  }
}
