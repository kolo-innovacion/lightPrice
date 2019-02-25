class Display {
  String value="00.00";
  int position;//0-2, this is for the serial bytes reference 
  String id;// for dashboard reference, column and row
  Display (int pos) {
    position=pos;
  }
  String getValue() {
    return value;
  }
  void setValue(String input) {
    value=input;
  }
} 
