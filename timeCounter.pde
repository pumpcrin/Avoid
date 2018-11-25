void timeCounter(){
  fill(255);
  if(!(timeCount == 0) && (gameMode == 1)){
    timeCount--;
    fill(255);
  }else{
    fill(255,0,0); //RED
  }
  textFont(Const.UIFont_Bold);
  textAlign(LEFT,TOP);
  textSize(75);
  text(timeCount/60,0,0);
  
  if((gameMode == 2)){
    textAlign(RIGHT,BOTTOM);
    pressanyKey("Space",width,height);
  }
}
