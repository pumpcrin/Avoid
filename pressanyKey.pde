void pressanyKey(String Key, int x, int y){
    brink(0);
    textSize(75);
    text("Press "+Key+" key.", x, y);
}

void brink(color c){
    if (frameCount / 30 % 2 == 0) { // frameCount % 2 == 0 だと速すぎ
      fill(c);
    }else{
      fill(255);
    }
}
