void sceneChange() {
  if (scene instanceof Title) {
    if (key == ' ')  scene = new Game();
  } else if (scene instanceof Game && !(gameMode == 1)) {
    if (key == ' ')  scene = new Result();
  }else if (scene instanceof Result){
    if (key == ' ')  scene = new Title();
  } 
}
