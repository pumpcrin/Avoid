import java.awt.image.*;

class WaveEffect extends ParticleSystem{
  final float RadPerSec = 2*PI;
  
  PVector loc;                //中心座標
  int radius;
  
  private float currentRad;
  private PVector loc_disp;    //表示時はこのエフェクトの座標を使う（imageを使うため、左上の座標を格納する）
  
  WaterFilter wf;
  
  WaveEffect(PVector loc, int r){
    this.loc = loc.copy();
    this.radius = r;
    
    wf = new WaterFilter();
    wf.setRadius(r);
    wf.setAmplitude(2);
    
    IEvent e = new IEvent(){
       void action(){
         isDispose = true;
       }
    };
          
    // このエフェクトが消える処理を実装するのにCollisionをいじらないといけないので、今は時間で消える
    TiHolder.setTimer(Const.WaveEffectSec, e);
    //
    
    loc_disp = PVector.sub(loc, new PVector(r, r));  //左上の座標とする
    currentRad = 0;
  }
  
  void update(){
    currentRad += RadPerSec / frameRate;
    currentRad %= 2*PI;
    wf.setPhase(-currentRad);
    
    draw();
  }
  
  void draw(){
    BufferedImage bi = (BufferedImage)g.getImage();
    BufferedImage subImage = bi.getSubimage((int)loc_disp.x, (int)loc_disp.y, radius*2, radius*2);
  
    PImage img2 = new PImage(wf.filter(subImage, null));
    
    imageMode(CORNER);
    image(img2, loc_disp.x, loc_disp.y);
  }
  
  void setDispose(){
    isDispose = true;
  }
}
