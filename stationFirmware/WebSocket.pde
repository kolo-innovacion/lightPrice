import websockets.*;
WebsocketClient stationSocket;

void instanceSocket() {
  stationSocket= new WebsocketClient(this, "ws://localhost:8025/john");
}

void webSocketEvent(String input) {
  XML temp = new XML("null");

  if (checkFetch(input)) {
    println("Correct Data. Book updated");
    println(input);

    temp=parseXML(input);
  } else {
    println("Wrong Data");
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
  //book = loadXML("book.xml");
  //book = parseXML("<book><value><type>A</type><figure>11.11</figure></value><value><type>B</type><figure>33.33</figure></value></book>");
  //book=parseXML(this.getBook());
  //book=parseXML(bookString);
  XML[] values = input.getChildren("value");//the book contains values; these are saved as an xml object array

  for (int i = 0; i < values.length; i++) {
    //every value has a type and a figure
    XML typeObj=values[i].getChild("type");//this xml object has the interesting content
    XML figureObj=values[i].getChild("figure");//this xml object has the interesting content

    String type=typeObj.getContent();
    String figure=figureObj.getContent();
    println(type);
    println(figure);
    //String id = children[i].getString("type");
    //String coloring = children[i].getString("figure");
    //String name = children[i].getContent();
    //println(id + ", " + coloring + ", " + name);
  }
}
