void sceneChange() {
  //char _key = key; //keyが押された時点でのkeyを保存するバッファ
  
  //if (key == ' '){
    //nowFadeout = true;

    if (scene instanceof Title) {
        scene = new explanation();
        scene.setup();
    } else if (scene instanceof explanation){
        scene = new Game();
        scene.setup();
    } else if (scene instanceof Game && !(gameMode == 1)) {
        scene = new Result();
        scene.setup();
    } else if (scene instanceof Result){
        scene = new Title();
        scene.setup();
    }
  //}
}
