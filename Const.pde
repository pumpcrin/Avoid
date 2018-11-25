static class Const{
  
  static final int TimeLimit = 15;
  
  
  static final color StandardBeamCol = ConstColor(0, 255, 0);
  static final color BossBeamCol = ConstColor(20, 134, 255);
  static final color FireCol = ConstColor(255, 34, 0);
  
  
  static color ConstColor(int r, int g, int b, int a){
    return (int)((a << 24) | (r << 16) | (g << 8) | b);
  }
  
  static color ConstColor(int r, int g, int b){
    return ConstColor(r, g, b, 0xFF);
  }
}
