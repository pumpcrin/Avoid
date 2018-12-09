class Boss{
  
  PVector loc;
  int r;
  
  PVector collidePoint_debug;
  
  private int holdBeams;
  
  Boss(PVector _loc){
    loc = _loc.copy();
    r = 100;
    
    CoMane.holder.getEvent(CollisionTypes.Beam2Boss).setEvent(
      new IEventT<PVector>(){
        void action(PVector p){
          
          WaveEffect wave = new WaveEffect(p, r/2);
          EfHolder.add(wave);
          
          IEvent e = new IEvent(){
            public void action(){
              finishAbsorb();
            }
          };
          
          // このエフェクトが消える処理を実装するのにCollisionをいじらないといけないので、今は時間で消える
          TiHolder.setTimer(1f, e);
          //
        }
      });
      
    collidePoint_debug = new PVector(-1, -1);
    
    holdBeams = 0;
  }
  
  Boss(){
    this(new PVector(width/2, height/2));
  }
  
  void update(){
    draw();
  }
  
  void draw(){
    noStroke();
    fill(255);
    ellipse(loc.x, loc.y, r*2, r*2);
    
    fill(255, 134, 0);
    
    //if(collidePoint_debug.x != -1)
      //ellipse(collidePoint_debug.x, collidePoint_debug.y, 10, 10);
    
    fill(0, 134, 255);
    textSize(75);
    textAlign(CENTER, CENTER);
    text(holdBeams, boss.loc.x, boss.loc.y);
  }
  
  void finishAbsorb(){
    holdBeams++;
    
    IEvent e = new IEvent(){
      public void action(){
        holdBeams--;
        
        PVector v = PVector.sub(player.loc, loc).setMag(10);
        PVector start = PVector.add(loc, v.copy().setMag(r));
        
        Beam beam = new Beam(start, v, Const.BossBeamLength, Const.BossBeamCol);
        beam.isStandard = false;
        BeMane.beams.add(beam);
      }
    };
    
    float s = Charge_Particle.lifeSpan_s;
    TiHolder.setTimer(s, e);
    
    PVector chargePoint = PVector.sub(player.loc, boss.loc).setMag(r);
    chargePoint.add(loc);
    Charge ch = new Charge(chargePoint, loc, Const.BossBeamCol);
    
    EfHolder.add(ch);
  }
}
