void timeCounter(){
  if(!(timeCount == 0) && gameClear){
    timeCount--;
    fill(255);
  }else{
    fill(255,0,0); //RED
  }
  textAlign(LEFT,TOP);
  text(timeCount/60,0,0);
  
  if(timeCount == 0){
    //点滅させる
    if (frameCount / 30 % 2 == 0) { // frameCount % 2 == 0 だと速すぎ
      fill(0);
    }else{
      fill(255);
    }
    textAlign(RIGHT,BOTTOM);
    text("Press Spece key.",width,height);
  }
}
