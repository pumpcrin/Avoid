enum CollisionTypes{ Beam2Boss, Beam2Player };

class CollisionManager{
  
  CoEventHolder holder;
  
  CollisionManager(){
    holder = new CoEventHolder();
  }
  
  void update(){
    check();
  }
  
  private void check(){
    
    for(int i = 0; i < BeMane.beams.size(); i++){
      Beam beam = BeMane.beams.get(i);
      if(!beam.isStandard)  continue;    //Bossの玉ならBossとの判定はしない
      
      // Bossとビームのあたり判定
      PVector start_after = PVector.add(beam.start, beam.v);
      PVector end_after = PVector.add(beam.end, beam.v);
      
      if(!beam.isAbsorbed && LineHitCircle(start_after, end_after, boss.loc, boss.r)){
        PVector collidePoint = getCollidePoint(beam.start, beam.v, boss.loc, boss.r);
        holder.getEvent(CollisionTypes.Beam2Boss).setValue(collidePoint);
        
        beam.isAbsorbed = true;
      }
      
      //Playerとビームのあたり判定
      if(!gameOver && LineHitCircle(beam.start, beam.end, player.loc, (int)player.R)){
        holder.getEvent(CollisionTypes.Beam2Player).setValue(player.loc);
      }
    }
  }
  
}

class CoEventHolder{
  HashMap<CollisionTypes, Reactive<PVector>> events;
  
  CoEventHolder(){
    events = new HashMap<CollisionTypes, Reactive<PVector>>();
    
    for(CollisionTypes type : CollisionTypes.values())
      events.put(type, new Reactive<PVector>());
  }
  
  Reactive<PVector> getEvent(CollisionTypes type){
    return events.get(type);
  }
}

//円と線分のあたり判定
boolean LineHitCircle(PVector start, PVector end, PVector circleCenter, int r){
  //線分の両端の内側にいるなら、どちらかの内積は負
  PVector start2circle = PVector.sub(circleCenter, start);
  PVector end2circle   = PVector.sub(circleCenter, end);
  float dot1 = start2circle.dot(circleCenter);
  float dot2 = end2circle.dot(circleCenter);
  
  float dist;
  if(dot1*dot2 < 0){
    PVector lineLen = PVector.sub(end, start);
    float cross = start2circle.cross(lineLen).mag();
    dist = cross / lineLen.mag();
  }
  else{
    dist = min(start2circle.mag(), end2circle.mag());
  }
  
  return (r >= dist);
}


//等速で移動する線分と固定された円の衝突する点を算出（連立方程式使用）
PVector getCollidePoint(PVector start, PVector v, PVector circleCenter, int r){
  
  //解の公式使用
  double a = v.magSq();
  double b = v.x*(start.x - circleCenter.x) + v.y*(start.y - circleCenter.y);
  double c = start.x*start.x + start.y*start.y + circleCenter.x*circleCenter.x + circleCenter.y*circleCenter.y - 2*(start.x*circleCenter.x + start.y*circleCenter.y) - r*r;
  
  double d = sqrt((float)(b*b - a*c));
  double t = (-b - d) / a;
  
  PVector collidePoint = PVector.add(start, PVector.mult(v, (float)t));
  
  return collidePoint;
}
