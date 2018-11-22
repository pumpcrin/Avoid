void Explanation(){
  textFont(UIFont_Bold);
  textAlign(CENTER,TOP);
  fill(244, 69, 66);
  textSize(150);
  text("Explanation",width/2,3);
  
  
  textFont(Japanese);
  fill(255);
  textSize(80);
  text("つぎつぎととんでくるビームをよけよう",width/2,175);
  
  textSize(50);
  text("ビームはがめんがいからとんでくるぞ",width/4,height/5*1.5);
  text("ボスはきょうりょくなこうげきをしてくるぞ",width/4*3,height/5*1.5);
  
  noFill();
  stroke(255,1000);
  rectMode(CENTER);
  rect(width/4,height/5*3,800,400);
  rect(width/4*3,height/5*3,800,400);
  
  
  /////////////////////ここから四角の中でビームとか飛ばす/////////////////////////
  
  
  
  
  
  
  
  //////////////////////////////ここまで//////////////////////////////////////
  
  
  textAlign(RIGHT,BOTTOM);
  brink(0);
  textFont(UIFont_semiBold);
  textSize(75);
  text("Press Space key to Start.", width, height);
}
