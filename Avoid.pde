//シーン
Scene scene = new Title();

//以下，システム関連宣言
float timeCount;
float _timeCount; //timeCountの初期値格納変数
int gameMode; //0=Title, 1=Gaming, 2=Result
boolean gameOver; //false=GameClear, true=GameOver
boolean debug = false;

//以下，エフェクト関連宣言
FireParticleSystem Fire;


void setup() {
  fullScreen();
  background(0);
  frameRate(60);
  smooth();
}

void draw() {
  background(0);
  scene.draw();
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
    textAlign(LEFT,BOTTOM);
    fill(255);
    textSize(100);
    text("DEBUG MODE is Available.",0,height-300);
    text("gameOver = "+gameOver,0,height-200);
    text("gameMode = "+gameMode,0,height-100);
    text("timeCount = "+timeCount,0,height);
  }
}
