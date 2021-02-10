void texturedCube(float x, float y, float z, PImage texture, float size) {
  world.pushMatrix();
  world.translate(x, y, z);
  world.scale(size);


  world.noStroke();

  world.beginShape(QUADS);
  world.texture(texture);

  //top
  // x, y, z, tx, ty
  world.vertex(0, 0, 0, 0, 0);
  world.vertex(1, 0, 0, 1, 0);
  world.vertex(1, 0, 1, 1, 1);
  world.vertex(0, 0, 1, 0, 1);
  //bottom
  world.vertex(0, 1, 0, 0, 0);
  world.vertex(1, 1, 0, 1, 0);
  world.vertex(1, 1, 1, 1, 1);
  world.vertex(0, 1, 1, 0, 1);
  //front
  world.vertex(0, 0, 1, 0, 0);
  world.vertex(1, 0, 1, 1, 0);
  world.vertex(1, 1, 1, 1, 1);
  world.vertex(0, 1, 1, 0, 1);
  //back
  world.vertex(0, 0, 0, 0, 0);
  world.vertex(1, 0, 0, 1, 0);
  world.vertex(1, 1, 0, 1, 1);
  world.vertex(0, 1, 0, 0, 1);
  //left
  world.vertex(0, 0, 0, 0, 0);
  world.vertex(0, 0, 1, 1, 0);
  world.vertex(0, 1, 1, 1, 1);
  world.vertex(0, 1, 0, 0, 1);
  //right
  world.vertex(1, 0, 0, 0, 0);
  world.vertex(1, 0, 1, 1, 0);
  world.vertex(1, 1, 1, 1, 1);
  world.vertex(1, 1, 0, 0, 1);
  world.endShape();

  world.popMatrix();
}

void flatTexture(float x, float y, float z, PImage texture, float size) {
  world.pushMatrix();
  world.translate(x, y, z);
  world.scale(size);


  world.noStroke();

  world.beginShape(QUADS);
  world.texture(texture);

  //top
  // x, y, z, tx, ty
  world.vertex(0, 0, 0, 0, 0);
  world.vertex(1, 0, 0, 1, 0);
  world.vertex(1, 0, 1, 1, 1);
  world.vertex(0, 0, 1, 0, 1);
 
  world.endShape();

  world.popMatrix();
}


void texturedSlab(float x, float y, float z, PImage texture, float size) {

  world.pushMatrix();

  world.translate(x, y, z);
  world.scale(size);


  world.noStroke();

  world.beginShape(QUADS);
  world.texture(texture);

  //top
  // x, y, z, tx, ty

  //bottom
  world.vertex(0, -1, 0, 0, 0);
  world.vertex(5, -1, 0, 1, 0);
  world.vertex(5, -1, 5, 1, 1);
  world.vertex(0, -1, 5, 0, 1);
  //front
  world.vertex(0, 0, 5, 0, 0);
  world.vertex(5, 0, 5, 1, 0);
  world.vertex(5, -1, 5, 1, 1);
  world.vertex(0, -1, 5, 0, 1);
  //back
  world.vertex(0, 0, 0, 0, 0);
  world.vertex(5, 0, 0, 1, 0);
  world.vertex(5, -1, 0, 1, 1);
  world.vertex(0, -1, 0, 0, 1);
  //left
  world.vertex(0, 0, 0, 0, 0);
  world.vertex(0, 0, 5, 1, 0);
  world.vertex(0, -1, 5, 1, 1);
  world.vertex(0, -1, 0, 0, 1);
  //right
  world.vertex(5, 0, 0, 0, 0);
  world.vertex(5, 0, 5, 1, 0);
  world.vertex(5, -1, 5, 1, 1);
  world.vertex(5, -1, 0, 0, 1);
  world.endShape();

  world.popMatrix();
}


void ball(float x, float y, float z, color c, float size) {
  world.pushMatrix();
  world.translate(x, y, z);
  //rotateZ();
  world.fill(c);
  world.noStroke();
  world.strokeWeight(3);
  world.sphere(size); //side length
  world.popMatrix();
}

void button(int x, int y, int w, int h, String label) {
    if (mouseX > x - w/2 && mouseX < x + w/2 && mouseY < y + h/2 && mouseY > y - h/2){
  strokeWeight(5);
  stroke(0);
} else {
  strokeWeight(1);
  stroke(0);
}
  fill(255);
  rect(x, y, w, h);
  fill(0);
  textSize(50);
  textMode(CENTER);
  text(label, x - 70, y + 20);
}

boolean buttonPressed(int x, int y, int w, int h) {
  if (mouseX > x - w/2 && mouseX < x + w/2 && mouseY < y + h/2 && mouseY > y - h/2) 
    return true;
  else 
    return false; 
}


void button(int x, int y, int w, int h, String label, int t, color f, color stroke) {
    if (mouseX > x - w/2 && mouseX < x + w/2 && mouseY < y + h/2 && mouseY > y - h/2){
  strokeWeight(5);
  stroke(stroke);
} else {
  strokeWeight(1);
  stroke(stroke);
}
  fill(255);
  rect(x, y, w, h);
  fill(f);
  textSize(t);
  textMode(CORNER);
  text(label, x - 20, y - 30);
}

void mouseReleased() {
   if (mode == INTRO) {
   introClicks();
 } else if (mode == GAME) {
  
 } else if (mode == PAUSE) {
   pauseClicks();
 } else if (mode == GAMEOVER) {
   gameoverClicks();
 } else {
   println("ERROR! Mode is " + mode);
 }
}
  
  
  
  
  
  
  
  
 
