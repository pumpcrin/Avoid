void result(){
  double score;
  double time = _timeCount - timeCount;
  
  score = Const.round3(((time * time)/ 2 * 3203.485789908)/5032);
  
  textFont(Const.UIFont_Bold);
  textSize(150);
  fill(244, 69, 66);
  textAlign(CENTER,TOP);
  text("Result", width/2, 100);
  
  textFont(Const.UIFont_semiBold);
  fill(255);
  textAlign(CENTER,TOP);
  textSize(75);
  text("Score : " + score, width/2, 250);
  text("Time : "+ Const.round3(time/60) + " sec.", width/2, 350);
  
  textFont(Const.UIFont_Bold);
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
