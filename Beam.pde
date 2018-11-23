class Beam{
  
  float x,y,vx,vy,len;
  float l;
  PVector start ;
  PVector end ;
  PVector v ;
  
  boolean isStandard;
  boolean isAbsorbing;//trueの間吸収されている変数　
                        //if文のみ作ればよい
    
  //ビームの描写
  Beam(float x,float y,float vx,float vy,float len){
    start = new PVector(x,y);
    end = new PVector(x-vx*len,y-vy*len);
    v = new PVector(vx,vy);
    isStandard = true;
  
    
  }

  //ビームを生成
  void lines(){
    noStroke();
    stroke(0,255,0);
    strokeWeight(10);
    line(start.x,start.y,end.x,end.y);
  }
  //ビームの動き
  void move(){
    
    start.add(v);
    end.add(v);
    
  }
}
      