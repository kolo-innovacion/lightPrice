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
    //blockAssign();
    temp=parseXML(input);
    digestXML(temp);
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
  XML[] values = input.getChildren("value");//the book contains values; these are saved as an xml object array

  for (int i = 0; i < values.length; i++) {
    //every value has a type and a figure
    XML typeObj=values[i].getChild("type");//this xml object has the interesting content
    XML figureObj=values[i].getChild("figure");//this xml object has the interesting content

    String type=typeObj.getContent();
    String figure=figureObj.getContent();
    println("XML current type: "+type+" . Value: "+figure);

    for (int j =0; j<b1.displays.size(); j++) {
      Display temp =  b1.displays.get(j);
      println("Display "+j+ " type: "+temp.getType());

      if (type.equals(temp.getType())) {
        b1.displays.get(j).setValue(figure);
        println("Value assigned");
      } else {
        //println("NO NO NO COINCIDENCE");
      }
    }
  }
}

void blockAssign() {
  for (int i =0; i<b1.displays.size(); i++) {
    Display temp =  b1.displays.get(i);
    println("TYPE: "+temp.getType());
  }
}
