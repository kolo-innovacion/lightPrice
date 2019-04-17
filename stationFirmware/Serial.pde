import processing.serial.*;


ArrayList<Serial> serialPorts  = new ArrayList<Serial>();

void addSerial(int pos, String input) {
  serialPorts.add(new Serial(this, input, 4800, 'N', 8, 1));
  printole("  Block "+pos+" created in port "+input);
}

void sendToCard(int[] input) {
  printArray(input);
}
