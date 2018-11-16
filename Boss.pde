class Boss{
  
  PVector loc;
  int r;
  
  int holdBeams;
  
  Boss(PVector _loc){
    loc = _loc.copy();
    r = 100;
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
  
  void absorb(){
    
  }
  
  void checkCollision(){
    
  }
  
  void release(){
    
  }
}
