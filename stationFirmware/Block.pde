class Block {
  int numDisplays;//1-3
  int port;
  ArrayList<Display> displays  = new ArrayList<Display>();

  Block(int numD, int numP) {
    numDisplays=numD;
    port=numP;
    for (int i =0; i<numDisplays; i++) {
      displays.add(new Display(i, types[i]));

      println("Display  "+i+"  has been added with type  "+types[i]);
    }
    println(numDisplays+"  displays have been created in the block");
  }
  void setValue(int index, String value) {
    Display temp = displays.get(index);
    temp.setValue(value);
  }

  String getValue(int index) {
    Display temp = displays.get(index);
    return temp.getValue();
  }
}
