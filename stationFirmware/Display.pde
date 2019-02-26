class Display {
  String value="00.00";
  int position;//0-2, this is for the serial bytes reference; 0= master; 1,2 = Slaves 1 and 2
  String type;// price type: A= diesel, B= magna, C= premium...

  Display (int pos, String typ) {
    position=pos;
    type=typ;
  }

  String getValue() {
    return value;
  }
  void setValue(String input) {
    value=input;
  }
} 
