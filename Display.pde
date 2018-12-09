class Display{
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
    textSize(width/25);
    text(timeCount/60,0,0);
    
    if((gameMode == 2)){
      textAlign(RIGHT,BOTTOM);
      pressanyKey("Space",width,height);
    }
  }
  
  void pressanyKey(String Key, int x, int y){
      this.brink(0);
      textFont(Const.UIFont_semiBold);
      textSize(75);
      text("Press "+Key+" key.", x, y);
  }
  
  void brink(color c){
      if (frameCount / 30 % 2 == 0) { // frameCount % 2 == 0 だと速すぎ
        fill(c);
      }else{
        fill(255);
      }
  }
  
  void Explain(){
    textFont(Const.UIFont_Bold);
    textAlign(CENTER,TOP);
    fill(244, 69, 66);
    textSize(width/14);
    text("Explain",width/2,3);
    
    
    textFont(Const.Japanese);
    fill(255);
    textSize(80);
    text("つぎつぎととんでくるビームをよけよう",width/2,175);
    
    textSize(50);
    text("ビームはがめんがいからとんでくるぞ",width/4,height/5*1.5);
    text("ボスはまわりのビームをきゅうしゅうして",width/4*3,height/5*1.5-22);
    text("きょうりょくなこうげきをしてくるぞ",width/4*3,height/5*1.5+22);
    
    noFill();
    stroke(255,1000);
    strokeWeight(1);
    rectMode(CENTER);
    rect(width/4,height/5*3,800,400);
    rect(width/4*3,height/5*3,800,400);
    
    
    /////////////////////ここから四角の中でビームとか飛ばす/////////////////////////
    
    
    
    
    
    
    
    //////////////////////////////ここまで//////////////////////////////////////
    
    
    textAlign(RIGHT,BOTTOM);
    brink(0);
    textFont(Const.UIFont_semiBold);
    textSize(width/25);
    text("Press Space key to Start.", width, height);
  }
  
  void result(){
    double score;
    double time = _timeCount - timeCount;
    
    score = Const.round3(((time * time)/ 2 * 3203.485789908)/5032);
    
    textFont(Const.UIFont_Bold);
    textSize(width/14);
    fill(244, 69, 66);
    textAlign(CENTER,TOP);
    text("Result", width/2, 85);
    
    textFont(Const.UIFont_semiBold);
    fill(255);
    textAlign(CENTER,TOP);
    textSize(width/20);
    text("Score : " + score, width/2, 250);
    text("Time : "+ Const.round3(time/60) + " sec.", width/2, 350);
    
    textFont(Const.UIFont_Bold);
    if(!(gameOver)) {
      textSize(width/20);
      text("Congratulation!!!", width/2, 550);
    }else{
      textSize(width/20);
      text("Never Give Up...", width/2, 550);
    }
    
    textAlign(RIGHT,BOTTOM);
    pressanyKey("Space",width,height);
  }
  
  private int count=0;

  void Fadeout(float x1, float y1, float x2, float y2){
    if(nowFadeout){
      rectMode(LEFT);
      noStroke();
      fill(0,50);
      
      rect(x1,y1,x2,y2);
    }
    
    if(this.count>255){
      nowFadeout = false;
      this.count = 0;
      sceneChange();
    }else{
      this.count=this.count+50;
    }
  }
}
