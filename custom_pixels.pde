import unlekker.util.*;
import unlekker.modelbuilder.*;

MouseNav3D nav;
UGeometry model;

byte designWidth = 16;
byte designHeight = 16;
int pixelSize = 10;


PixelButton[][] PixelDesign = new PixelButton[designWidth][designHeight];
boolean[][] Pixels = new boolean[designWidth][designHeight];

PImage bld;
SubmitButton Submit = new SubmitButton();
PImage clr;
ClearButton Clear = new ClearButton();


void setup() {
  smooth();
  size(700, 700, P3D); 
  nav=new MouseNav3D(this);
  nav.trans.set(width/2,height/2,0);
  
  bld = loadImage("build.jpg");
  clr = loadImage("clear.jpg");


  int startLeft = 10;
  int startTop = 30;
  
  for ( int h = 0; h < designHeight; h++) {
    for ( int w = 0; w < designWidth; w++) {
      PixelDesign[h][w] = new PixelButton(w, h, w * pixelSize + startLeft, h * pixelSize + startTop);
    }
  }
  buildModel();
}

void draw() {
 background(0); 
 noStroke();
 noFill();
 lights();

 Submit.display();
 Clear.display();
 
 for ( int h = 0; h < designHeight; h++) {
    for ( int w = 0; w < designWidth; w++) {
      PixelDesign[h][w].display();
    }
  }

 nav.doTransforms();

 noStroke();
 model.draw(this);
}

void mousePressed() {
  for ( int pH = 0; pH < designHeight; pH++) {
    for ( int pW = 0; pW < designWidth; pW++) {
      if(PixelDesign[pW][pH].pressed()) {
         PixelDesign[pW][pH].switchColors();
      }
    }
  }
  if(Submit.pressed()) {
     fill(255);
     buildModel();
     model.draw(this);
  }
  if(Clear.pressed()) {
    for ( int pH = 0; pH < designHeight; pH++) {
      for ( int pW = 0; pW < designWidth; pW++) {
        PixelDesign[pH][pW].clearColors();
      }
    }
    buildModel();
    model.draw(this);
  }
}


public void mouseDragged() {
  nav.mouseDragged();
}
	
public void keyPressed() {
  nav.keyPressed();

  if(key=='s') { 
    fill(200);
    String filename = "shape-"+year()+month()+day()+hour()+minute()+second()+millis()+".stl";
    model.writeSTL(this, filename);
  }
}
