class Flow{
 
  float flowX = 0;
  float flowY = 0;
  float ang = 0;
  float len = 0;
  
  Flow(float xi, float yi){ 
    flowX = xi;
    flowY = yi;
    getAng();
    getLen();
  }
  
  
  public void setFlow(float xi, float yi){
    flowX = xi;
    flowY = yi;
    getAng();
    getLen();
  }
  
  void getAng(){
    float offset = (float)Math.PI/4;
    if(flowY==0&&flowX==0){
      ang = 0+offset;
    }
    else{
    ang = atan2(flowY,flowX)+offset;
    }
  }
  
  void getLen(){
    len = (float)Math.sqrt(flowY*flowY+flowX*flowX);
  }
  
  void attenuate(){
    if(Math.abs(flowX)<0.001)
    flowX = 0;
    else
    flowX*=0.9;
    if(Math.abs(flowY)<0.001)
    flowY = 0;
    else
    flowY*=0.9;
    
     //flowX*=0.9;
    //flowY*=0.9;
    
  }
  
}