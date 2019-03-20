
int screenX = 0;
int screenY = 0;


Letter tempLetter;



void setup() {
  size(1200, 800);
 
  frameRate(120);


  screenX = width;
  screenY = height;

  tempLetter = new Letter("a", 100, 100, screenX, screenY);

}


void draw() {

  background(255);


tempLetter.drawMe();



}


void keyPressed(){

}

void mouseClicked() {
  tempLetter.setTarget(mouseX,mouseY);
}