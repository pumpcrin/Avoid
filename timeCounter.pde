void timeCounter(){
  if(!(timeCount == 0) && gameMode == 1){
    timeCount--;
    fill(255);
  }else{
    fill(255,0,0); //RED
  }
  textAlign(LEFT,TOP);
  textSize(75);
  fill(255);
  text(timeCount/60,0,0);
  
  if(timeCount == 0){
    textAlign(RIGHT,BOTTOM);
    pressanyKey("Space",width,height);
  }
}
