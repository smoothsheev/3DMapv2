import java.awt.Robot;
Robot rbt;
//mode framework
int mode;
final int INTRO = 1;
final int GAME = 2;
final int PAUSE = 3;
final int GAMEOVER = 4;

//color pallette
color black = #000000;    //mossy stone
color white = #FFFFFF;    //empty
color dullBlue = #7092BE; //oak planks

//textures
PImage mossyStone;
PImage oakPlanks;
PImage snow;

//Map  variables
int gridSize;
PImage map;
//camera variables
float eyex, eyey, eyez; //camera position
float focusx, focusy, focusz; //point at which camera faces
float upx, upy, upz; //tilt axis

float leftRightAngle = 3* PI/2;
float upDownAngle = 0;
int forwardStart = 0;
int forwardEnd = 5000;
int backwardStart = 0;
int backwardEnd = -5000;
int speed = 10;
 
//keyboard variables
boolean wkey, akey, dkey, skey, spacekey, pausekey, quitkey;

//Game Objects
ArrayList<GameObject> objects;
ArrayList<Piles> piles;

//canvases
PGraphics world;
PGraphics HUD;

//Game mechanics
int framecount = 0;
int snowmanSpawnThreshold = 600;
int snowmanSpawnTimer = 0;
int health = 100;

void setup() {
  mode = INTRO;
  //create canvases
  world = createGraphics(width, height, P3D);
  HUD = createGraphics(width, height, P2D);
  //create game object list
  objects = new ArrayList<GameObject>();
  piles = new ArrayList<Piles>();
  mossyStone = loadImage("Mossy_Stone_Bricks.png");
  oakPlanks = loadImage("Oak_Planks.png");
  snow  = loadImage("Snow.png");
  world.textureMode(NORMAL);
  noCursor();
  try {
    rbt = new Robot();
  }
  catch(Exception e) {
    e.printStackTrace();
  }
  leftRightAngle = 0;
  size(displayWidth, displayHeight, P2D);

  eyex = width/2;
  eyey = 8*height/10;
  eyez = height/2;

  focusx = width/2;
  focusy = height/2;
  focusz = height/2 - 100;
  
  objects.add(new Zombie()); 

  upx = 0;
  upy = 1;
  upz = 0;

  //intialize map
  map = loadImage("map.png");
  gridSize = 100;
   
}

void draw() {
  if (mode == INTRO) {
   intro();
 } else if (mode == GAME) {
   game();
 } else if (mode == PAUSE) {
   pause();
 } else if (mode == GAMEOVER) {
   gameover();
 } else {
   println("ERROR! Mode is " + mode);
 }
  
}
