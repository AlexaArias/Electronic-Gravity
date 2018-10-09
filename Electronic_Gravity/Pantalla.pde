 PFont fuente1;
 PFont fuente2;
 PFont fuente3;
 PFont fuente4;
 PFont fuente5;
 PFont fuente6;
 
class Pantalla{

  int p;
  

  void inicio(){
    background(237,31,31);
    noFill();
    
    fill(0);
    textFont(fuente1);
    textSize(90);
    text("Electronic Gravity", 80,200);
    fill(255);
    textFont(fuente2);
    textSize(30);
    text("Presiona 'Enter' para comenzar", 220,280);
    fill(0);
    textFont(fuente3);
    textSize(25);
    text("Utiliza audifonos para una mejor experiencia", 30,550);
    textSize(25);
    text("ADVERTENCIA, no apto para epilepticos.", 30, 580);
    
      }
    
  

  void instrucciones(){
    background(57,237,31);
    noFill();
    
    fill(255,0,0);
    textFont(fuente4);
    textSize(50);
    text("INSTRUCCIONES", 50,80);
    fill(0);
    textSize(30);
    text("Haz la torre más alta que puedas al ritmo de la música,", 50,200);
    text("haz CLIC para ir creando tus cajas.", 50,250);
    text("Recuerda ser rápido antes de que la gravedad", 50,300); 
    text("arruine tu avance.", 50,350);
    fill(255);
    textFont(fuente5);
    textSize(30);
    text("Presiona 'L' para comenzar", 50,500);

  }
  
  void juego(){
  
  }

  void fin(){
    textFont(fuente6);
    textSize(60);
    text("Game Over", 100,200);
    text("Presiona 'X' para salir", 100,300);
    //box2d.setGravity(g_y, g_y);
    
  }

  

  void display(){

    switch(this.p){

      case 0:

      inicio();

      break;

      case 1:

      instrucciones();
        
      break;
      
      case 2:

      juego();
      if(time.isFinished()){
        p = 3;
      }

      break;

      case 3:

      fin();
     

      break;

      
    }

  }

  void teclado(){
    if(key == 10){
      p = 1;
    } 
    
    if(key == 'l'){
      p = 2;
    }
    
    if(key == 'x') {
      exit();
      
    }
    

  }
}
