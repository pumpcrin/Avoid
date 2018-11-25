static class Const{
  
  static final int TimeLimit = 15;
  
  /*
  static final color StandardBeamCol = ConstColor(0, 255, 0);
  static final color BossBeamCol = ConstColor(255, 20, 134);
  static final color FireCol = ConstColor(255, 34, 0);
  */
  
  static color ConstColor(int r, int g, int b){
    return (int)((r << 16) | (g << 8) | b) ;
  }
}
