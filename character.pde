int ammo = 3;
int shotTimer = 0;
int threshold = 60;
void move() {
  if (akey && canMoveLeft() == true) {
    eyex += cos(leftRightAngle - radians(90))*10;
    eyez += sin(leftRightAngle - radians(90))*10;
  }
  if (dkey && canMoveRight() == true) {
    eyex += cos(leftRightAngle + radians(90))*10;
    eyez += sin(leftRightAngle + radians(90))*10;
  }
  if (wkey && canMoveForward() == true ) {
    eyex += cos(leftRightAngle)*speed;
    eyez += sin(leftRightAngle)*speed;
  }
  if (skey && canMoveBack() == true) {
    eyex -= cos(leftRightAngle)*10;
    eyez -= sin(leftRightAngle)*10;
  }
  shotTimer++;
  if (spacekey && ammo >= 1 && shotTimer > threshold && ammo > 0) {
    objects.add(new Bullet());
    shotTimer = 0;
    ammo--;
  }

  focusx = eyex + cos(leftRightAngle)*300;
  focusy = eyey + tan(upDownAngle)*300;
  focusz = eyez + sin(leftRightAngle)*300;


 if (frameCount < 2) {
  rbt.mouseMove(width/2, height/2);
  mouseX = width/2;
  mouseY = height/2;
}
if (mouseX < 1) {
  rbt.mouseMove(width-2, mouseY);
} else if (mouseX > width-2) {
  rbt.mouseMove(1, mouseY);
} 
leftRightAngle += (mouseX - pmouseX)*0.01;
upDownAngle    += (mouseY - pmouseY)*0.005;
if (upDownAngle > PI/2.5) upDownAngle = PI/2.5;
if (upDownAngle < -PI/2.5) upDownAngle = -PI/2.5;
}

boolean canMoveForward() {
  float fwdx, fwdy, fwdz;
  float leftx, lefty, leftz;
  float rightx, righty, rightz;
  int mapx, mapy, maplx, maply, maprx, mapry;
  fwdx = eyex + cos(leftRightAngle)*200;
  fwdy = eyey;
  fwdz = eyez + sin(leftRightAngle)*200;
  leftx = eyex + cos(leftRightAngle+radians(30))*200;
  leftz = eyez + sin(leftRightAngle+radians(30))*200;
  rightx = eyex + cos(leftRightAngle-radians(30))*200;
  rightz = eyex + sin(leftRightAngle-radians(30))*200;

  mapx = int(fwdx + 2000) / gridSize;
  mapy = int(fwdz + 2000) / gridSize;
  maplx = int(leftx + 2000) / gridSize;
  maply = int(leftz + 2000) / gridSize;
  maprx = int(rightx + 2000) / gridSize;
  mapry = int(rightz + 2000) / gridSize;
  if (map.get(mapx, mapy) == white && map.get(maplx, maply) == white && map.get(maprx, mapry) == white) {
    return true;
  } else {
    return false;
  }
}

boolean canMoveRight() {
  float rightx, rightz, rfx, rbx, rbz, rfz;
  rightz = eyez + sin(leftRightAngle+radians(90))*200;
  rightx = eyex + cos(leftRightAngle+radians(90))*200;
  rfx = eyex + cos(leftRightAngle+radians(70))*200;
  rbx = eyex + cos(leftRightAngle+radians(110))*200;
  rfz = eyex + sin(leftRightAngle+radians(70))*200;
  rbz = eyex + sin(leftRightAngle+radians(110))*200;
  int mapx, mapy, mapbx, mapby, mapfx, mapfy;
  mapx = int(rightx + 2000) / gridSize;
  mapy = int(rightz + 2000) / gridSize;
  mapfx = int(rfx + 2000) / gridSize;
  mapfy = int(rfz + 2000) / gridSize;
  mapbx = int(rbx + 2000) / gridSize;
  mapby = int(rbz + 2000) / gridSize;
  if (map.get(mapx, mapy) == white && map.get(mapfx, mapfy) == white && map.get(mapbx, mapby) == white) {
    return true;
  } else {
    return false;
  }
}

boolean canMoveLeft() {
  float leftx, leftz, lfx, lfz, lbx, lbz;
  leftx = eyex + cos(leftRightAngle-radians(90))*200;
  leftz = eyez + sin(leftRightAngle-radians(90))*200;
  lfx = eyex + cos(leftRightAngle-radians(70))*200;
  lbx = eyex + cos(leftRightAngle-radians(110))*200;
  lfz = eyex + sin(leftRightAngle-radians(70))*200;
  lbz = eyex + sin(leftRightAngle-radians(110))*200;
  int mapx, mapy, mapbx, mapby, mapfx, mapfy;
  mapx = int(leftx + 2000) / gridSize;
  mapy = int(leftz + 2000) / gridSize;
  mapfx = int(lfx + 2000) / gridSize;
  mapfy = int(lfz + 2000) / gridSize;
  mapbx = int(lbx + 2000) / gridSize;
  mapby = int(lbz + 2000) / gridSize;
 if (map.get(mapx, mapy) == white && map.get(mapfx, mapfy) == white && map.get(mapbx, mapby) == white) {
    return true;
  } else {
    return false;
  }
}

boolean canMoveBack() {
  float backx, backz;
  backx = eyex + cos(leftRightAngle-radians(180))*200;
  backz = eyez + sin(leftRightAngle-radians(180))*200;
  int mapx, mapy;
  mapx = int(backx + 2000) / gridSize;
  mapy = int(backz + 2000) / gridSize;
  if (map.get(mapx, mapy) == white) {
    return true;
  } else {
    return false;
  }
}
