class Snow  extends GameObject {
  
  PVector vel;
  
  
  Snow(float x, float y, float z) {
    super(x, y, z, random(2, 5));
    vel = new PVector (random(-10, 10), 10, random(-10, 10));
    //vel.rotate(radians(180) + random(-10, 10));
    vel.setMag(random(3,8));
    lives = 1;
  }
  
  void show() {
    //println(objects.size());
    world.pushMatrix();
    world.translate(loc.x, loc.y, loc.z);
    world.fill(white, lives);
    world.box(size);
    world.popMatrix();
    lives++;
  }
  
  void act() {
    loc.add(vel); 
    int fallCount = 0;
    if (loc.y >= height) {
    lives = 0;  
    fallCount++;
    if (loc.x >= -1900 && loc.x <= 1900 && loc.z >= -1900 && loc.z <= 1900 && fallCount >= 1){
    int centerX = ((int)loc.x / 100) *100;

      int centerZ = ((int)loc.z / 100) *100;
     fallCount = 0;
       objects.add(new Piles(centerX, height, centerZ, gridSize)); 
    }
    }
  }
  
  
  
}
