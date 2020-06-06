void mousePressed() {
  noCursor();
  pressed = true;
  for (int i = 0; i < hexes.size(); i++) {
    hexes.get(i).clicked();
  }
}
//doubleclicked == army stays here

void mouseReleased() {
  cursor();
  pressed = false;
  for (int i = 0; i < hexes.size(); i++) {
    hexes.get(i).goal();
  }
  attackingArmy = 0;
}

void keyPressed() {
  if (keyCode == 32) {
    for (int i = 0; i < hexes.size(); i++) {
      hexes.get(i).destination = i;
    }
  }
}
