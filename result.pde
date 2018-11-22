void result(){
  float score;
  float time = _timeCount - timeCount;
  
  score = (time * time)/ 2 * 32.024;
  
  textFont(UIFont_Bold);
  textSize(150);
  fill(244, 69, 66);
  textAlign(CENTER,TOP);
  text("Result", width/2, 100);
  
  textFont(UIFont_semiBold);
  fill(255);
  textAlign(CENTER,TOP);
  textSize(75);
  text("Score : " + score, width/2, 250);
  text("Time : "+ time/60 + " sec.", width/2, 350);
  
  textFont(UIFont_Bold);
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
