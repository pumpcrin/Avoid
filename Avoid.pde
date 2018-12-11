import ddf.minim.*;
Minim minim;
AudioPlayer Audioplayer;
float BGMGain;

import java.math.*;

//シーン
Scene scene = new Title();
Display display = new Display();

//以下，システム関連宣言
Player player;
BeamManager BeMane;
CollisionManager CoMane;
TimerHolder TiHolder;
EffectHolder EfHolder;
Boss boss;

boolean nowFadeout = false;
boolean stop_debug = false;

float timeCount;
float _timeCount; //timeCountの初期値格納変数
int gameMode; //0=Title, 1=Gaming, 2=Result
boolean gameOver; //false=GameClear, true=GameOver

//以下，エフェクト関連宣言
FireParticleSystem Fire;

void setup() {
  Const.UIFont_Bold = loadFont("Blanka-Regular-250.vlw");
  Const.UIFont_semiBold = loadFont("Blanka-Regular-250.vlw");
  Const.Japanese = loadFont("851H-kktt-100.vlw");
  
  minim = new Minim(this);
  
  //size(1500, 1000);
  fullScreen();
  background(0);
  frameRate(60);
  smooth();
  
  scene.setup();
}

void draw() {
  /*
  デバッグ用
  if(stop_debug){
    fill(255, 134, 0);
    ellipse(Error_loc.x, Error_loc.y, Error_R*2, Error_R*2);
    stroke(255, 134, 0);
    line(Error_start.x, Error_start.y, Error_end.x, Error_end.y);
    return;
  }*/
  
  TiHolder.update();    //タイマーは一番最初
  
  if(!(nowFadeout)){
    background(0);
    scene.draw();
  }
  
  if(nowFadeout){
    display.Fadeout(0,0,width,height);
  }
  
  debug();
}

void keyPressed() {
  //sceneChange();
  if(key ==  ' '&& gameMode != 1)  nowFadeout = true;
  
  //FireSetup(mouseX,mouseY);
}

void keyReleased(){
  if(key == 'D')  Const.debug = !(Const.debug);
  else if((key == ENTER) && (Const.debug))  gameOver = true;
}



void stop(){
  if(Audioplayer != null)  Audioplayer.close();
  minim.stop();
  super.stop();
}

void debug(){
  if(Const.debug){
    textFont(Const.UIFont_semiBold);  
    textAlign(LEFT,BOTTOM);
    fill(255);
    textSize(50);
    text("DEBUG MODE is Available.",0,height-300);
    text("gameOver = "+gameOver,0,height-250);
    text("gameMode = "+gameMode,0,height-200);
    text("timeCount = "+timeCount,0,height-150);
    text("Scene = "+scene,0,height-100);
    text("BGM's Gain = "+BGMGain,0,height-50);
    text("FPS = "+int(frameRate),0,height);
  }
}

//boolean isMousePressing = false;    デバッグ用

/*
デバッグ用です
void mousePressed(){
  if(scene instanceof Game){
    if(!isMousePressing)  stop_debug = !stop_debug;
    isMousePressing = true;
  }
}

void mouseReleased(){
  isMousePressing = false;
}*/
