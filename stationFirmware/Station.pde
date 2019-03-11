class Station {
  //station is a client, it contains a web socket pointing to the server and also contains blocks of displays
  ArrayList<Block> blocks  = new ArrayList<Block>();
  XML book;
  String bookString="";
  Station() {
    instanceSocket();
  }
  void updateValues() {
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
  
  void createStation() {
  XML configFile;
  //station = loadXML("stationConfig00.xml");
  configFile = loadXML("stationConfig01.xml");

  XML[] blocks = configFile.getChildren("block");
  //println("Total blocks in station:  "+blocks.length);

  //s0=new Station();
  println("Station Instancing START");

  for (int i=0; i<blocks.length; i++) {

    XML[] displays = blocks[i].getChildren("display");
    //println("Block "+i+ "  has  "+displays.length+"  displays.");

    s0.blocks.add(new Block(i, 0));
    //println("Station has"+s0.blocks.size()+"blocks.");
    for (int j=0; j<displays.length; j++) {
      XML pos = displays[j].getChild("position");
      XML typ = displays[j].getChild("type");
      //println(pos.getContent());
      String temPos=pos.getContent();
      String temTyp=typ.getContent();
      s0.blocks.get(i).displays.add(new Display(int(temPos), temTyp));
      //println("Display "+j+" has position "+int(temPos)+" and type "+typ.getContent());
    }
  }
  //println();

  println("Station Instancing END -----");
  println(  s0.blocks.get(0).displays.get(2).getType());//this is a test! Objects are real!!! (obviously, inside array limits)
  //  println();
}
  
}
