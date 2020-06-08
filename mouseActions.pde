

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
    float x = hexes.get(i).centerX;
    float y = hexes.get(i).centerY;
    if (dist(x, y, mouseX, mouseY) <= high) {
      int destIndex = hexes.get(i).index;
      hexes.get(clickedIndex).depart(destIndex);
    }
    
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
