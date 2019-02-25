class Block {
  int numDisplays;//1-3
  int port;
  ArrayList<Display> displays;
  Block(int numD, int numP) {
    numDisplays=numD;
    port=numP;
    for (int i =0; i<numDisplays; i++) {
      displays.add(new Display(i));
    }
  }
}
