Scene scene = new Title();

float timeCount;
float _timeCount; //timeCountの初期値格納変数
int gameMode; //0=Title, 1=Gaming, 3=Result
boolean gameClear; //true=GameClear, false=GameOver
boolean debug =  false;

void setup() {
  fullScreen();
  background(0);
  frameRate(60);
  smooth();
}

void draw() {
  scene.setup();
  scene.draw();
}

void keyPressed() {
  if(key == '1')  debug();
  else  sceneChange();
}

void debug(){
  debug = !(debug);
  textAlign(LEFT,BOTTOM);
  fill(255);
  textSize(100);
  text("DEBUG MODE is Available.",0,height-200);
  text("gameClear = "+gameClear,0,height-100);
  text("gameMode = "+gameMode,0,height);
}
