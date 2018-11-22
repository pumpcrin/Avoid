boolean fadeOut(float x1, float y1, float x2, float y2){
  PImage offscr;
  
  offscr = createImage(width,height,RGB);
  if(nowFadeout){
    for(float i = 0; i<=250; i=i+15){
      //オンスクリーンバッファの更新
      loadPixels();
      offscr.pixels = pixels;
      offscr.updatePixels();
      
      background(0);
      
      //描画
      tint(255,240);
      image(offscr,x1,y1,x2,y2);
    }
  }
  
  nowFadeout = false;
  return true;
}
