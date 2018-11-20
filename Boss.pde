class Boss{
  
  PVector loc;
  int r;
  
  PVector collidePoint_debug;
  
  private int holdBeams;
  
  Boss(PVector _loc){
    loc = _loc.copy();
    r = 100;
    
    coMane.holder.getEvent(CollisionTypes.Beam2Boss).setEvent(
      new IEventT<PVector>(){
        void action(PVector p){
          collidePoint_debug = p.copy();
          holdBeams++;
        }
      });
      
    collidePoint_debug = new PVector(-1, -1);
    
    holdBeams = 0;
  }
  
  Boss(int x, int y){
    this(new PVector(x, y));
  }
  
  void update(){
    draw();
  }
  
  void draw(){
    fill(255);
    ellipse(loc.x, loc.y, r*2, r*2);
    
    fill(255, 134, 0);
    if(collidePoint_debug.x != -1)
      ellipse(collidePoint_debug.x, collidePoint_debug.y, 10, 10);
    
    fill(0, 134, 255);
    textSize(50);
    text(holdBeams, boss.loc.x, boss.loc.y);
  }
}
