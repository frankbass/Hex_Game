class Hex {
  int index;
  float wide;
  float high;
  float weight;
  float centerX;
  float centerY;
  int armyAmount;
  int growthRate;
  int destination;
  int sourceHex;
  int destHex;
  int attackingArmy;
  color col;
  float x;
  float y;
  ArrayList<Integer> connectedArray = new ArrayList();
  int owner;
  int armyMax;
  float value; //what this hex is worth

  Hex(int i, float xLoc, float yLoc, float w, float h, int o, ArrayList connArray) {
    //x,y values are for left center point of hex
    index = i;
    wide = w;
    high = h;
    x = xLoc;
    y = yLoc;
    weight = 1;
    centerX = x + wide;
    centerY = y;
    armyAmount = 2;
    growthRate = 1;
    owner = o;
    destination = index;
    if (owner == 0) {
      col = color(100, 100, 100);
    } else if (owner == 1) {
      col = color(0, 255, 0);
    } else if (owner == 2) {
      col = color(255, 0, 0);
    }
    connectedArray = connArray;
    armyMax = 50;
    value = armyMax; //+ 1/2 * connArray
  }

  void show() {
    strokeWeight(weight);
    fill(col);
    beginShape();
    vertex(x, y);
    vertex(x + wide / 2, y - high);
    vertex(x + wide / 2 + wide, y - high);
    vertex(x + 2 * wide, y);
    vertex(x + wide / 2 + wide, y + high);
    vertex(x + wide / 2, y + high);
    endShape(CLOSE);

    strokeWeight(1);
    stroke(0);
    fill(0);
    textAlign(CENTER, CENTER);
    textSize(20);
    text(armyAmount, centerX, centerY);
    if (destination != index) {
      stroke(0);
      strokeWeight(1);
      //transport arrow 

      line(centerX, centerY, hexes.get(destination).centerX, hexes.get(destination).centerY);
      if (index == hexes.get(destination).destination) {
        hexes.get(destination).destination = destination;
      }
    }
  }

  void clicked() {
    if (dist(centerX, centerY, mouseX, mouseY) <= high && owner == 1) {
      weight = 2;
      attackingArmy = floor(armyAmount / 2);
      sourceHex = index;
    } else {
      weight = 1;
    }
  }

  void goal() {
    if (dist(centerX, centerY, mouseX, mouseY) <= high) {
      for (int i = 0; i < hexes.get(index).connectedArray.size(); i++) {
        if (hexes.get(index).connectedArray.get(i) == sourceHex) {
          if (owner == hexes.get(sourceHex).owner) {
            //just moving an army
            armyAmount = armyAmount + attackingArmy;
            hexes.get(sourceHex).armyAmount -= attackingArmy;
            hexes.get(sourceHex).destination = index;
          }
          //attacking
          else {
            int difference = armyAmount - attackingArmy;
            //win battle
            if (difference < 0) {
              owner = 1;
              armyAmount = abs(difference);
              colors();
            }
            //defeat
            else {
              armyAmount = armyAmount - attackingArmy;
              hexes.get(sourceHex).armyAmount -= attackingArmy;
            }
          }
        }
      }
    }
  }

  void move() {
    if (destination != index) {
      int movingArmy = int(armyAmount/2);
      armyAmount = armyAmount - movingArmy;
      hexes.get(destination).armyAmount += movingArmy;
    }
  }

  void colors() {
    if (owner == 0) {
      col = color(100, 100, 100);
    } else if (owner == 1) {
      col = color(0, 255, 0);
    } else if (owner == 2) {
      col = color(255, 0, 0);
    }
  }

  void grow() {
    if (owner != 0) {
      armyAmount = armyAmount + growthRate;
    }
    if (armyAmount >= armyMax) {
      armyAmount = armyMax;
    }
  }
}
