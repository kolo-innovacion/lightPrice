import processing.serial.*;


ArrayList<Serial> serialPorts  = new ArrayList<Serial>();

void addSerial(int pos, String input) {
  serialPorts.add(new Serial(this, input, 9600));

  println("  Block "+pos+" created in port "+input);
}
