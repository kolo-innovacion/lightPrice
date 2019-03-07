class Station {
  //station is a client, it contains a web socket pointing to the server and also contains blocks of displays
  ArrayList<Block> blocks  = new ArrayList<Block>();
  Station() {
    instanceSocket();
  }
  String askData() {
    stationSocket.sendMessage("giveIt2MeBaby");
    return "hola";
  }
}
