class Player{
  float R;
  //float X,Y;
  PVector loc;
  
  Player(){
    CoMane.holder.getEvent(CollisionTypes.Beam2Player).setEvent(
      new IEventT<PVector>(){
        void action(PVector p){
          gameOver = true;
          FireSetup(loc);
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
    ellipse(loc.x, loc.y, _R*2, _R*2);
  }
}
