class Block {
  int position;//1-3
  String portName;
  ArrayList<Display> displays  = new ArrayList<Display>();
  Serial serialPort;

  Block(int input1, String input2) {
    position=input1;
    portName=input2;
    addSerial(position, portName);
    createGui();
  }

  void createGui() {


    int groupStartX=module;
    int groupStartY=2*module+position*8*module;

    if (position==0) {
      createGuiBlock0();
    } else {
      createGuiBlockN();
    }

    /////////////////
    //delete this after design:
    /*
    
     position++;
     createGuiBlockN();  
     position++;
     createGuiBlockN();
     position=0;
     */

    /////////////////
  }

  void createGuiBlockN() {


    int groupStartX=module;
    int groupStartY=2*module+position*8*module;

    cp5.addGroup("Block"+str(position))
      .setPosition(groupStartX, groupStartY)
      .setHeight(0)
      .setBackgroundHeight(140)
      .setWidth(width-leftMar)
      .setBackgroundColor(color(255, 50))
      .disableCollapse()
      .setLabel("")
      ;

    cp5.addTextlabel("portLabel"+str(position))
      .setText("BLOCK "+str(position)+"\n"+"\n"+portName)
      .setPosition(leftMar*0.70, position*150+upperMar*3.40)
      .setColorValue(okColor)
      .setFont(labelFont)
      ;
  }

  void createGuiBlock0() {

    int groupStartX=module;
    int groupStartY=2*module+position*8*module;

    cp5.addGroup("Block"+str(position))
      .setPosition(groupStartX, groupStartY)
      .setHeight(30)
      .setBackgroundHeight(140)
      .setWidth(width-leftMar)
      .setBackgroundColor(color(255, 50))
      .disableCollapse()
      .setLabel("")
      ;

    cp5.addTextlabel("dispIndexLabel")
      .setText("Display: ")
      .setPosition(groupStartX+0.250*module, groupStartY-1.50*module)
      .setColorValue(255)
      .setFont(labelFont)
      ;

    cp5.addTextlabel("dispIndex"+str(0))
      .setText("0")
      .setPosition(groupStartX+10*module, groupStartY-1.50*module)
      .setColorValue(255)
      .setFont(labelFont)
      ;

    cp5.addTextlabel("dispIndex"+str(1))
      .setText("1")
      .setPosition(groupStartX+24*module, groupStartY-1.50*module)
      .setColorValue(255)
      .setFont(labelFont)
      ;

    cp5.addTextlabel("dispIndex"+str(2))
      .setText("2")
      .setPosition(groupStartX+35*module, groupStartY-1.50*module)
      .setColorValue(255)
      .setFont(labelFont)
      ;

    cp5.addTextlabel("portLabel"+str(position))
      .setText("BLOCK "+str(position)+"\n"+"\n"+portName)
      .setPosition(leftMar*0.70, position*150+upperMar*3.40)
      .setColorValue(okColor)
      .setFont(labelFont)
      ;
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

  void formatSendValues() {

    int blockSize=displays.size();


    String threeVals=displays.get(0).getValue()+displays.get(1).getValue()+displays.get(2).getValue();
    char[] threeValsChar = threeVals.toCharArray();
    int[] threeValsInt = int(byte(threeValsChar));
    int[] constants = {58, 1, 119, 16, 170, 10};
    int[] fullPhrase = new int[threeValsInt.length+constants.length+1];
    for (int i =0; i<5; i++) {
      fullPhrase[i]=constants[i];//assignment of first 5 numbers
    }
    for (int i =0; i<threeValsInt.length; i++) {
      fullPhrase[i+5]=threeValsInt[i];//assignment of 3values
    }
    int tempSum=0;
    for (int i=1; i<20; i++) {
      tempSum+=fullPhrase[i];
    }
    int chksum=tempSum%256;
    fullPhrase[20]=chksum;
    fullPhrase[21]=constants[5];

    //println("THIS BLOCK IS:  "+position);

    byte[]fullPhraseByte=new byte[fullPhrase.length];
    fullPhraseByte=byte(fullPhrase);
    //printArray(fullPhraseByte);

    serialPorts.get(position).write(fullPhraseByte);
    println("Block "+position+"  Serial values sent.");
  }
}
