void intro() {
 
  rectMode(CENTER);
  background(180);
  
  if (mouseX > 200 && mouseX < 400 && mouseY < 650 && mouseY > 550){
  strokeWeight(5);
  stroke(0);
} else {
  strokeWeight(1);
  stroke(0);
}
//drawing button
button(250, 600, 200, 100, "START");
button(550, 600, 200, 100, "QUIT");
  //pointer
  ellipse(mouseX,  mouseY, 10, 10);
  
}

void introClicks() {
  if (buttonPressed(250, 600, 200, 100)) {
   mode = GAME; 
  }
  if (buttonPressed(550, 600, 200, 100)) {
   exit();
  }  
}
