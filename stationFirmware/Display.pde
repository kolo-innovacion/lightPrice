class Display {
  String value="00.00";
  int position;//0-2, this is for the serial bytes reference 
  String type;// for dashboard reference, column and row

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
