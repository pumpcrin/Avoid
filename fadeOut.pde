int count=0;

boolean fadeOut(float x1, float y1, float x2, float y2){
  PImage offscr;
  
  offscr = createImage(width,height,RGB);
  if(nowFadeout){
    rectMode(LEFT);
    noStroke();
    fill(0,30);
    
    rect(x1,y1,x2,y2);
  }
  
  if(count>255){
    nowFadeout = false;
    count = 0;
  }else{
    count=count+10;
  }
  return true;
}
