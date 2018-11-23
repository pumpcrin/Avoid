final int particleAmount = 100;  //表示されるパーティクルの量（目安）
final float lifeSpan_s = 2;
final int particleSize = 20;
final float decayRate = 0.1;  //距離1あたりの光の減衰率

void FireSetup(PVector _loc){
  Fire = new FireParticleSystem(_loc, color(255, 34, 0, 205));
}

void Fire(){
  rectMode(CENTER);
  noStroke();
  background(0,100);
  blendMode(ADD);
  
  if(Fire != null)  Fire.update();
  
  blendMode(BLEND);
}



class FireParticle{
  PVector loc;
  PVector v;
  float r;
  float lifeCounter;
 
  
  int[] baseCol;
  
  FireParticle(PVector _loc, PVector _v, color _baseCol){
    loc = _loc.copy();
    v = _v.copy();
    r = 20;
    lifeCounter = int(lifeSpan_s * frameRate);
    
    baseCol = Color2int(_baseCol);
    /*
    print("r: "+baseCol[0]);
    print("\tg: "+ baseCol[1]);
    print("\tb: "+baseCol[2]+"\n");
    */
  }
  
  
  FireParticle(PVector _loc, PVector _v){
    this(_loc, _v, 0);
  }
  
  void update(){
    loc.add(v);
    
    r = particleSize * lifeCounter / (lifeSpan_s * 60);
    
    
    lifeCounter--;
  }
  
  void draw(){
    int[] col = new int[3];
    col[0] = int(baseCol[0] * lifeCounter / (lifeSpan_s * 60));
    col[1] = int(baseCol[1] * lifeCounter / (lifeSpan_s * 60));
    col[2] = int(baseCol[2] * lifeCounter / (lifeSpan_s * 60));
    
    fill(col[0], col[1], col[2]);
    ellipse(loc.x, loc.y, r, r+1.5);
  }
}

int[] Color2int(color col){
  int red = (col >> 16) & 0xFF;
  int blue = (col >> 8) & 0xFF;
  int green = col & 0xFF;
  
  return new int[]{red, blue, green};
}

color changeColor(color col){
  int[] changedCol = Color2int(col);
  return color(changedCol[0], changedCol[1], changedCol[2]);
}



class FireParticleSystem{
  
  PVector loc;
  
  float count;
  float lifetime = 2;
  
  private ArrayList<FireParticle> parts;
  private color col;
  
  private color col_i = 0;
  
  FireParticleSystem(PVector _location, color _col){
    loc = _location.copy();
    col = _col;
    
    parts = new ArrayList<FireParticle>();
    for(int i = 0; i < particleAmount/2; i++){
      createParticle();
    }
  }
  
  FireParticleSystem(PVector _location, int r, int g, int b, int a){
    this(_location, color(r, g, b, a));
  }
  
  void update(){
    controlAmount();
    draw(col_i);
    //col_i++;
  }
  
  private void controlAmount(){
    for(int i = 0; i < parts.size(); i++){
      if(parts.get(i).lifeCounter < 0){
        parts.remove(i);
        i--;
      }
    }
    
    if(parts.size() < particleAmount)  createParticle();
    if(count / frameRate < lifetime){
      count++;
    }else{
      Fire = null;
    }
  }
  
  private void createParticle(){
    for(int i = 0; i < 5; i++){
    PVector vel1 = new PVector(random(-i,i), random(-i,i));
    vel1.mult(3);
    parts.add(new FireParticle(loc.copy(), vel1, col));
    }
  }
  
  private void draw(int col_j){
    for(int i = 0; i < parts.size(); i++){
      parts.get(i).update();
      parts.get(i).draw();
    }
  }
}
