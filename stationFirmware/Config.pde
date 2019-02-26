XML xml;

void loadConfig() {
  xml = loadXML("config.xml");
}

void createStation() {
  println(xml.hasChildren());
  XML[] blocks=xml.getChildren("block");
  for (int i = 0; i < blocks.length; i++) {
    println(blocks[i].getContent());
  }
}
