void pause() {
  background(180);
  textMode(CENTER);
  textSize(30);
  text("Press p to Unpause or q to quit", width/2, height/2); 
  if (pausekey == true) {
   mode = GAME;
   pausekey = false;
  }
  if (quitkey == true) {
   mode = INTRO; 
      setup();
   quitkey = false;
  }
}

void pauseClicks() {
    if (buttonPressed(400, 400, 400, 150)) {
      mode = GAME;
    }
}
