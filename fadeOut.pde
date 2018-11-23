int count=0;

boolean fadeOut(float x1, float y1, float x2, float y2){

  if(nowFadeout){
    rectMode(LEFT);
    noStroke();
    fill(0,50);
    
    rect(x1,y1,x2,y2);
  }
  
  if(count>255){
    nowFadeout = false;
    count = 0;
    sceneChange();
  }else{
    count=count+50;
  }
  return true;
}
