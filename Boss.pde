class Boss{
  
  PVector loc;
  int r;
  float radian;
  
  PVector collidePoint_debug;
  
  private EffectHolder Effects;
  private int holdBeams;
  private Charge currentAimingEffect;
  
  Boss(PVector _loc){
    loc = _loc.copy();
    r = 100;
    radian = 0;
    Effects = new EffectHolder();
    
    CoMane.holder.getEvent(CollisionTypes.Beam2Boss).setEvent(
      new IEventT<PVector>(){
        void action(PVector p){
          holdBeams++;          //吸収中にholdBeamsの数を増やす
          
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
    rotateDraw();
  }
  
  void rotateDraw(){
    calculateRadian();
    
    pushMatrix();
    translate(loc.x, loc.y);
    rotate(radian);
    
    draw();
    
    popMatrix();
  }
  
  void calculateRadian(){
    
    /*
    //チャージを終えたエフェクトはボスと一緒には回らないようにする
    for(int i = 0; i < Effects.pss.size(); i++){
      Charge ch = (Charge)Effects.pss.get(i);
      if(ch.finish){
        Effects.pss.remove(i);
        i--;
        EfHolder.add(ch);
      }
    }*/
    
    //エイム中のチャージエフェクトをセット
    if(currentAimingEffect == null)
      if(Effects.pss.size() != 0)
        currentAimingEffect = (Charge)Effects.pss.get(0);
      
    
    if(currentAimingEffect != null){
      PVector toPlayer = PVector.sub(player.loc, loc);
      float addRad = toPlayer.heading() - (currentAimingEffect.loc_h.heading() + radian);    //プレイヤーに向かうベクトルとチャージエフェクトの  角度の差（マイナス込み）
      
      //近い動き方をするようにした（ex -270度の差がある時は+90度回転する）
      if(abs(addRad) > PI){
        float pi2 = 2*PI;
        if(addRad > 0)  pi2 *= -1;
        addRad += pi2;
      }
      
      addRad *= 0.2f;    //角の差に比例する回転速度
      
      radian += addRad;
      
      if(currentAimingEffect.finish)  currentAimingEffect = null;
    }
  }
  
  void draw(){
    
    noStroke();
    fill(255);
    ellipse(0, 0, r*2, r*2);
    
    fill(Const.BossTextCol);
    textSize(75);
    textAlign(CENTER, CENTER);
    text(holdBeams, 0, 0);
    
    //DEffects.update();
    
    /*
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
    */
    
  }
  
  void finishAbsorb(){
    
    IEvent e = new IEvent(){
      public void action(){
        holdBeams--;
        
        //float t = Const.TimeLimit - timeCount / 60;
        //float m = pow(2, 0.08*t + 2);              //dv/dtは増加傾向      計算式:   v = a^(bt + c)
        float m = 1 - timeCount / (Const.TimeLimit * 60);
        m *= m;
        
        //mag = a * m + b とすると、最大値: a+b  最小値: b
        float mag = (Const.BossBeamMaxVelocity - Const.BossBeamMinVelocity) * m + Const.BossBeamMinVelocity;
        PVector v = PVector.sub(player.loc, loc).setMag(mag);
        
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
    Charge ch = new Charge(/*PVector.sub(chargePoint, loc)*/new PVector(0, r), Const.BossBeamCol);    //第一引数はボスの中心を始点とするベクトル
    
    //EfHolder.add(ch);
    Effects.add(ch);
  }
}
