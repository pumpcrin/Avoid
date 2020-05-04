class Player{
  float R;
  //float X,Y;
  PVector loc;
  
  Player(){
    CoMane.holder.getEvent(CollisionTypes.Beam2Player).setEvent(
      new IEventT<PVector>(){
        void action(PVector p){
          gameOver = true;
          //FireSetup(loc);
          EfHolder.add(new FireParticleSystem(loc, Const.FireCol));
        }
      });
      
    loc = new PVector(width*3/4, height*3/4);
  }
  
  void mine(float _R) {
   
    
    ellipseMode(CENTER);
    noStroke();
    
    R = _R;
    
    if(!isInBossCircle())
      loc = new PVector(mouseX, mouseY);
  
    //自機描画
    //fill(111, 186, 0);
    fill(255, 255, 0);
    ellipse(loc.x, loc.y, _R*2, _R*2);
  }
  
  boolean isInBossCircle(){
    return (dist(mouseX, mouseY, boss.loc.x, boss.loc.y) < boss.r);
  }
}
