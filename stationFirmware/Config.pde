XML station;
void createConfig() {
  station = loadXML("stationConfig00.xml");

  XML[] blocks = station.getChildren("block");
  //println("Total blocks in station:  "+blocks.length);

  s0=new Station();
  println("Station Instancing START");

  for (int i=0; i<blocks.length; i++) {

    XML[] displays = blocks[i].getChildren("display");
    //println("Block "+i+ "  has  "+displays.length+"  displays.");

    s0.blocks.add(new Block(displays.length, 0));
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
}
