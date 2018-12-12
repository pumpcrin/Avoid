static class Const{
  
  static PFont UIFont_Bold;
  static PFont UIFont_semiBold;
  static PFont Japanese;
  static boolean debug = false;
  
  static final boolean IsOnlyOneBeam = false;    //ビームが一つだけ出る動画がほしいというかぶさんの要望から
  static final int TimeLimit = 30;
  
  static final color StandardBeamCol = ConstColor(0, 255, 0);
  static final color BossBeamCol = ConstColor(20, 134, 255);
  static final color FireCol = ConstColor(255, 34, 0);
  static final color BossTextCol = ConstColor(0, 134, 255);
  
  static final int BossBeamLength = 60;
  static final int BossBeamMaxVelocity = 30;
  static final int BossBeamMinVelocity = 5;
  static final int StandardBeamLength = 75;
  
  static final float WaveEffectSec = 0.7f;
  
  static final color Titlecol = ConstColor(244, 69, 66);
  
  static color ConstColor(int r, int g, int b, int a){
    return (int)((a << 24) | (r << 16) | (g << 8) | b);
  }
  
  static color ConstColor(int r, int g, int b){
    return ConstColor(r, g, b, 0xFF);
  }
  
  //小数第3位で四捨五入する
  static double round3(double num){
    BigDecimal numDecBefore = new BigDecimal(num);
    BigDecimal numDecAfter = numDecBefore.setScale(2, BigDecimal.ROUND_HALF_UP);
    double numAfter = numDecAfter.doubleValue();
    return numAfter;
  }
}


static class Media{
  
  static Movie moreBeam;
  static Movie onlyBeam;
  static Movie opening;
  
  static AudioPlayer Audioplayer;
  static AudioPlayer shoot;
  
}
