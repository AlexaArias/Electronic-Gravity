class Caja{
  Body caja;
  float r;
  
  //Constructor
  Caja(float x,float y){
    r = random(5,15);
    
    
    
   BodyDef bd = new BodyDef();
   bd.type = BodyType.DYNAMIC;
   bd.position = box2d.coordPixelsToWorld(x,y);
   caja = box2d.createBody(bd);
   
   
    //Definir la forma del poligono
   PolygonShape sd = new PolygonShape();
   float box2dr = box2d.scalarPixelsToWorld (r);
   sd.setAsBox(box2dr, box2dr);
   
   FixtureDef fd = new FixtureDef();
   fd.shape= sd;
   
 //Fisica
   fd.density = 1;
   fd.friction = 1;
   fd.restitution = 0;
   

   caja.createFixture(fd);
//Velocidad
  caja.setLinearVelocity(new Vec2 (random(-5,5), random(2,5)));
  }
  
//Remover la caja cuando este fuera de la pantalla
  void killBody(){
    box2d.destroyBody(caja);
  }
  
  boolean done() {
    Vec2 pos = box2d.getBodyPixelCoord(caja);
    
   if (pos.y > height+r*2){
     killBody();
     return true;
   }
   return false;
  }
  
//Dibujo de la caja
  void display() {
    Vec2 pos = box2d.getBodyPixelCoord(caja);
    
    rectMode(CENTER);
    pushMatrix();
    translate(pos.x, pos.y);
    fill(random(255), random(255), random(255));
    stroke(0);
    rect(0, 0, r*2,r*2);
    popMatrix();
  }
}
