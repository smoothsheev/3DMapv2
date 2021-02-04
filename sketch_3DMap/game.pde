void game() {
  
 world.beginDraw();
  framecount++;
   world.background(0);
  world.textureMode(NORMAL);
   world.pointLight(255, 255, 255, eyex, eyey, eyez);
   world.camera(eyex, eyey, eyez, focusx, focusy, focusz, upx, upy, upz);
  
 
  move();
  drawAxis();
  drawFloor(-2000, 2000, height, gridSize); //floor
  //drawFloor(-2000, 2000, height-gridSize*4, gridSize); //ceiling
  drawInterface();
  drawMap();
  spawn();
   
  int i = 0; 
  int pileCount =0;
  while (i < objects.size()) {
    GameObject obj = objects.get(i);  
    if (obj instanceof Piles) pileCount++;
    obj.show();
    obj.act();
    if (obj.lives == 0) {
      objects.remove(i);
    } else {
      i++;
    }
  }
  
  
  world.endDraw();
  image(world, 0,0);
  
  HUD.beginDraw();
  HUD.clear();
  drawCrosshair();
  drawMinimap();
  HUD.endDraw();
  image(HUD, 0, 0);
  
  if (pausekey == true) {
    mode = PAUSE;
    pausekey = false;
  }
  
  if (health == 0) {
    mode = GAMEOVER;
  }
}
  
  
 
