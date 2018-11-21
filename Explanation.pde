void Explanation(){
  textFont(UIFont_Bold);
  textAlign(CENTER,TOP);
  fill(244, 69, 66);
  textSize(99);
  text("Explanation",width/2,3);
  
  
  textFont(Japanese);
  fill(255);
  textSize(50);
  text("次々と飛んで来るビームを避けよう！",width/2,110);
  
  textAlign(RIGHT,BOTTOM);
  brink(0);
  textFont(UIFont_semiBold);
  textSize(75);
  text("Press Space key to Start.", width, height);
}
