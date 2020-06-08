ArrayList<Hex> hexes = new ArrayList();
ArrayList<Bridge> bridges = new ArrayList();
ArrayList<ArmyInTransit> armiesInTransit = new ArrayList();

int clickedIndex;
//ArrayList<Arrow> arrows = new ArrayList();
//int amount = 12;
float wide = 25;
//move "high" into groupOfFour
float high;
color backgroundColor;
int second = 0;
//move into player attack class
int sourceHex = 0;
int destHex = 0;
int attackingArmy = 0;

int playerScore = 0;
int aiScore = 0;
int winState; //0 = game running, -1 = you lose, 1 = you win

boolean pressed = false;

int teams = 2; //0=neutral, 1=human, 2... = AI

Ai ai;

//the attacking mechanic can also be a class?

void setup() {
  surface.setLocation(0, 0);
  size(600, 600);
  textAlign(CENTER);
  backgroundColor = color(200);
  background(backgroundColor);
  high = sqrt(pow(wide, 2) - pow(wide / 2, 2));
  groupOfFour(80, 100, 2);
  groupOfFour(220, 100, 1);
  groupOfFour(150, 200, 0);
  bridges.add(new Bridge());
  ai = new Ai();
  //arrows.add(new Arrow(400, 400));
}

void draw() {
  timer();
  background(backgroundColor);
  for (int i = 0; i < bridges.size(); i ++) {
    bridges.get(i).show();
  }
  for (int i = 0; i < hexes.size(); i++) {
    hexes.get(i).show();
  }

  if (pressed) {
    fill(255, 150);
    ellipse(mouseX, mouseY, 20, 20);
    fill(0);
    text(attackingArmy, mouseX, mouseY);
  }

  fill(255, 0, 0);
  textSize(30);
  text(aiScore, 30, height - 30);
  fill(0, 255, 0);
  text(playerScore, 200, height - 30);
}

//color playerColor(int playerIndex) {
//  color output = color(0);
//  ;
//  if (playerIndex == 0) {
//    output = color(100, 100, 100);
//  }
//  if (playerIndex == 1) {
//    output = color(0, 255, 0);
//  }
//  if (playerIndex == 2) {
//    output = color (255, 0, 0);
//  }
//  return output;
//}
