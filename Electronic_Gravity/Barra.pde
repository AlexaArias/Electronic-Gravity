class Barra {
  float x;
  float y;
  float w;
  float h;
  
  Body c;
  
  Barra(float x_,float y_, float w_,float h_){
    x = x_;
    y = y_;
    w = w_;
    h = h_;
    
    PolygonShape sd = new PolygonShape();
    float box2dW = box2d.scalarPixelsToWorld(w/2);
    float box2dH = box2d.scalarPixelsToWorld(h/2);
    sd.setAsBox(box2dW, box2dH);
    
    //Cuerpo
    BodyDef bd = new BodyDef();
    bd.type = BodyType.STATIC;
    bd.position.set(box2d.coordPixelsToWorld(x,y));
    c = box2d.createBody(bd);
    
    c.createFixture(sd,1);
  }
  
  void display() {
    fill(random (255));
    stroke(0);
    rectMode(CENTER);
    rect(x,y,w,h);
  }
}
