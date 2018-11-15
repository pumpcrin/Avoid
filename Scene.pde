abstract class Scene {
  abstract void setup();
  abstract void draw();
}

class Title extends Scene {
  void setup() {
    timeCount = 180; //ゲーム時間をセット
    _timeCount = timeCount;
    gameMode = 0;
    gameClear = true;
    
    //残らないように
    fill(0);
    rect(0, 0, width, height);
    
    textAlign(CENTER,BASELINE);
  }

  void draw() {
    fill(244, 119, 66);
    textSize(200);
    text("Avoid", width/2, height/5*2);
    
    pressanyKey("Space",width/2,height/2);
  }
}

class Game extends Scene {
  void setup() {
    //残らないように
    gameMode = 1;
    fill(0);
    rect(0, 0, width, height);
  }

  void draw() {
    timeCounter(); //左上にカウンター表示
    mine(10);
    
    if(gameMode == 1 && timeCount == 0)  gameMode = 2; //Result
    
    if(!(gameMode == 1) && !(gameClear)){
      textAlign(CENTER,CENTER);
      textSize(75);
      fill(255);
      text("GAMEOVER...",width/2,height/2);
    }
  }
}

class Result extends Scene {
  void setup() {
    fill(0);
    rect(0, 0, width, height);
  }

  void draw() {
    result();
  }
}
