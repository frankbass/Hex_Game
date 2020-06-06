
class Bridge {
  float x1, y1, x2, y2, x3, y3, x4, y4;
  Bridge() {
    x1 = hexes.get(1).centerX;
    y1 = hexes.get(1).centerY;
    x2 = hexes.get(4).centerX;
    y2 = hexes.get(4).centerY;
    x3 = hexes.get(11).centerX;
    y3 = hexes.get(11).centerY;

    //index 1 = right, 4 = left, 11 = top

    hexes.get(1).connectedArray.add(4);
    hexes.get(1).connectedArray.add(11);
    hexes.get(4).connectedArray.add(1);
    hexes.get(4).connectedArray.add(11);
    hexes.get(11).connectedArray.add(4);
    hexes.get(11).connectedArray.add(1);
  }
  void show() {
    stroke(0);
    strokeWeight(4);
    line(x1, y1, x2, y2);
    line(x1, y1, x3, y3);
    line(x2, y2, x3, y3);
  }
}
