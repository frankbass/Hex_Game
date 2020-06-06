class Player {
  int sourceHex = 0;
  int destHex = 0;
  int attackingArmy = 0;

  Player() {
  }

  void attack() {
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
