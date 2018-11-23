class BeamManager{
  ArrayList<Beam> beams = new ArrayList<Beam>();
  int location ; //ビームをどの位置から出すか
  int delay1,delay2,go; //どれくらいの頻度でビームを出すか
  
  void update(){
  add();
  println(beams.size(),location);
 
  }
  
  void add(){  
     //どの位置からビームがでるか
       Bemane.location = int(random(0,4));
      switch(location){
     
       case 0 : beams.add(new Beam(random(width),0,random(-4,4),random(3,5),13)); //up
       break;
       
       case 1 : beams.add(new Beam(random(width),height,random(-4,4),random(-3,-5),13));//down
       break;
       
       case 2 :  beams.add(new Beam(0,random(height),random(3,5),random(-4,4),13)); //left
       break;
       
       case 3 :   beams.add(new Beam(width,random(height),random(-3,-5),random(-4,4),13)); //right
       break;
       
       default : println("error");
       break; 
     }
       }
   
    
    
    //ビームの表示と移動と削除
    for(int i = 0; i < beams.size();i++){
    beams.get(i).lines();
    beams.get(i).move();
    
    if(beams.get(i).start.x > width+50 && beams.get(i).end.x > width+50 )
    {
      beams.remove(i);
      i--;
      
    }
    else if(beams.get(i).start.y > height+50 && beams.get(i).end.y > height+50 )
    {
      beams.remove(i);
      i--;
      
    } 
    else if(beams.get(i).start.x < -50 && beams.get(i).end.x < -50 )
    {
      beams.remove(i);
      i--;
      
    } 
    else if(beams.get(i).start.y < -50 && beams.get(i).end.y < -50 )
    {
      beams.remove(i);
      i--;
      
    }
    }
  }
}