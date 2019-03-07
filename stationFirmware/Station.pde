class Station {
  //station is a client, it contains a web socket pointing to the server and also contains blocks of displays
  ArrayList<Block> blocks  = new ArrayList<Block>();
  XML book;
  String bookString="";
  Station() {
    instanceSocket();
  }
  void askData() {
    stationSocket.sendMessage("giveIt2MeBaby");
  }
  void updateBook(String input) {
    book = parseXML(input);
  }
  void setBook(XML input) {
  }
  XML getBook() {
    return book;
  }
}
