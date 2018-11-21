
class TimerHolder{
  
  ArrayList<Timer> timers;
  
  TimerHolder(){
    timers = new ArrayList<Timer>();
  }
  
  void update(){
    for(Timer timer : timers)  timer.update();
    
    for(int i = 0; i < timers.size(); i++){
      Timer timer = timers.get(i);
      if(timer.isDispose){
        timers.remove(i);
        i--;
      }
    }
  }
  
  void setTimer(float timeLimit, IEvent func){
    
    timers.add(new Timer(timeLimit, func));
  }
  
}

class Timer{
  
  boolean isDispose;
  
  private float timeLimit;
  private int count;
  private IEvent func;
  
  Timer(float timeLimit, IEvent func){
    this.func = func;
    this.timeLimit = timeLimit;
    
    isDispose = false;
  }
  
  void update(){
    if(count++ > timeLimit * frameRate){
      func.action();
      isDispose = true;
    }
  }
}
