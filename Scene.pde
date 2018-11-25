abstract class Scene {
  abstract void setup();
  abstract void draw();
}

class Title extends Scene {
  void setup() {
    gameMode = 0;
    
    if(Audioplayer != null)  Audioplayer.close();
    Audioplayer = minim.loadFile("title.mp3");
    Audioplayer.play();
    
    TiHolder = new TimerHolder();
    EfHolder = new EffectHolder();
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
    if(Audioplayer != null)  Audioplayer.close();
    Audioplayer = minim.loadFile("ex.mp3");
    Audioplayer.loop();
  }
  
  void draw(){
    Explanation();
  }
}

class Game extends Scene {
  void setup() {
    CoMane = new CollisionManager();
    BeMane = new BeamManager();
    boss = new Boss();
    player = new Player();
    
    //以下，BGM
    if(Audioplayer != null)  Audioplayer.close();
    Audioplayer = minim.loadFile("battle"+int(random(2,3))+".mp3");
    Audioplayer.play();
    
    timeCount = Const.TimeLimit * 60; //ゲーム時間をセット(フレーム単位)
    _timeCount = timeCount;
    gameOver = false;
    
    gameMode = 1;
  }

  void draw() {
    
    if(!gameOver)  GameProcess();      //ゲームオーバーになったら出ないやつの処理
    
    EfHolder.update();  //エフェクトupdate
    
    if(gameMode == 1 && timeCount == 0)  gameMode = 2; //Result
    if(gameOver)    gameMode = 2;
    if(!(gameMode == 1) && gameOver){
      //Fire();
      textFont(UIFont_Bold);
      textAlign(CENTER,CENTER);
      textSize(75);
      fill(255);
      text("GAMEOVER...",width/2,height/2);
    }
    
    timeCounter(); //左上にカウンター表示
  }
  
  void GameProcess(){
    BeMane.update();
    boss.update();
    player.mine(7.5);   //自機生成
    
    CoMane.update();    //衝突判定はすべてのオブジェクトを移動させた後
  }
}

class Result extends Scene {
  void setup() {
    gameMode = 2;
    
    //以下，BGM
    if(Audioplayer != null)  Audioplayer.close();
    Audioplayer = minim.loadFile("result.mp3");
    Audioplayer.loop();
  }

  void draw() {
    result();
  }
}
