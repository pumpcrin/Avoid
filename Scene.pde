abstract class Scene {
  abstract void setup();
  abstract void draw();
}

class Title extends Scene {
  void setup() {
    gameMode = 0;
  }

  void draw() {
    textFont(UIFont_Bold);
    textAlign(CENTER,BASELINE);
    fill(244, 69, 66);
    textSize(200);
    text("Avoid", width/2, height/2-50);
    
    pressanyKey("Space",width/2,height/2+70);
  }
}

class explanation extends Scene {
  void setup(){
    
  }
  
  void draw(){
    Explanation();
  }
}

class Game extends Scene {
  void setup() {
    timeCount = 180; //ゲーム時間をセット
    _timeCount = timeCount;
    gameOver = false;
    
    gameMode = 1;
  }

  void draw() {
    player.mine(15); //自機生成

    if(gameMode == 1 && timeCount == 0)  gameMode = 2; //Result
    if(gameOver)  gameMode = 2;
    if(!(gameMode == 1) && gameOver){
      Fire();
      textFont(UIFont_Bold);
      textAlign(CENTER,CENTER);
      textSize(75);
      fill(255);
      text("GAMEOVER...",width/2,height/2);
    }
    
    timeCounter(); //左上にカウンター表示
  }
}

class Result extends Scene {
  void setup() {
    gameMode = 2;
  }

  void draw() {
    result();
  }
}
