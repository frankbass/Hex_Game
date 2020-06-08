class ArmyInTransit {
  boolean arrived = false;
  int armySize;
  int player;
  PVector speed = new PVector(.5, .5);
  PVector position = new PVector();
  PVector destination = new PVector();
  float minDist;
  color col;
  int armyIndex;
  int ellipseSize = 30;
  boolean attacking;
  int destIndex;

  ArmyInTransit(int army, int i, int source, int dest, int playerIndex) {
    armySize = army;
    armyIndex = i;
    player = playerIndex;
    destIndex = dest;
    PVector from = new PVector(hexes.get(source).centerX, hexes.get(source).centerY);
    destination = new PVector(hexes.get(dest).centerX, hexes.get(source).centerY);
    //float distance = dist(from.x, from.y, destination.x, destination.y);
    if (from.x > destination.x) {
      speed.x *= -1;
    }
    if (from.y > destination.y) {
      speed.y *= -1;
    }
    //high? or wide?
    minDist = hexes.get(dest).high;
    if (playerIndex == 1) {
      col = color(255, 200, 200);
    }
    if (playerIndex == 2) {
      col = color(200, 255, 200);
    }
    //start postion
    position = from;
    attacking = (hexes.get(source).owner == hexes.get(dest).owner) ? false:true;
  }

  void update() {

    float distance = dist(destination.x, destination.y, position.x, position.y);
    if (distance > minDist) {
      position.add(speed);
    } else {
      arrived = true;
    }
  }
  void show() {

    color col = color(0);

    if (player == 0) {
      col = color(100, 100, 100);
    }
    if (player == 1) {
      col = color(0, 255, 0);
    }
    if (player == 2) {
      col = color (255, 0, 0);
    }

    noStroke();
    ellipseMode(CENTER);
    fill(col);
    textAlign(CENTER, CENTER);
    ellipse(position.x, position.y, ellipseSize, ellipseSize);
    fill(0);
    text(armySize, position.x, position.y);
  }

  void arrival() {
    if (arrived) {
      if (attacking) {
        int defenders = hexes.get(destIndex).armyAmount;
        int attackers = armySize;
        //float chance = random ... there should be some luck, or extra luck if defenders are down to 1 army
        int difference = defenders - attackers;
        hexes.get(destIndex).armyAmount = abs(difference);
        //attackers win
        if (difference < 0) {
          hexes.get(destIndex).owner = player;
        }
      } 
      //transfer
      else {
        hexes.get(destIndex).armyAmount += armySize;
      }
      hexes.remove(armyIndex);
    }
  }
}
