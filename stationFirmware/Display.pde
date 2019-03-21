class Display {
  String value="00.00";
  int position;//0-2, this is for the serial bytes reference; 0= master; 1,2 = Slaves 1 and 2
  String type;// price type: A= diesel, B= magna, C= premium...
  Textlabel guiDisplay;

  Display (int pos, String typ) {
    position=pos;
    type=typ;
    guiDisplay = cp5.addTextlabel("disp"+str(globalAux))
      .setText("00.00")
      .setPosition(leftMar+globalAux*50, upperMar+globalAux*50)
      .setColorValue(digitColor)
      .setFont(digitsFont);
    ;

    globalAux++;
    println("    Display  "+pos+"  has been added with type  "+typ);
  }

  Display (int bloc, int pos, String typ) {
    position=pos;
    type=typ;
    guiDisplay = cp5.addTextlabel("disp"+str(globalAux))
      .setText("b"+str(bloc)+"p"+str(pos))
      //.setPosition(leftMar+bloc*300, upperMar+pos*300)
      .setPosition(leftMar+pos*250, upperMar+bloc*200)
      .setColorValue(digitColor)
      .setFont(digitsFont);
    ;

    globalAux++;
    println("    Display  "+pos+"  has been added with type  "+typ);
  }

  String getValue() {
    return value;
  }
  void setValue(String input) {
    value=input;
  }
  String getType() {
    return type;
  }
} 
