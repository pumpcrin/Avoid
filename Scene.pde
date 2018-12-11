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
    BGMGain = Audioplayer.getGain() - 20;
    Audioplayer.setGain(BGMGain);
    //Audioplayer.printControls();
    
    TiHolder = new TimerHolder();
    EfHolder = new EffectHolder();
  }

  void draw() {
    textFont(Const.UIFont_Bold);
    textAlign(CENTER,BASELINE);
    fill(244, 69, 66);
    textSize(200);
    text("Avoid", width/2, height/2-50);
    
    
    display.pressanyKey("Space",width/2,height/2+70);
  }
}

class explanation extends Scene {
  void setup(){
    Const.onlyBeam.loop();
    Const.moreBeam.loop();
    
    if(Audioplayer != null)  Audioplayer.close();
    Audioplayer = minim.loadFile("ex.mp3");
    Audioplayer.loop();
    BGMGain = Audioplayer.getGain() - 20;
    Audioplayer.setGain(BGMGain);
  }
  
  void draw(){
    display.Explain();
  }
}

class Game extends Scene {
  void setup() {
    Const.onlyBeam.stop();
    Const.moreBeam.stop();
    
    CoMane = new CollisionManager();
    BeMane = new BeamManager();
    boss = new Boss();
    player = new Player();
    
    //以下，BGM
    if(Audioplayer != null)  Audioplayer.close();
    Audioplayer = minim.loadFile("battle"+int(random(2,3.9))+".mp3");
    Audioplayer.play();
    BGMGain = Audioplayer.getGain() - 20;
    Audioplayer.setGain(BGMGain);
    
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
      textFont(Const.UIFont_Bold);
      textAlign(CENTER,CENTER);
      textSize(75);
      fill(255);
      text("GAMEOVER...",width/2,height/2);
    }
    
    display.timeCounter(); //左上にカウンター表示
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
    BGMGain = Audioplayer.getGain() - 20;
    Audioplayer.setGain(BGMGain);
  }

  void draw() {
    display.result();
  }
}
