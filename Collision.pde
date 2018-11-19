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
    
    for(int i = 0; i < beMane.beams.size(); i++){
      Beam beam = beMane.beams.get(i);
      
      // Bossとビームのあたり判定
      PVector sub = PVector.sub(beam.start, boss.loc);
      if(sub.mag() <= boss.r){
        //PVector collidePoint = PVector.sub(;
        //holder.getEvent(CollisionTypes.Beam2Boss).setValue(collidePoint);
        
        beam.isAbsorbed = true;
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

PVector getCollisionPoint(PVector start, PVector v, PVector circleCenter, int r){
  
  return start;
}



/*
//直線と円の当たり判定
boolean LineHitCircle(double x1,double y1,double x2,double y2,double p,double q,int r){
  boolean lflag;
  
  if(x1 != x2){
    double a = y2-y1;
    double b = x1-x2;
    double c = x2*y1-x1*y2;
    double d = (fabs(a*p+b*q+c)/(sqrt(a*a+b*b)));
    if(r<=d)  lflag = true;
    else      lflag = false;
  }
  
  return lflag;
}

*/
