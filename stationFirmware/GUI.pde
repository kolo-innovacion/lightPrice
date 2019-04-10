PImage logo;



//int digitColor=0xffff0000;
int digitColor=192;
int detailColor=0xffff0000;
//int labelColor=0xffffffff;
int labelColor=159;
int borderColor=63;
int failColor=0xffff0000;
int okColor=0xff00ff00;
int warningColor=0xffffd300;
int backColor=0;

String manualValue="0000.";

ControlP5 cp5;

///////////////////


Textarea myTextarea;
int c = 0;
Println console;


/////////////////////////

Textlabel digits;
Textlabel serialLabel;
Textlabel serverLabel;


Textlabel serialLed;
Textlabel serverLed;

//Println console;


//margins
int leftMar=40;
int upperMar=20;
int module=20;
int labelMar=module*3;

int groupMar=20;

int digitSize=70;
int labelSize=20;

//fonts
PFont digitsFont;
PFont detailFont;
PFont labelFont;
PFont consoleFont;
PFont noBlockFont;

//userConsole
Textarea consoleArea;
Textfield manualInput;

//gui Functions
void guiSetup() {
  logo=loadImage("kolo_logo_white.png");
  noStroke();

  frameRate(20);
  //createFonts


  labelFont = createFont("arial", labelSize); 
  noBlockFont = createFont("arial", 1.2*labelSize); 
  consoleFont = createFont("arial", labelSize-4);
  detailFont = createFont("arial", labelSize-4);
  digitsFont= createFont("digital-7.ttf", digitSize);

  //create gui cp5 obj
  cp5 = new ControlP5(this);
  cp5.enableShortcuts();

  myTextarea = cp5.addTextarea("txt")
    .setPosition(1.50*module, 28.35*module)
    .setSize(int(width*0.70), 130)
    .setFont(createFont("", 14))
    .setLineHeight(14)
    .setColor(color(255))
    .setColorBackground(color(0, 100))
    .setColorForeground(color(255, 100));
  ;
}
void createConsole() {

  console = cp5.addConsole(myTextarea);//
}
void updateGUI() {
}
