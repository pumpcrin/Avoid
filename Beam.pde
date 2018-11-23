class Beam{
  
  float x,y,vx,vy,len;
  float l;
  PVector start ;
  PVector end ;
  PVector v ;
  
  boolean isStandard;
  boolean isAbsorbed;   //trueの間吸収されている変数　
                        //if文のみ作ればよい
                        
  color col;
  
  //ビームの描写
  Beam(PVector start, PVector v, float len, color col){
    this.start = start.copy();
    //end = new PVector(start.x-v.x*len, start.y-v.y*len);
    //end = new PVector(x-vx*len, y-vy*len);    //これだと速度によっては長さがlenじゃなくなってしまうかも...
    end = PVector.sub(start, v.copy().setMag(len));
    this.v = v.copy();
    this.col = col;
    
    isStandard = true;
    isAbsorbed = false;
  }
  
  Beam(float x,float y,float vx,float vy,float len){
    this(new PVector(x, y), new PVector(vx, vy), len, color(0, 255, 0));
  }

  //ビームを生成
  void lines(){
    noStroke();
    stroke(col);
    strokeWeight(10);
    line(start.x,start.y,end.x,end.y);
  }
  
  //ビームの動き
  void move(){
    
    start.add(v);
    end.add(v);
    
  }
}
      
