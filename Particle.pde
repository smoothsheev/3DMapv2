class Particle  extends GameObject {
  
  PVector vel;
  
  
  Particle(float x, float y, float z) {
    super(x, y, z, random(1, 6));
    vel = new PVector (random(-360, 360), random(-360,360), random(-360, 360));
    //vel.rotate(radians(180) + random(-10, 10));
    vel.setMag(random(3,8));
    lives = 255;
  }
  
  void show() {
    world.pushMatrix();
    world.translate(loc.x, loc.y, loc.z);
    world.fill(white, lives);
    world.box(size);
    world.popMatrix();
    lives -= 2;
  }
  
  void act() {
    loc.add(vel);  
  }
  
  
  
}
