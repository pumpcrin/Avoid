  float h_x1 = 50;
  float h_y1 = 50;
  float ell_x1 = 500;
  float ell_y1 = 500;

Charge ps;

/*
void setup(){

  size(1000, 1000);
  rectMode(CENTER);
  noStroke();
  ps = new Charge(new PVector(h_x1 +500,h_y1 +500), new PVector(ell_x1,ell_y1), color(255, 34, 0, 205));
  

}

void draw (){
  noStroke();
  charge();
  stroke(255);
  fill(0);
  ellipse(500,500,100,100);

}*/

void charge(){
  noStroke();
  background(0,100);
  blendMode(ADD);
  if(ps != null)
    ps.update();
}

class Charge_Particle{
  final float lifeSpan_s = 2;
  final float fireSpan_s = 3; //fire effect time
  
  int particleSize;

  PVector loc_now;
  PVector loc_end;
  PVector v;
  
  float r;
  float lifeCounter;
  float sec = 0;
  
  boolean finish = false;
  
  int[] baseCol;
  
  
  Charge_Particle(PVector _loc_start, PVector _loc_end, color _baseCol, int _particleSize, boolean _finish){
    loc_now = _loc_start.copy();
    loc_end = _loc_end.copy();
    particleSize = _particleSize;
    finish = _finish;
    
    lifeCounter = int(lifeSpan_s * frameRate);
    
    baseCol = Color2int(_baseCol);
  }
  
  
  Charge_Particle(PVector _loc_start, PVector _loc_end, int _particleSize, boolean _finish){
    this(_loc_start,_loc_end, 0, _particleSize, _finish);
  }
  
  void update(){
    
    vector();
    loc_now.add(v);
    r = particleSize * (lifeSpan_s * frameRate) / lifeCounter;
    
    if(!finish)
    lifeCounter--;
    
  }
  
  void vector(){
    float m;
    float gravity = 1000;
    
    v = PVector.sub(loc_end, loc_now);
    
    if(!finish){
      m = v.mag() * v.mag() / gravity;
      v.setMag(m);
    }else if(sec < frameRate * 3){
      sec++;
      m = v.mag() / 400;
      v.setMag(m);
    }else ps = null;
  }
  
  void draw(){
    int[] col = new int[3];
    for(int i = 0; i < 3; i++){
      col[i] = int(baseCol[i] * lifeCounter / (lifeSpan_s * frameRate));
    }
    

    fill(col[0], col[1], col[2]);
    ellipse(loc_now.x, loc_now.y, r, r);
  }
}

int[] Color2int(color col){
  int red = (col >> 16) & 0xFF;
  int blue = (col >> 8) & 0xFF;
  int green = col & 0xFF;
  
  return new int[]{red, blue, green};
}

class Charge{
  final int particleAmount = 100;
  
  PVector loc_h;
  PVector loc_ell;
  PVector loc_end = loc_ell;
  
  float count;
  float lifetime = 2;
  float r;
  
  boolean finish = false;

  private ArrayList<Charge_Particle> parts;
  private color col;

  Charge(PVector _loc_h, PVector _loc_ell, color _col) {
    loc_h = _loc_h;
    loc_ell = _loc_ell;
    col = _col;

    parts = new ArrayList<Charge_Particle>();
  }

  Charge(PVector loc_h, PVector loc_ell, int r, int g, int b, int a) {
    this(loc_h, loc_ell, color(r, g, b, a));
  }

  void update() {
    controlAmount();
    draw();
  }

  private void controlAmount() {
    for (int i = 0; i < parts.size(); i++) {
      if (parts.get(i).lifeCounter < 0) {
        parts.remove(i);
        i--;
      }
    }
    
    if (count / frameRate < lifetime) {
      count++;
    } else finish = true;

    if (parts.size() < particleAmount){
      if(!finish){
        createParticle(2,80);
        createParticle(5,50);
        createParticle(10,20);
      }else{
        createFire(5,100);
      }
    }
  }

  private void createParticle(int particleSize,int Range) {

    r = dist(loc_h.x, loc_h.y, loc_ell.x, loc_ell.y);
    float impactrange = r + Range;
    
    PVector loc_start;

    if (loc_ell.y < loc_h.y) {
      loc_start = new PVector(random(loc_ell.x - impactrange, loc_ell.x + impactrange), random(loc_ell.y - impactrange, loc_h.y ));
    } else {
      loc_start = new PVector(random(loc_ell.x - impactrange, loc_ell.x + impactrange), random(loc_h.y, loc_ell.y + impactrange));
    }
    noFill();
    
    if(!finish)
    parts.add(new Charge_Particle(loc_start, loc_h, col, particleSize,finish));
  }
  
  private void createFire(int particleSize,float Range){
    float impactrange = r + (r * Range);
    float firerange = r * 20;
    
    noFill();
    
    if(loc_ell.y < loc_h.y && loc_ell.x < loc_h.x)
      loc_end = new PVector(random(loc_h.x, impactrange), random(loc_h.y,impactrange));
    else if(loc_ell.y < loc_h.y && loc_ell.x > loc_h.x)
      loc_end = new PVector(random(-impactrange, loc_h.x), random(loc_h.y,impactrange));
    else if(loc_ell.y > loc_h.y && loc_ell.x < loc_h.x)
      loc_end = new PVector(random(loc_h.x, impactrange), random(-impactrange, loc_h.y));
    else if(loc_ell.y > loc_h.y && loc_ell.x > loc_h.x)
      loc_end = new PVector(random(-impactrange, loc_h.x), random(-impactrange, loc_h.y));
    else if(loc_ell.y == loc_h.y && loc_ell.x < loc_h.x)
      loc_end = new PVector(random(loc_h.x, impactrange), random(loc_h.y - firerange, loc_h.y + firerange));
    else if(loc_ell.y == loc_h.y && loc_ell.x > loc_h.x)
      loc_end = new PVector(random(-impactrange, loc_h.x), random(loc_h.y - firerange, loc_h.y + firerange));
    else if(loc_ell.y < loc_h.y && loc_ell.x == loc_h.x)
      loc_end = new PVector(random(loc_h.x - firerange, loc_h.x + firerange), random(loc_h.y, impactrange));
    else if(loc_ell.y > loc_h.y && loc_ell.x == loc_h.x)
      loc_end = new PVector(random(loc_h.x -firerange, loc_h.x + firerange), random(-impactrange, loc_h.y));
      
    parts.add(new Charge_Particle(loc_h, loc_end, col, particleSize,finish));
    
  }

  private void draw() {
    for (int i = 0; i < parts.size(); i++) {
        parts.get(i).update();
        parts.get(i).draw();
    }
  }
}