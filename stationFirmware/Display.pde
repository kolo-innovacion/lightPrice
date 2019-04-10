class Display {
  String value="00.00";
  //String value="13.27";
  int position;//0-2, this is for the serial bytes reference; 0= master; 1,2 = Slaves 1 and 2
  String type;// price type: A= diesel, B= magna, C= premium...
  Textlabel guiValue;
  Textlabel guiDetail;
  Textlabel[] valueDigs = new Textlabel[5];

  Display (int bloc, int pos, String typ) {
    position=pos;
    type=typ;

    //guiValue = cp5.addTextlabel("guiValue"+"B"+str(bloc)+"P"+str(pos))
    //  .setText("b"+str(bloc)+"p"+str(pos))
    //  .setPosition(leftMar+pos*250, upperMar+bloc*150)
    //  .setColorValue(digitColor)
    //  .setFont(digitsFont);

    createGuiDigs(bloc, pos, value);

    guiDetail=cp5.addTextlabel("guiDetail"+"B"+str(bloc)+"P"+str(pos))
      .setText(type)
      .setPosition(140+leftMar+pos*250, digitSize+2*module+upperMar+bloc*150)
      .setColorValue(detailColor)
      .setFont(detailFont);

    println("    Display  "+pos+"  has been added with type  "+typ);
    //println(guiValue.getLabel());
  }

  String getValue() {
    return value;
  }
  void setValue(String input) {
    value=input;
    setGuiDigs(value);
    //guiValue.setText(input);
  }
  String getType() {
    return type;
  }

  void createGuiDigs(int bloc, int pos, String input) {
    for (int i=0; i<valueDigs.length; i++) {
      valueDigs[i]=cp5.addTextlabel("B"+str(bloc)+"P"+str(pos)+"D"+i)
        //.setText(str(i))
        .setText(str(input.charAt(i)))
        .setPosition(115+leftMar+pos*250+(i*(digitSize*0.50)), 2.0*module+upperMar+bloc*150)
        .setColorValue(digitColor)
        .setFont(digitsFont);
    }
  }

  void setGuiDigs(String input) {
    for (int i=0; i<valueDigs.length; i++) {
      valueDigs[i].setText(str(input.charAt(i)));
    }
  }
} 
