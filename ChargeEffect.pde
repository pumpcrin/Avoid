//Charge ps;

class Charge_Particle{
  static final float lifeSpan_s = 2;
  
  int particleSize;

  PVector loc_now;
  PVector loc_end;
  PVector v;
  
  float r;
  float lifeCounter;
  //float sec = 0;
  
  boolean finish = false;
  
  int[] baseCol;
  
  
  Charge_Particle(PVector _loc_start, PVector _loc_end, color _baseCol, int _particleSize, boolean _finish){
    loc_now = _loc_start.copy();
    loc_end = _loc_end.copy();
    loc_end.x = loc_end.x + 17;
    loc_end.y = loc_end.y + 17;
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
    r = particleSize;// * (lifeSpan_s * frameRate) / lifeCounter;
    
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
    }else{
      //sec++;
      m = v.mag() / 200;
      v.setMag(m);
    }
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

class Charge extends ParticleSystem{
  static final int particleAmount = 50;
  static final float fireSpan_s = 3; //fire effect time
  
  PVector loc_h;        //発射点
  PVector loc_ell;      //ボスの座標
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
  
  //ボスが回転するようになってから使うようにしたコンストラクタ（回転の中心がボスの座標なので、ボスの座標を0としている）
  Charge(PVector loc_h, color _col){
    this(loc_h, new PVector(0, 0), _col);
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
    
    //count++などの処理（時間を数える処理）はCharge_Particleクラスにおける元sec++。
    //また、isDisposeをtrueにすると、自動的にエフェクトが消えます
    if (!finish){
      if(count++ / frameRate > lifetime){
        finish = true;
        count = 0;
      }
    } else {
      if(count++ > frameRate * fireSpan_s)
        isDispose = true;
    }

    if (parts.size() < particleAmount){
      if(!finish){
        createParticle(10,100);
        createParticle(15,80);
        createParticle(30,20);
      }else{
        createFire(5,10);
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
  
  //引数のRangeは前後の範囲
  private void createFire(int particleSize,float Range){
    float impactrange = r + (r * Range);
    float firerange = r * 20;              //横の範囲
    
    noFill();
     
    loc_end = new PVector(random(-width/5,width/5),random(player.loc.y + height));
    
     
    parts.add(new Charge_Particle(loc_h, loc_end, col, particleSize,finish));
    
  }

  private void draw() {
    
    noStroke();
    
    blendMode(ADD);
    
    for (int i = 0; i < parts.size(); i++) {
      parts.get(i).update();
      parts.get(i).draw();
    }
    
    blendMode(BLEND);
  }
}
