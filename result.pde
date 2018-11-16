void result(){
  float score;
  float time = _timeCount - timeCount;
  
  score = time * 320.24;
  
  textSize(100);
  fill(255);
  textAlign(CENTER,TOP);
  text("Result", width/2, 100);
  
  fill(255);
  textAlign(CENTER,TOP);
  textSize(75);
  text("Score : " + score, width/2, 250);
  text("Time : "+ time/60 + " sec.", width/2, 350);
  
  if(!(gameOver)) {
    textSize(110);
    text("Congratulation!!!", width/2, 550);
  }else{
    textSize(110);
    text("Never Give Up...", width/2, 550);
  }
    
  textAlign(RIGHT,BOTTOM);
  pressanyKey("Space",width,height);
}
