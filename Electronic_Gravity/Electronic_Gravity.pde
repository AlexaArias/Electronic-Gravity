//Electronic Gravity

import ddf.minim.*;

Minim gestor;
AudioPlayer musica_fondo;

import shiffman.box2d.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.contacts.*;

Timer time;
Box2DProcessing box2d;


float g_y;
float timeF = random(5,5);

//Caja
ArrayList<Barra> barras;
ArrayList<Caja> caja;
Pantalla pantalla;


void setup(){
  size(800,600);
  
  gestor = new Minim(this);
  musica_fondo = gestor.loadFile("Free Tibet - 8D AUDIO.mp3");
  musica_fondo.setGain(-10);
  musica_fondo.loop();
  smooth();
  
  //Pantallas
  fuente1 = createFont("Colonna MT",30);
  fuente2 = createFont("Bell MT", 30);
  fuente3 = createFont("Bell MT", 30);
  fuente4 = createFont("Colonna MT", 30);
  fuente5 = createFont("Bell MT", 30);
  fuente6 = createFont("Colonna MT", 30);
  
  
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  box2d.setGravity(0,-10);
  
  caja = new ArrayList<Caja>();
  barras = new ArrayList<Barra>();
  
  //Tiempo
  int timeR = (int) timeF *10000;
  time = new Timer (timeR);
  
  
  pantalla = new Pantalla();
  
  //Barra de partida
  barras.add(new Barra(width/2,height-5,width/2-50,10));
}

void draw(){
 //Luces parpadeantes
  background (random (173),random(44),random(44));
  
 //Provoca que el objeto caiga 
  box2d.step();
  
 //Para que las cajas caigan cada determinado tiempo
   
  for (Caja c: caja) {
    c.display();
  }

  // Display all the boundaries
  for (Barra raya: barras) {
    raya.display();
  }
  
  pantalla.display();
  
}

void mousePressed() {
   Caja c = new Caja(mouseX,mouseY);
   caja.add(c);
   
   if(time.isFinished()){
     g_y = random (10,10);
     
     box2d.setGravity(g_y, g_y);
  
     }
   
}

void keyPressed() {
  pantalla.teclado();
}
