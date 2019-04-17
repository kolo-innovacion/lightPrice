import websockets.*;
WebsocketClient stationSocket;

void instanceSocket() {
  //stationSocket= new WebsocketClient(this, "ws://localhost:8025/john");

  stationSocket= new WebsocketClient(this, "ws://167.114.208.204:8025/john");
}

void webSocketEvent(String input) {
  XML temp = new XML("null");

  if (checkFetch(input)) {
    //println();

    //println("Correct Data. Book updated");

    //println();



    temp=parseXML(input);
    station.setBook(temp);
  } else {
    //println("Wrong Data");
  }
}

boolean checkFetch(String input) {
  if (input.equals("Null")) {
    return false;
  } else {
    return true;
  }
}

void digestXML(XML input) {
  XML[] values = input.getChildren("value");//the book contains values; these are saved as an xml object array

  for (int i = 0; i < values.length; i++) {
    //every value has a type and a figure
    XML typeObj=values[i].getChild("type");//this xml object has the interesting content
    XML figureObj=values[i].getChild("figure");//this xml object has the interesting content

    String type=typeObj.getContent();
    String figure=figureObj.getContent();
    //println("XML current type: "+type+" . Value: "+figure);
    station.book.set(type, figure);
    //println(s0.book.get(type));
  }
}
