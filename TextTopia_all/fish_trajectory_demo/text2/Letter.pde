class Letter {
  String content;
  double senseRange = 30;
  double relaxOffset = 2;
  double friction = 0.999;
  float randomWalkSize = 1;
  float sizeX = 0;   //screenX
  float sizeY = 0;   //screenX
  float defaultLetterSize = 12;   //screenX
  float letterSize = defaultLetterSize;   //screenX
  
  float  lifeTime = 800;
  float age = 0;

  int ID;



  //escape parameters
  double fishness = 0.03;//random(0.03);  //(0.015)
  float p = random(3.14);   // phase
  float T = 5;
  float swiftness = 0.04f;

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
  boolean ifInWord = false;




  Letter(String sInput, double xInput, double yInput, float size1Input, float size2Input) {
    content = sInput;
    x = xInput;
    y = yInput;
    ID = (int)random(999999);
    vx = 0;
    vy = 0;
    sizeX = size1Input;
    sizeY = size2Input;
  }


  Letter(String sInput, float size1Input, float size2Input) {
    content = sInput;
    x = random(100);
    y = random(100);
    ID = (int)random(999999);
    vx = random(0.5);
    vy = random(0.5);
    sizeX = size1Input;
    sizeY = size2Input;
  }


  int getID() {
    return ID;
  }


  String getContent() {
    return content;
  }


  double getDistanceToMe(double xIn, double yIn) {
    return Math.sqrt((x-xIn)*(x-xIn)+(y-yIn)*(y-yIn));
  }

  double getX() {
    return x;
  }

  double getY() {
    return y;
  }

  void setX(double xIn) {
    x = xIn;
  }

  void setY(double yIn) {
    y = yIn;
  }

  void setRGB(int a, int d, int c) {
    R =a ;
    G = d;
    B = c;
  }

  void setXY(double xIn, double yIn) {
    x = xIn; 
    y = yIn;
  }

  void setTarget(double a, double b) {

    if (a<0) {
      targetX = screenMargin;
    } else if (a>=screenX) {
      targetX = screenX-screenMargin;
    } else {
      targetX = a;
    }

    if (b<0) {
      targetY = screenMargin;
    } else if (b>=screenY) {
      targetY = screenY-screenMargin;
    } else {
      targetY = b;
    }

    targetY= b; 
    ifMakeMindToTarget = true;
  }


  void setFlow(double fx, double fy) {
    vx+=fx;
    vy+=fy;
  }

  void drawMe() {
    fill(R, G, B, 270-letterSize*2);
    textSize(letterSize);
    text(content, (float)x, (float)y);

    updateLocation();
  }


  void escape() {

    //likefis
  }

  void updateLocation() {
    //update location
    if (!ifMakeMindToTarget) {  // random walk when not going to a target
      if (!ifInWord) {  //random walk when no in a word
        if (random(100)<0.5) { //20% possibility to update velocities
          //vx+=(random(2)-1.0);
          //vy+=(random(2)-1.0);
          //vx+=(random(randomWalkSize)-0.5*randomWalkSize);
          //vy+=(random(randomWalkSize)-0.5*randomWalkSize);
        }
      }



      //friction  //2 stages
      if (Math.abs(vx)<2&&Math.abs(vy)<2) {
        vx*=friction;
        vy*=friction;
      } else {
        vx*=friction*0.8;
        vy*=friction*0.8;
      }

      //if (vx<=0)
      //  vx+=friction;  //friction
      //else
      //  vx-=friction;  //friction

      //if (vy<=0)
      //  vy+=friction;  //friction
      //else
      //  vy-=friction;  //friction
    } else {



      /*
      if ((targetX - x)>0) {
        vx = (targetX - x)*swiftness+fishness*(targetY - y)*sin(frameCount/T+p);
      } else {
        vx = (targetX - x)*swiftness-fishness*(targetY - y)*sin(frameCount/T+p);
      }

      if ((targetY - y)>0) {
        vy = (targetY - y)*swiftness-fishness*(targetY - y)*sin(frameCount/T+p);
      } else {
        vy = (targetY - y)*swiftness+fishness*(targetY - y)*sin(frameCount/T+p);
      }
      */
      
         
        vx = (targetX - x)*swiftness;
        vy = (targetY - y)*swiftness;
        
        
        float ang = atan2((float)(targetY - y),(float)(targetX - x));
        //println("ang = "+ang);
        float h = sin(frameCount/T+p);
        vx += h*sin(ang)*fishness*(targetY - y);
        vy += h*cos(ang)*fishness*(targetX - x);
      
      
      //println("targetY - y = "+(targetY - y));

      if (Math.abs(targetX - x)<relaxOffset&&Math.abs(targetY - y)<relaxOffset&&vx<0.01&&vy<0.01) {
        if (!ifInWord) {  // if not in a word, release/relax
          ifMakeMindToTarget = false;
        }
      }
    }


    x+=vx;
    y+=vy;


    ////wall colision
    //    if (x<screenMargin) {
    //      //x = screenMargin;
    //      vx=-random(0.7)*vx;
    //    }
    //    if (x>screenX-screenMargin) {
    //      //x = screenX-screenMargin;
    //      vx=-random(0.7)*vx;
    //    }

    //    if (y<screenMargin) {
    //      //y = screenMargin;
    //      vy=-random(0.7)*vy;
    //    }
    //    if (y>screenY-screenMargin) {
    //      //y = screenY-screenMargin;
    //      vy=-random(0.7)*vy;
    //    }

    //screen cross
    if (x<=0) {
      x = sizeX+x;
    } else if (x>=sizeX) {
      x = x-sizeX;
    }


    if (y<=0) {
      y = sizeY+y;
    } else if (y>=sizeY) {
      y = y-sizeY;
    }
  }
}