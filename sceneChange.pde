void sceneChange() {
  if (scene instanceof Title) {
    if (key == ' ')  scene = new Game();
  } else if (scene instanceof Game && timeCount == 0) {
    if (key == ' ')  scene = new Result();
  } else if (scene instanceof Result || scene instanceof GameOver){
    if (key == ' ')  scene = new Title();
  }
}
