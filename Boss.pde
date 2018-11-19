class Boss{
  
  PVector loc;
  int r;
  
  private int holdBeams;
  private boolean isAbsorbing;
  
  Boss(PVector _loc){
    loc = _loc.copy();
    r = 100;
    
    coMane.holder.getEvent(CollisionTypes.Beam2Boss).setEvent(
      new IEventT<PVector>(){
        void action(PVector p){println("Collision by: "+p);}
      });
  }
  
  Boss(int x, int y){
    this(new PVector(x, y));
  }
  
  void update(){
    checkCollision();
    draw();
  }
  
  void draw(){
    fill(255);
    ellipse(loc.x, loc.y, r*2, r*2);
  }
  
  void checkCollision(){
    
  }
  
  void release(){
    
  }
}
