abstract class Scene {
  abstract void setup();
  abstract void draw();
}

class Title extends Scene {
  void setup() {
    gameMode = 0;
    
    if(Media.Audioplayer != null)  Media.Audioplayer.close();
    Media.Audioplayer = minim.loadFile("title.mp3");
    Media.Audioplayer.play();
    BGMGain = Media.Audioplayer.getGain() - 10;
    Media.Audioplayer.setGain(BGMGain);
    //Audioplayer.printControls();
    
    TiHolder = new TimerHolder();
    EfHolder = new EffectHolder();
  }

  void draw() {
    display.Title();
  }
}

class explanation extends Scene {
  void setup(){
    Media.onlyBeam.loop();
    Media.moreBeam.loop();
    
    if(Media.Audioplayer != null)  Media.Audioplayer.close();
    Media.Audioplayer = minim.loadFile("ex.mp3");
    Media.Audioplayer.loop();
    BGMGain = Media.Audioplayer.getGain() - 10;
    Media.Audioplayer.setGain(BGMGain);
  }
  
  void draw(){
    display.Explain();
  }
}

class Game extends Scene {
  void setup() {
    Media.onlyBeam.stop();
    Media.moreBeam.stop();
    
    CoMane = new CollisionManager();
    BeMane = new BeamManager();
    boss = new Boss();
    player = new Player();
    
    //以下，BGM
    if(Media.Audioplayer != null)  Media.Audioplayer.close();
    Media.Audioplayer = minim.loadFile("battle"+int(random(2,3.9))+".mp3");
    Media.Audioplayer.play();
    BGMGain = Media.Audioplayer.getGain() - 10;
    Media.Audioplayer.setGain(BGMGain);
    
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
    if(Media.Audioplayer != null)  Media.Audioplayer.close();
    Media.Audioplayer = minim.loadFile("result.mp3");
    Media.Audioplayer.loop();
    BGMGain = Media.Audioplayer.getGain() - 10;
    Media.Audioplayer.setGain(BGMGain);
  }

  void draw() {
    display.result();
  }
}
