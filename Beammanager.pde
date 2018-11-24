class BeamManager{
  ArrayList<Beam> beams = new ArrayList<Beam>();
  int location ; //ビームをどの位置から出すか
  int delay1,delay2,go; //どれくらいの頻度でビームを出すか
  
  void update(){
    add();
    //println(beams.size(),location);
  }
  
  void add(){  
    //どの位置からビームがでるか
    BeMane.location = int(random(0,4));
    switch(location){
     
      case 0 : beams.add(new Beam(random(width),0,random(-4,4),random(3,5),50)); //up
      break;
      
      case 1 : beams.add(new Beam(random(width),height,random(-4,4),random(-3,-5),50));//down
      break;
      
      case 2 :  beams.add(new Beam(0,random(height),random(3,5),random(-4,4),50)); //left
      break;
      
      case 3 :   beams.add(new Beam(width,random(height),random(-3,-5),random(-4,4),50)); //right
      break;
      
      default : println("error");
      break; 
    }  
    
    //ビームの表示と移動と削除
    for(int i = 0; i < beams.size();i++){
      Beam beam = beams.get(i);
      beam.lines();
      beam.move();
      
      if((beam.start.x > width+50 && beam.end.x > width+50 ) ||
          (beam.start.y > height+50 && beam.end.y > height+50 ) ||
          (beam.start.x < -50 && beam.end.x < -50 ) ||
          (beam.start.y < -50 && beam.end.y < -50 ))
      {
        beams.remove(i);
        i--;
      
      }
    }
  }
}
