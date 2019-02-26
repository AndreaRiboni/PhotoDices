PImage[] dadi;
PImage foto;
int DIM_DADO;

void settings(){
  foto = loadImage("pic.jpg");
  dadi = new PImage[6];
  for(int i = 0; i < dadi.length; i++){
    dadi[i] = loadImage((i+1)+".png"); 
  }
  DIM_DADO = dadi[0].width;
  size(foto.width*DIM_DADO, foto.height*DIM_DADO);
  println("Foto caricata. Grandezza file: "+width+" X "+height);
}

int x = 0, y = 0;
void draw(){
  for(int i = 0; i < foto.pixels.length; i++){
    int brightness = (int)brightness(foto.pixels[i]);
    image(getDado(brightness), x, y);
    x += DIM_DADO;
    if(x == width){
      x = 0;
      y += DIM_DADO;
    }
  }
  saveFrame("vise.png");
  noLoop();
}

PImage getDado(int bright){
  return dadi[(int)bright*5/255];
}
