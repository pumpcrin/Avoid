void sceneChange() {
  if (scene instanceof Title) {
    if (key == ' '){
      scene = new Game();
      scene.setup();
    }
  } else if (scene instanceof Game && !(gameMode == 1)) {
    if (key == ' '){
      scene = new Result();
      scene.setup();
    }
  }else if (scene instanceof Result){
    if (key == ' '){
      scene = new Title();
      scene.setup();
    }
  } 
}
