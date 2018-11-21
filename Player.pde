class Player{
  float R;
  //float X,Y;
  PVector loc;
  
  Player(){
    coMane.holder.getEvent(CollisionTypes.Beam2Player).setEvent(
      new IEventT<PVector>(){
        void action(PVector p){
          println("gameOver!!");
          gameOver = true;
        }
      });
  }
  
  void mine(float _R) {
    ellipseMode(CENTER);
    noStroke();
    
    R = _R;
    
    loc = new PVector(mouseX, mouseY);
  
    //自機描画
    fill(111, 186, 0);
    ellipse(loc.x, loc.y, _R, _R);
  }
}
