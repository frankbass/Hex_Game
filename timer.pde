void timer() {
  if (frameCount % 60 == 0) {
    for (int i = 0; i < hexes.size(); i++) {
      hexes.get(i).grow();
      hexes.get(i).move();
    }
    scoreKeeper();
    ai.owned();
    ai.plan();
    ai.attack();
  }
}

void scoreKeeper() {
  int aiS = 0;
  int plS = 0;
  for (Hex i : hexes) {
    if (i.owner == 1) {
      plS += i.value;
    } else if (i.owner == 2) {
      aiS += i.value;
    }
  }
  playerScore = plS;
  aiScore = aiS;
  if (aiScore == 0) {
    text("YOU WIN!!", 300, 300);
  } else if (playerScore == 0) {
    text("YOU LOSE!", 300, 300);
  }
}
