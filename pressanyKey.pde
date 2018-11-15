void pressanyKey(String Key, int x, int y){
    if (frameCount / 30 % 2 == 0) { // frameCount % 2 == 0 だと速すぎ
      fill(0);
    }else{
      fill(255);
    }
    textSize(75);
    text("Press "+Key+" key.", x, y);
}
