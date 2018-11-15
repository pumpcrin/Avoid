Scene scene = new Title();

float timeCount;
float _timeCount; //timeCountの初期値格納変数
boolean gameClear; //true=ゲームクリア, false=ケームオーバー

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
  sceneChange();
}
