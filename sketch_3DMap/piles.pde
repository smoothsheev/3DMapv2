class Piles extends GameObject{
  

  
  Piles(float x, float y, float z, float s) {
    super(x,y,z,s);
    lives = 1;
  }
  
  void show() {
    
    texturedSlab(loc.x, loc.y, loc.z, snow, gridSize/5);

  }
  
  void act() {
  if (mouseX <= loc.x - (gridSize/2) && mouseX >= loc.x + (gridSize/2) && mouseY <= loc.y - (gridSize/2) && mouseY >= loc.y + (gridSize/2)) {
    
  }
  }
  
  
  
}
