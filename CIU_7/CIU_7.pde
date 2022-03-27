import processing.sound.*;
import java.util.*;
import processing.awt.PSurfaceAWT;
import javax.swing.JFrame;
import java.awt.event.*;

SinOsc osc;
Env env;

PImage img;
FileExplorer FE;
End e;

int[] midiSequence = { 46, 48, 50, 52, 54, 56, 58, 60, 62, 64, 66, 68, 70, 72, 74, 76 };

float tsubida = 0.001;
float tsostenido = 0.004;
float vsostenido = 0.5;
float tbajada = 0.6;

Integer[] aux;
int x;
int i;
int soundTemp;
boolean generate = false;
boolean errorFile = false;
boolean errorSize = false;
String path;

void setup() {
  size(1980, 1080);
  surface.setSize(500,500);
  
  osc = new SinOsc(this);
  env  = new Env(this);
  
  FE = new FileExplorer(getJFrame(),true);
}      

void changeSettings(){
  img.loadPixels();
  x = 0;
  permutate();
  background(120);
  surface.setSize(img.width,img.height);
}

void draw() {
  if(generate){
    loadPixels();
    for(i = 0; i < x; i++){
      pixels[aux[i]] = img.pixels[aux[i]];
    }
    if(x+100 < img.pixels.length){
      if(soundTemp >= 15){
        playSound();  
      }
      soundTemp++;
      x+=100;
    }else{
      if(x+1 <= img.pixels.length){
        if(soundTemp >= 15){
          playSound();  
        }
        soundTemp++;
        x++;
      }
    }
    updatePixels();
    if(x >= img.pixels.length){
      e = new End(getJFrame(),true);
    }
  }else{
    background(255);
    surface.setSize(500,500);
    fill(0);
    textAlign(CENTER);
    textSize(24);
    text("Click to select an image...",width/2,height/2);
    fill(255,0,0);
    if(errorFile) text("Error reading file!",width/2,height/2 +34);
    if(errorSize) text("Error image too big!",width/2,height/2 +68);
  }
}

void mouseClicked(){
  if(!generate){
    path = FE.getImage();
    if(path != null){
      if(!(path.endsWith(".jpg") || path.endsWith(".png"))){
        errorFile = true;
      }else {
        errorFile = false;
        img = loadImage(path);
        if(img.width > 1920 || img.height > 1080){
          errorSize = true;
        }else {
          surface.setSize(2000,2000);
          changeSettings();
          generate = true;
        }
      }
    }
  }
}

void keyPressed(){
 switch(key){
   case 'r':
   case 'R':
     changeSettings();
     break;
   case 'f':
   case 'F':
     x = img.pixels.length;
     break;
 }
}

void playSound() {
  int brigthness = (int)brightness(img.pixels[aux[i]]);
  int sound = floor(brigthness/17);

  osc.play(midiToFreq(midiSequence[sound]), 0.5);
  env.play(osc, tsubida, tsostenido, vsostenido, tbajada);  
  soundTemp = -1;
}

float midiToFreq(int nota) { //<>//
  return (pow(2, ((nota-69)/12.0))) * 440;
}

void permutate(){
  aux = new Integer[img.pixels.length];
  for(int j = 0; j < aux.length; j++){
    aux[j] = j;
  }
  Collections.shuffle(Arrays.asList(aux));
}

JFrame getJFrame() {
  PSurfaceAWT surf = (PSurfaceAWT) getSurface();
  PSurfaceAWT.SmoothCanvas canvas = (PSurfaceAWT.SmoothCanvas) surf.getNative();
  return (JFrame) canvas.getFrame();
}
