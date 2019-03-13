class Block {
  int position;//1-3
  String portName;
  ArrayList<Display> displays  = new ArrayList<Display>();
  Serial serialPort;

  Block(int input1, String input2) {
    position=input1;
    portName=input2;
    addSerial(position, portName);
  }

  void setPortName(String input) {
    portName=input;
  }

  String getPortName() {
    return portName;
  }

  void setValue(int index, String value) {
    Display temp = displays.get(index);
    temp.setValue(value);
  }

  String getValue(int index) {
    Display temp = displays.get(index);
    return temp.getValue();
  }

  void formatValues0() {
    String threeVals=displays.get(0).getValue()+displays.get(1).getValue()+displays.get(2).getValue();
    println(threeVals);
    char[] threeValsChar = threeVals.toCharArray();
    println(threeValsChar.length);
    //int[] threeValsInt = new int[threeValsChar.length];

    int[] threeValsInt = int(byte(threeValsChar));
    println(threeValsInt);
    int[] constants = {58, 1, 119, 16, 170, 10};
    int[] fullPhrase = new int[threeValsInt.length+constants.length+1];
    println(fullPhrase.length);
    for (int i =0; i<5; i++) {
      fullPhrase[i]=constants[i];//assignment of first 5 numbers
    }
    for (int i =0; i<threeValsInt.length; i++) {
      fullPhrase[i+5]=threeValsInt[i];//assignment of 3values
    }
    println(fullPhrase);
    int tempSum=0;
    for (int i=1; i<20; i++) {
      tempSum+=fullPhrase[i];
    }
    println("Sum: "+tempSum);
    int chksum=tempSum%256;
    println(chksum);
    fullPhrase[20]=chksum;
    fullPhrase[21]=constants[5];
    printArray(fullPhrase);
  }

  void formatValues() {

    int blockSize=displays.size();


    String threeVals=displays.get(0).getValue()+displays.get(1).getValue()+displays.get(2).getValue();
    println(threeVals);
    char[] threeValsChar = threeVals.toCharArray();
    println(threeValsChar.length);
    //int[] threeValsInt = new int[threeValsChar.length];

    int[] threeValsInt = int(byte(threeValsChar));
    println(threeValsInt);
    int[] constants = {58, 1, 119, 16, 170, 10};
    int[] fullPhrase = new int[threeValsInt.length+constants.length+1];
    println(fullPhrase.length);
    for (int i =0; i<5; i++) {
      fullPhrase[i]=constants[i];//assignment of first 5 numbers
    }
    for (int i =0; i<threeValsInt.length; i++) {
      fullPhrase[i+5]=threeValsInt[i];//assignment of 3values
    }
    println(fullPhrase);
    int tempSum=0;
    for (int i=1; i<20; i++) {
      tempSum+=fullPhrase[i];
    }
    println("Sum: "+tempSum);
    int chksum=tempSum%256;
    println(chksum);
    fullPhrase[20]=chksum;
    fullPhrase[21]=constants[5];
    printArray(fullPhrase);
  }
}
