abstract class Scene {
  abstract void setup();
  abstract void draw();
}

class Title extends Scene {
  void setup() {
    timeCount = 180; //ゲーム時間をセット
    gameClear = true;
    
    //残らないように
    fill(0);
    rect(0, 0, width, height);
    
    textAlign(CENTER);
  }

  void draw() {
    fill(244, 119, 66);
    textSize(200);
    text("Avoid", width/2, height/5*2);
    
    //点滅させる
    if (frameCount / 30 % 2 == 0) { // frameCount % 2 == 0 だと速すぎ
      fill(0);
    }else{
      fill(255);
    }
    textSize(75);
    text("Press spece key.", width/2, height/5*3);
  }
}

class Game extends Scene {
  void setup() {
    //残らないように
    fill(0);
    rect(0, 0, width, height);
  }

  void draw() {
    timeCounter(); //左上にカウンター表示
    mine(10);
    
    if(!(gameClear)){
      textAlign(CENTER,CENTER);
      text("GAMEOVER...",width/2,height/2);
    }
  }
}

class Result extends Scene {
  void setup() {
  }

  void draw() {
    fill(0);
    rect(0, 0, width, height);
    fill(255);
    textAlign(CENTER,TOP);
    text("Result", width/2, 0);
  }
}

class GameOver extends Scene {
  void setup() {
  }
  
  void draw() {
  }
}
