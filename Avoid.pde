//シーン
Scene scene = new Title();

//以下，システム関連宣言
Player player = new Player();
boolean nowFadeout = false;

PFont UIFont_Bold;
PFont UIFont_semiBold;
PFont Japanese;

float timeCount;
float _timeCount; //timeCountの初期値格納変数
int gameMode; //0=Title, 1=Gaming, 2=Result
boolean gameOver; //false=GameClear, true=GameOver
boolean debug = false;

//以下，エフェクト関連宣言
FireParticleSystem Fire;


void setup() {
  UIFont_Bold = loadFont("Blanka-Regular-250.vlw");
  UIFont_semiBold = loadFont("Blanka-Regular-250.vlw");
  Japanese = loadFont("851H-kktt-100.vlw");
  
  fullScreen();
  //background(0);
  frameRate(60);
  smooth();
}

void draw() {
  background(0);
  if(nowFadeout){
    fadeOut(0,0,width,height);
  }else{
    scene.draw();
  }
  debug();
}

void keyPressed() {
  sceneChange();
  FireSetup(mouseX,mouseY);
}

void keyReleased(){
  if(key == 'D')  debug = !(debug);
  else if((key == ENTER) && (debug))  gameOver = !(gameOver);
}


void debug(){
  if(debug){
    textFont(UIFont_semiBold);
    textAlign(LEFT,BOTTOM);
    fill(255);
    textSize(50);
    text("DEBUG MODE is Available.",0,height-250);
    text("gameOver = "+gameOver,0,height-200);
    text("gameMode = "+gameMode,0,height-150);
    text("timeCount = "+timeCount,0,height-100);
    text("FPS = "+int(frameRate),0,height);
  }
}
