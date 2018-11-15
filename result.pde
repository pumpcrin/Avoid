void result(){
  float score;
  float time = _timeCount - timeCount;
  
  score = time * 320.24;
  
  textAlign(CENTER,CENTER);
  text("Score : " + score, width/2, 220);
  text("Time : "+ time/60 + " sec.", width/2 ,300);
  
  textAlign(RIGHT,BOTTOM);
  pressanyKey("Space",width,height);
}
