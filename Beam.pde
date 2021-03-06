class Beam{
  
  float x,y,vx,vy,len;
  float l;
  PVector start ;
  PVector end ;
  PVector v ;
  
  boolean isStandard;
  boolean isAbsorbed;   //trueの間吸収されている変数　
  boolean isDispose;     //終点が視点を越えたらtrueになる
  
                        
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
    this(new PVector(x, y), new PVector(vx, vy), len, Const.StandardBeamCol);
  }

  //ビームを生成
  void lines(){
    stroke(col);
    
    strokeWeight(10);
    line(start.x,start.y,end.x,end.y);
  }
  
  //ビームの動き
  void move(){
    if(isAbsorbed == false)
    {
      start.add(v);
      end.add(v);
    }
    else 
   {
     end.add(v);
   }
   
   if((start.x - end.x < 0)&&(v.x > 0)||(start.x - end.x > 0)&&(v.x < 0) )
   {
     isDispose = true;
   }
 }
}
      