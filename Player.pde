class Player{
  float R;
  float X,Y;
  
  void mine(float _R) {
    ellipseMode(CENTER);
    noStroke();
    
    R = _R;
    X = mouseX;
    Y = mouseY;
  
    //自機描画
    fill(111, 186, 0);
    ellipse(X, Y, _R, _R);
  }
}
