class EffectHolder{
  private ArrayList<ParticleSystem> pss;
  
  EffectHolder(){
    pss = new ArrayList<ParticleSystem>();
  }
  
  void update(){
    for(int i = 0; i < pss.size(); i++){
      ParticleSystem ps = pss.get(i);
      ps.update();
      
      if(ps.isDispose){
        pss.remove(i);
        i--;
      }
    }
  }
  
  void add(ParticleSystem ps){
    pss.add(ps);
  }
}

abstract class ParticleSystem{
  boolean isDispose = false;
  
  abstract void update();
}
