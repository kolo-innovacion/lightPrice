class Station {
  //station is a client, it contains a web socket pointing to the server and also contains blocks of displays
  ArrayList<Block> blocks  = new ArrayList<Block>();
  StringDict book =new StringDict();
  String bookString="";
  String configPath="stationConfig03.xml";
  Station() {
    instanceSocket();


    cp5.addGroup("Station")
      .setPosition(module, 28.0*module)
      .setHeight(30)
      .setBackgroundHeight(140)
      .setWidth(int(width*0.720))
      .setBackgroundColor(color(255, 50))
      .disableCollapse()
      .setLabel("")
      ;


    /*

     cp5.addTextlabel("noBlock0")
     .setText("NO BLOCK HAS BEEN CONFIGURED ON THIS POSITION")
     .setPosition(5.5*module, 4*module)
     .setColorValue(255)
     .setFont(noBlockFont)
     ;
     cp5.addTextlabel("noBlock1")
     .setText("NO BLOCK HAS BEEN CONFIGURED ON THIS POSITION")
     .setPosition(5.5*module, 12*module)
     .setColorValue(255)
     .setFont(noBlockFont)
     ;
     
     cp5.addTextlabel("noBlock2")
     .setText("NO BLOCK HAS BEEN CONFIGURED ON THIS POSITION")
     .setPosition(5.5*module, 20*module)
     .setColorValue(255)
     .setFont(noBlockFont)
     ;
     */    


    cp5.addTextlabel("ConsoleLabel")
      .setText("Console")
      .setPosition(module, 26.60*module)
      .setColorValue(255)
      .setFont(labelFont)
      ;

    cp5.addTextlabel("StationLabel")
      .setText("Station ID: 1010")
      .setPosition(32.6*module, 26.60*module)
      .setColorValue(255)
      .setFont(labelFont)
      ;

    cp5.addTextlabel("serverLabel")
      .setText("Connected to server")
      .setPosition(32.6*module, 28.60*module)
      .setColorValue(okColor)
      .setFont(labelFont)
      ;
  }
  void updateBook() {
    stationSocket.sendMessage("giveIt2MeBaby");
    printole("Petition sent.");
  }

  void setBook(XML input) {
    XML[] values = input.getChildren("value");//the book contains values; these are saved as an xml object array

    for (int i = 0; i < values.length; i++) {
      //every value has a type and a figure
      XML typeObj=values[i].getChild("type");//this xml object has the interesting content
      XML figureObj=values[i].getChild("figure");//this xml object has the interesting content

      String type=typeObj.getContent();
      String figure=figureObj.getContent();
      printole("XML current type: "+type+" . Value: "+figure);
      s0.book.set(type, figure);
      printole("Dictionary: "+s0.book.get(type));
    }
  }

  void updateBlocks() {
    for (int i=0; i<blocks.size(); i++) {
      //printole("Block "+i+" hex values: ");
      blocks.get(i).formatSendValues();
    }
  }

  void accessBlocks() {
    delay(2000);
    for (int i=0; i<blocks.size(); i++) {
      //i is the blocks index
      for (int j=0; j<blocks.get(i).displays.size(); j++) {
        //j is the displays index
        String currType=blocks.get(i).displays.get(j).getType();
        blocks.get(i).displays.get(j).setValue(book.get(currType));
        String currValue=blocks.get(i).displays.get(j).getValue();
        printole("Block "+i+" display "+j+" has type "+currType+" and price of "+currValue);
      }
    }
  }

  void createStation() {
    XML configFile;
    configFile = loadXML(configPath);

    XML[] blocks = configFile.getChildren("block");
    printole("Station Instancing START");

    for (int i=0; i<blocks.length; i++) {

      XML port = blocks[i].getChild("port");
      String currPort=port.getContent();

      XML[] displays = blocks[i].getChildren("display");

      s0.blocks.add(new Block(i, currPort));
      for (int j=0; j<displays.length; j++) {
        XML pos = displays[j].getChild("position");
        XML typ = displays[j].getChild("type");
        String temPos=pos.getContent();
        String temTyp=typ.getContent();
        //s0.blocks.get(i).displays.add(new Display(int(temPos), temTyp));
        s0.blocks.get(i).displays.add(new Display(i, int(temPos), temTyp));
      }
    }

    printole("Station Instancing END -----");
  }

  void setDictionary() {
    book.set("A", "88.88");
    book.set("B", "99.99");
  }
}
