XML station;
void createConfig() {
  station = loadXML("stationConfig00.xml");

  XML[] blocks = station.getChildren("block");
  println("Total blocks in station:  "+blocks.length);

  for (int i=0; i<blocks.length; i++) {
    XML[] displays = blocks[i].getChildren("display");
    println("Block "+i+ "  has  "+displays.length+"  displays.");
    for (int j=0; j<displays.length; j++) {
      XML pos = displays[j].getChild("position");
      XML typ = displays[j].getChild("type");
      //println(pos.getContent());
      println("Display "+j+" has position "+pos.getContent()+" and type "+typ.getContent());
    }
  }
  //println();
}
