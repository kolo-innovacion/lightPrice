import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class stationFirmware extends PApplet {

//CURRENT OBJECTIVE: to set the value of 3 displays using the display class
Display d1 = new Display(0, "A");
Display d2 = new Display(1, "A");
Display d3 = new Display(2, "B");

Block b1;


String[] values = {"11.11", "33.33", "77.77"};
String[] types = {"A", "A", "B"};

public void setup() {
  
  b1 = new Block(3, 0);//instanciation; 3 displays, COM port in index 0
  b1.setValue(0, "1111.");
  b1.setValue(1,"2222.");
  b1.setValue(2,"3333.");
  println(b1.getValue(0));
  b1.formatValues();
}
public void draw() {
}
class Block {
  int numDisplays;//1-3
  int port;
  ArrayList<Display> displays  = new ArrayList<Display>();

  Block(int numD, int numP) {
    numDisplays=numD;
    port=numP;
    for (int i =0; i<numDisplays; i++) {
      displays.add(new Display(i, types[i]));

      println("Display  "+i+"  has been added with type  "+types[i]);
    }
    println(numDisplays+"  displays have been created in the block");
  }
  public void setValue(int index, String value) {
    Display temp = displays.get(index);
    temp.setValue(value);
  }

  public String getValue(int index) {
    Display temp = displays.get(index);
    return temp.getValue();
  }

  public void formatValues(){
String threeVals=displays.get(0).getValue()+displays.get(1).getValue()+displays.get(2).getValue();
println(threeVals);
char[] threeValsChar = threeVals.toCharArray();
println(threeValsChar.length);
//int[] threeValsInt = new int[threeValsChar.length];

int[] threeValsInt = PApplet.parseInt(PApplet.parseByte(threeValsChar));
println(threeValsInt);
int[] constants = {1,2,3,4,5,6};

  }

}
class Display {
  String value="00.00";
  int position;//0-2, this is for the serial bytes reference; 0= master; 1,2 = Slaves 1 and 2
  String type;// price type: A= diesel, B= magna, C= premium...

  Display () {
  }
  
  Display (int pos, String typ) {
    position=pos;
    type=typ;
  }

  public String getValue() {
    return value;
  }
  public void setValue(String input) {
    value=input;
  }
} 

  public void settings() {  size(300, 400); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "stationFirmware" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
