PImage bg;
PImage start;
PImage loose;
PImage win;
PImage mancha;
PImage boca;
PImage hamburguesa;
PImage gaseosa;
PImage hotdog;
PImage pizza;
PImage nachos;
PImage papitas;
PImage berengena;
PImage coliflor;
PImage lechuga;
PImage manzana;
PImage papa;
PImage pina;

PFont font;

float pos1X[]; //pos burger food
float pos1Y[]; //pos burger food

float pos2X[]; //pos vegetable food
float pos2Y[]; //pos vegetable  food

float pos3X[]; //pos vegetable food
float pos3Y[]; //pos vegetable  food

int estado1 []; //state burger food
int estado2 []; //state vegetable food
int estado3 []; //state pizza food

int puntaje1; //score for fast
int puntaje2; //score for fit

int stage;

float vel;

float distancia=0; 

void setup()
{
  stage = 1;
  size(600, 600);
  bg = loadImage("background-01.png");
  start = loadImage("start.png");
  win = loadImage("win.png");
  loose = loadImage("loose.png");
  mancha = loadImage ("mancha.png");
  font = loadFont("Arial-BoldMT-38.vlw");
  
  
  boca = loadImage("boca.png");
  hamburguesa = loadImage ("hamburguesa.png");
  hotdog = loadImage ("hotdog.png");
  gaseosa = loadImage ("gaseosa.png");
  pizza = loadImage ("pizza.png");
  nachos = loadImage ("nachos.png");
  papitas = loadImage ("papitas.png");
  berengena = loadImage ("berengena.png");
  coliflor = loadImage ("coliflor.png");
  lechuga = loadImage ("lechuga.png");
  manzana = loadImage ("manzana.png");
  pina = loadImage ("pina.png");
  
  pos1X = new float[50]; 
  pos1Y = new float[50];
  estado1 = new int[50];
  
  for (int i=0; i<50; i++)
  {
    pos1X[i]=random(0,600);
    pos1Y[i]=random(0,100);
    estado1[i] = 1;
  }
  
   pos2X = new float[50]; 
   pos2Y = new float[50];
   estado2 = new int[50];
  
  for (int i=0; i<50; i++)
  {
    pos2X[i]=random(0,600);
    pos2Y[i]=random(0,100);
    estado2[i] = 1;
  }
  
   pos3X = new float[50]; 
   pos3Y = new float[50];
   estado3 = new int[50];
  
  for (int i=0; i<50; i++)
  {
    pos3X[i]=random(0,600);
    pos3Y[i]=random(0,100);
    estado3[i] = 1;
  }

}

void draw()
{

textFont (font);

if (stage==1)
{
  image (start, 0, 0);
  if (mousePressed == true)
  {stage = 2;}
}

if (stage == 2)
{
  background(bg);
  
  image(boca, 0, 400);

  for(int i=0; i<50; i++)
  {
  vel=random(0.5,1);
  pos1Y[i] = pos1Y[i]+vel;
  
  vel=random(0.7,1.5);
  pos2Y[i] = pos2Y[i]+vel;
  
  vel=random(0.3,2);
  pos3Y[i] = pos3Y[i]+vel;
  
  }

  for (int i=0; i<50; i++)
  {
  if(estado1[i]==1)
  {
  image (hamburguesa, pos1X[i], pos1Y[i], 30, 30);
  //image (hotdog, pos1X[i], pos1Y[i], 20, 20);
  //image (gaseosa, pos1X[i], pos1Y[i], 20, 20);
  //image (papitas, pos1X[i], pos1Y[i], 20, 20);
  //image (pizza, pos1X[i], pos1Y[i], 20, 20);
  //image (nachos, pos1X[i], pos1Y[i], 50, 50);
   }
   if(estado2[i]==1)
   {
  image (berengena, pos2X[i], pos2Y[i], 30, 30);
  //image (coliflor, pos2X[i], pos2Y[i], 20, 20);
  //image (lechuga, pos2X[i], pos2Y[i], 20, 20);
  //image (manzana, pos2X[i], pos2Y[i], 20, 20);
  //image (papa, pos2X[i], pos2Y[i], 20, 20);
  //image (pina, pos2X[i], pos2Y[i], 50, 50);
  }
  if(estado2[i]==1)
   {
  image (pizza, pos3X[i], pos3Y[i], 30, 30);
  //image (coliflor, pos2X[i], pos2Y[i], 20, 20);
  //image (lechuga, pos2X[i], pos2Y[i], 20, 20);
  //image (manzana, pos2X[i], pos2Y[i], 20, 20);
  //image (papa, pos2X[i], pos2Y[i], 20, 20);
  //image (pina, pos2X[i], pos2Y[i], 50, 50);
  }
 }

for(int i=0; i<50; i++)
{
  if(mousePressed == true)
  {
    
    distancia = dist(mouseX, mouseY, pos1X[i], pos1Y[i]); 
    if(distancia <= 20)
    {
      image (mancha,pos1X[i], pos1Y[i], 30, 30) ;
      estado1[i] = 0;
    }
  }
  
  if(mousePressed == true)
  {
    distancia = dist(mouseX, mouseY, pos2X[i], pos2Y[i]); 
    if(distancia <= 20)
    {
      estado2[i] = 0;
    }
  }
  
  if(mousePressed == true)
  {
    distancia = dist(mouseX, mouseY, pos3X[i], pos3Y[i]); 
    if(distancia <= 20)
    {
      image (mancha,pos3X[i], pos3Y[i], 30, 30) ;
      estado3[i] = 0;
    }
  }
}

fill(#008F39);
text("FAST: " + puntaje1, 30, 40);
fill(#FF0000);
text("FIT: " + puntaje2, 450, 40);

puntaje1= 0;
puntaje2= 0;

for(int i=0; i<50; i++)
{
  if(estado1[i] == 0)
  {
    puntaje1++;
  }
  
  if(estado3[i] == 0)
  {
    puntaje1++;
  } 
  if(estado2[i] == 0)
  {
    puntaje2--;
  }
 }
}

  if (puntaje1 >= 50)
  {image(win, 0, 0);
  if (mousePressed == true) {
  stage = 1;
   }
   }
  
  if (puntaje2 <= -10)
  {image (loose, 0, 0);
  if (mousePressed == true) {
  stage = 1;}
  }
 }

//if(puntaje2 < 0)
 // {
//  image(loose, 0, 0);
 // }
// if (mousePressed == true) {
//  stage = 1;
//  }  
