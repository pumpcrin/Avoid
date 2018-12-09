class BeamManager{
  ArrayList<Beam> beams = new ArrayList<Beam>();
  int location ; //ビームをどの位置から出すか
  
  
  void update(){
    gamelevel();
    control();
    println(beams.size(),location);
  }
  
  //どれくらいの頻度でビームを出すか
  void gamelevel(){
     if(timeCount/60 >  10 && timeCount/60 < 15){
      if(timeCount % 10 == 0)
        add();  
      }
    else if(timeCount/60 >  5 && timeCount/60 < 10){
      if(timeCount % 8 == 0)
        add();  
      }
   else if(timeCount/60 > 3.5 && timeCount/60 < 5){
     if(timeCount % 5 == 0)
     add();
   }
   else if(timeCount/60 > 0 && timeCount/60 < 3.5){
     if(timeCount % 1 == 0)
     add();
   }
  }
  
  void add(){  
    //どの位置からビームがでるか
    BeMane.location = int(random(0,4));
    switch(location){
     
      case 0 : beams.add(new Beam(random(width),0,random(-4,4),random(3,5),75)); //up
      break;
      
      case 1 : beams.add(new Beam(random(width),height,random(-4,4),random(-3,-5),75));//down
      break;
      
      case 2 :  beams.add(new Beam(0,random(height),random(3,5),random(-4,4),75)); //left
      break;
      
      case 3 :   beams.add(new Beam(width,random(height),random(-3,-5),random(-4,4),75)); //right
      break;
      
      default : println("error");
      break; 
    }     
    }
    //ビームの表示と移動と削除
    void control(){
    for(int i = 0; i < beams.size();i++){
      Beam beam = beams.get(i);
      beam.lines();
      beam.move();
      
      if(beam.isDispose || isOut(beam))
      {
        beams.remove(i);
        i--;
      }
      }
  }
   
   
    
  boolean isOut(Beam beam){
    return ((beam.start.x > width+50 && beam.end.x > width+50 ) ||
          (beam.start.y > height+50 && beam.end.y > height+50 ) ||
          (beam.start.x < -50 && beam.end.x < -50 ) ||
          (beam.start.y < -50 && beam.end.y < -50 ));
  }
}