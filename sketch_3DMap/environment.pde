void drawMap() {
  for (int x = 0; x <map.width; x++) {
    for (int y = 0; y < map.height; y++) {
      color c = map.get(x, y);
      if (c == dullBlue || c == black) {
        texturedCube(x*gridSize-2000, height-gridSize, y*gridSize-2000, mossyStone, gridSize);
        texturedCube(x*gridSize-2000, height-(gridSize*2), y*gridSize-2000, mossyStone, gridSize);
        texturedCube(x*gridSize-2000, height-(gridSize *3), y*gridSize-2000, mossyStone, gridSize);
      }
    }
  }
}

void drawInterface() {
  world.pushMatrix();
   world.stroke(255, 0, 0);
   world.strokeWeight(0);
   world.line(width/2-15, height/2, width/2+15, height/2);
   world.line(width/2, height/2-15, width/2, height/2+15);
   world.popMatrix();
}


void drawAxis() {
   world.stroke(255, 0, 0);
   world.strokeWeight(5);
   world.line(0, 0, 0, 0, 0, 2000);
   world.line(0, 0, 0, 0, 2000, 0);
   world.line(0, 0, 0, 2000, 0, 0);
   world.noFill();
   world.rect(0, 0, width, height);
}

void drawFloor(int start, int end, int level, int gap) {
   world.stroke(255);
   world.strokeWeight(1);
  int x = start;
  int z = start;
  while (z < end) {
    flatTexture(x, level, z, oakPlanks, gap);
    x = x + gap;
    if (x >= end) {
      x = start;
      z = z + gap;
    }
  }
}

void spawn() {
  //spawn snow
  if (framecount % 3  == 0) {
   objects.add(new Snow(random(-2000, 2000), -height*2, random(-2000, 2000))); 
  }
  //spawn snowmen
  snowmanSpawnTimer++;
  if (snowmanSpawnTimer > snowmanSpawnThreshold) {
  objects.add(new Zombie());  
  }  
}
