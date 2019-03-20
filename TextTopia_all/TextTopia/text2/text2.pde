import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim;
AudioPlayer[] song = new AudioPlayer[5];
//float c = 0;

//stable floids
//implement 




ArrayList<String> tempWords = new ArrayList<String>();

double mouseEffectRange = 100;
//float c = 0;
double mouseVelocityEffectRange = 5;




double x = 150;
double y = 150; 

int maxFontSize = 25;
int numberOfLetterSets = 7;

int screenX = 0;
int screenY = 0;

int counter = 0;
String temp = "";
String tempAns = ""; 
String[] tempPermu = new String[10000];
;
XML xml;

Letter u;
Letter c;
Letter s;
Letter b;
Letter tempLetter;

Letter[] letterSet = new Letter[10000];

String[] dict;


float mouseX_shift = 0;
float mouseY_shift = 0;
float mouseX_prev = 0;
float mouseY_prev = 0;
boolean isInitPress = true;

boolean ifShowFlow = false;

Flow[][] fields;


void setup() {
  //size(1200, 800);
  fullScreen();
  frameRate(120);
  //dict = loadStrings("words.txt");
  dict = loadStrings("words4kids.txt");

  screenX = width;
  screenY = height;
  fields = new Flow[screenX][screenY];
  for (int k = 0; k<numberOfLetterSets; k++) {

    tempLetter = new Letter("a", 250, 250, screenX, screenY);
    addLetter(tempLetter, letterSet);
    tempLetter = new Letter("b", 250, 250, screenX, screenY);
    addLetter(tempLetter, letterSet);
    tempLetter = new Letter("c", 250, 250, screenX, screenY);
    addLetter(tempLetter, letterSet);
    tempLetter = new Letter("d", 250, 250, screenX, screenY);
    addLetter(tempLetter, letterSet);
    tempLetter = new Letter("e", 250, 250, screenX, screenY);
    addLetter(tempLetter, letterSet);
    tempLetter = new Letter("f", 250, 250, screenX, screenY);
    addLetter(tempLetter, letterSet);
    tempLetter = new Letter("g", 250, 250, screenX, screenY);
    addLetter(tempLetter, letterSet);
    tempLetter = new Letter("h", 250, 250, screenX, screenY);
    addLetter(tempLetter, letterSet);
    tempLetter = new Letter("i", 250, 250, screenX, screenY);
    addLetter(tempLetter, letterSet);
    tempLetter = new Letter("j", 250, 250, screenX, screenY);
    addLetter(tempLetter, letterSet);
    tempLetter = new Letter("k", 250, 250, screenX, screenY);
    addLetter(tempLetter, letterSet);
    tempLetter = new Letter("l", 250, 250, screenX, screenY);
    addLetter(tempLetter, letterSet);
    tempLetter = new Letter("m", 250, 250, screenX, screenY);
    addLetter(tempLetter, letterSet);
    tempLetter = new Letter("n", 250, 250, screenX, screenY);
    addLetter(tempLetter, letterSet);
    tempLetter = new Letter("o", 250, 250, screenX, screenY);
    addLetter(tempLetter, letterSet);
    tempLetter = new Letter("p", 250, 250, screenX, screenY);
    addLetter(tempLetter, letterSet);
    tempLetter = new Letter("q", 250, 250, screenX, screenY);
    addLetter(tempLetter, letterSet);
    tempLetter = new Letter("r", 250, 250, screenX, screenY);
    addLetter(tempLetter, letterSet);
    tempLetter = new Letter("s", 250, 250, screenX, screenY);
    addLetter(tempLetter, letterSet);
    tempLetter = new Letter("t", 250, 250, screenX, screenY);
    addLetter(tempLetter, letterSet);
    tempLetter = new Letter("u", 250, 250, screenX, screenY);
    addLetter(tempLetter, letterSet);
    tempLetter = new Letter("v", 250, 250, screenX, screenY);
    addLetter(tempLetter, letterSet);
    tempLetter = new Letter("w", 250, 250, screenX, screenY);
    addLetter(tempLetter, letterSet);
    tempLetter = new Letter("y", 250, 250, screenX, screenY);
    addLetter(tempLetter, letterSet);
    tempLetter = new Letter("z", 250, 250, screenX, screenY);
    addLetter(tempLetter, letterSet);
  }



  //fiileds init
  for (int i = 0; i<screenX; i++) {
    for (int j = 0; j<screenY; j++) {
      fields[i][j] = new Flow(0, 0);
    }
  }

  //letterSet[0] = s;
  //letterSet[1] = b;
  //print("test = "+s.getDistanceToMe(b.getX(), b.getY()));

  //for(int i = 0;i < 40;i++){
  // println("test = "+i+", "+letterSet[i]); 
  //}

  //println("=============");


  minim = new Minim(this);
  song[0] = minim.loadFile("cowbell-os-1.aiff");
  song[1] = minim.loadFile("cowbell-os-2.aiff");
  song[2] = minim.loadFile("cowbell-os-3.aiff");
  song[3] = minim.loadFile("cowbell-os-4.aiff");
  song[4] = minim.loadFile("cowbell-os-5.aiff");
}


void draw() {


  background(255);


  //=======================  Mouse Movement  ===================

  //===== detect mouse press
  if (mousePressed == true) {
    int range = 80;
    for (int i =mouseX-range; i<mouseX+range; i++) {
      for (int j =mouseY-range; j<mouseY+range; j++) {
        if (i>=0&&i<screenX&&j>=0&&j<screenY) {

          if (isInitPress) {
            mouseX_shift = 0;
            mouseY_shift = 0;
          } else {
            //mouseX_shift = (mouseX-mouseX_prev)*0.0001/getDistance(i-mouseX,j-mouseY);
            //mouseY_shift = (mouseY-mouseY_prev)*0.0001/getDistance(i-mouseX,j-mouseY);

            mouseX_shift = (mouseX-mouseX_prev)*0.5/(float)(getDistance(i, j, mouseX, mouseY)+i*0.01);
            mouseY_shift = (mouseY-mouseY_prev)*0.5/(float)(getDistance(i, j, mouseX, mouseY)+i*0.01);
          }

          fields[i][j].setFlow(mouseX_shift, mouseY_shift);
        }
      }
    }

    if (isInitPress) {
      isInitPress = false;
    }

    mouseX_prev = mouseX;
    mouseY_prev = mouseY;
  } else {
    isInitPress = true;
  }


  //===== end of detecting mouse press

  //======================= End of Mouse Movement  ===================



  //println("fields[i][j] = "+fields[250][250].flowX); 


  //======  Flow  ====

  for (int i = 1; i<screenX; i++) {
    for (int j = 1; j<screenY; j++) {
      fields[i][j].attenuate();
    }
  }

  if (ifShowFlow)
    drawFlow();
  //======  End of Flow  ====






  for (int i = 0; i<letterSet.length; i++) {
    if (letterSet[i]!=null) {




      // apply flows


      letterSet[i].setFlow(fields[(int)letterSet[i].getX()][(int)letterSet[i].getY()].flowX, fields[(int)letterSet[i].getX()][(int)letterSet[i].getY()].flowY);


      if (!letterSet[i].ifInWord) {
        if (letterSet[i].letterSize<maxFontSize) {
          letterSet[i].letterSize += 0.01;
        }
        
        if(letterSet[i].age<0)
        letterSet[i].age++;
        
      }
      
      else{
       
         if(letterSet[i].age<letterSet[i].lifeTime){
        letterSet[i].age++;
        
        if(letterSet[i].age>letterSet[i].lifeTime*0.9){
          letterSet[i].letterSize+=random(4)-2;  //blink
          letterSet[i].letterSize = Math.abs(letterSet[i].letterSize); //make sure it is positive
        }
        
        }
        else{
          //ejection
          letterSet[i].ifInWord = false;
          letterSet[i].age=-40;
          letterSet[i].setRGB(0, 0, 0);
          letterSet[i].letterSize=letterSet[i].defaultLetterSize;
          letterSet[i].setTarget(letterSet[i].x+Math.pow(-1,(int)random(2))*(50+random(100)),letterSet[i].y+Math.pow(-1,(int)random(2))*(50+random(100)));
        }
        
      }


      //end of applying flows





      ////detecting word
      temp = letterSet[i].sense(letterSet);





      ////end of detecting word
    } else {
      break;
    }
  }


  renderAllLeters(letterSet);







  //pose update
  //mouseX_prev = mouseX;
  //mouseY_prev = mouseY;
}


void keyPressed(){
  //if (keyAnalyzer(key).compareTo("LETTER") == 0 || keyAnalyzer(key).compareTo("NUMBER") == 0)
  //{
  //  temp+=key;
  //}
  //if (keyCode == BACKSPACE)
  //{
  //  //String temp2
  //  temp = temp.substring(0, temp.length()-1);
  //}

  if (key=='v') {
    ifShowFlow = !ifShowFlow;
  }
}





void drawArrow(int cx, int cy, float fx, float fy) {
  pushMatrix();
  translate(cx, cy);
  line(0, 0, fx*300, fy*300);
  stroke(255, 0, 0);
  strokeWeight(2);
  point(0, 0);
  stroke(0, 0, 0);
  strokeWeight(1);
  popMatrix();
}

void drawFlow() {
  for (int i = 1; i<screenX; i+=30) {
    for (int j = 1; j<screenY; j+=30) {
      drawArrow(i, j, fields[i][j].flowX, fields[i][j].flowY);
      //fields[i][j].attenuate();
    }
  }
}
