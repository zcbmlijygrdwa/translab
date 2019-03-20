class Word {
  String content;
  double senseRange = 30;
  double relaxOffset = 10;
  double friction = 0.005;
  int ID;
  int[] memberIDs;


  double x; 
  double vx;

  double y;
  double vy;

  int R = 0;
  int G = 0;
  int B = 0;


  double screenMargin = 20;

  double targetX = 0;
  double targetY = 0;
  
  boolean ifMakeMindToTarget = false;




  Word(String sInput, double xInput, double yInput, int[] ids) {
    content = sInput;
    x = xInput;
    y = yInput;
    ID = (int)random(999999);
    vx = random(0.05);
    vy = random(0.05);
    memberIDs = ids;
  }


  Word(String sInput,int[] ids) {
    content = sInput;
    x = random(100);
    y = random(100);
    ID = (int)random(999999);
    vx = random(0.5);
    vy = random(0.5);
    memberIDs = ids;
  }
  
}