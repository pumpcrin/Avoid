abstract class Scene {
  abstract void setup();
  abstract void draw();
}

class Title extends Scene {
  void setup() {
    gameMode = 0;
  }

  void draw() {
    textAlign(CENTER,BASELINE);
    fill(244, 119, 66);
    textSize(200);
    text("Avoid", width/2, height/5*2);
    
    pressanyKey("Space",width/2,height/2);
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
    timeCounter(); //左上にカウンター表示
    player.mine(10); //自機生成

    if(gameMode == 1 && timeCount == 0)  gameMode = 2; //Result
    if(gameOver)  gameMode = 2;
    if(!(gameMode == 1) && gameOver){
      textAlign(CENTER,CENTER);
      textSize(75);
      fill(255);
      text("GAMEOVER...",width/2,height/2);
      Fire();
    }
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
