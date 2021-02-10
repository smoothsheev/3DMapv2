class Piles extends GameObject{
  

  
  Piles(float x, float y, float z, float s) {
    super(x,y,z,s);
    lives = 1;
  }
  
  void show() {
    
    texturedSlab(loc.x, loc.y, loc.z, snow, gridSize/5);

  }
  
  void act() {
  if (eyex <= loc.x - (gridSize/2) && eyex >= loc.x + (gridSize/2) && eyez <= loc.z - (gridSize/2) && eyez >= loc.z + (gridSize/2)) {
   lives = 0;
   ammo++;
  }
  }
  
  
  
}
