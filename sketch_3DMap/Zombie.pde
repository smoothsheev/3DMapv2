class Zombie extends GameObject {
  
Zombie() {
 super(random(1800, -1800), height, random(1800, -1800), 200);
 lives = 1; 
}

 void show() {
   
    ball(loc.x, height - 215, loc.z, white, 40);
    ball(loc.x, height - 150, loc.z, white, 60);
    ball(loc.x, height - 50, loc.z, white, 80);

  
  }
  
  void act( ) {
    
    
  }
  
  
  
  
  
  
  
  
}
