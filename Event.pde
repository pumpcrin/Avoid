interface IEvent{
    void action();
}

interface IEventT<T>{
  void action(T t);
}

//値が変更されたらセットされた関数を呼ぶ
class Reactive<T>{
    boolean isActive;
    
    private T value;
    private T value_b;

    private IEventT<T> event;

    Reactive(){
        isActive = false;
    }

    void setValue(T newValue){
      value = newValue;
      
      if(!isActive)   return;
      if(value != value_b)
            event.action(value);
            
      value_b = value;
    }
    
    void setEvent(IEventT<T> newEvent){
      event = newEvent;
      isActive = true;
    }
}

class ReactiveBool{
    boolean isActive;
    
    private boolean value;
    private boolean value_b;

    private IEvent event;

    ReactiveBool(){
        isActive = false;
    }

    void setValue(boolean newValue){
      value = newValue;
      
      if(!isActive)   return;
      if(value != value_b)
            event.action();
            
      value_b = value;
    }
    
    void setEvent(IEvent newEvent){
      event = newEvent;
      isActive = true;
    }
}
