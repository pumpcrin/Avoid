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
    
    /*for(int i = 0; i < beMane.beams.size(); i++){
      Beam beam = beMane.beams.get(i);
      
      // Bossとビームのあたり判定
      PVector sub = PVector.sub(beam.start, boss.loc);
      if(sub.mag() <= boss.r){
        PVector collidePoint = getCollidePoint(beam.start, beam.end, boss.loc, boss.r);
        //holder.getEvent(CollisionTypes.Beam2Boss).setValue(collidePoint);
        
        beam.isAbsorbed = true;
      }
    }*/
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
