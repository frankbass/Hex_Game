class Ai {
  ArrayList<Integer> ownedArray = new ArrayList();
  ArrayList<Integer> attackArray = new ArrayList();
  int sourceHex = 0;
  int destHex = 0;
  int attackingArmy = 0;
  
  Ai() {
    for (Hex i : hexes) {
      if (i.owner == 2) {
        ownedArray.add(i.index);
      }
    }
  }

  void owned() {
    ownedArray.clear();
    for (Hex i : hexes) {
      if (i.owner == 2) {
        //only add unique !!
        //remove lost
        ownedArray.add(i.index);
      }
    }
  }

  void plan() {
    attackArray.clear();
    //which hexes do I own
    for (int i : ownedArray) {
      Hex tempHex = hexes.get(i);
      //what are they connected to
      for (int j : tempHex.connectedArray) {

        //int index = tempHex.connectedArray.get(j); 
        //if I am connected but don't own it, add to attackArray
        if (hexes.get(j).owner != 2) {
          //add unique only!!!

          attackArray.add(j);
        }
      }
    }
    //println(attackArray);
  }

  void attack() {
    int goal = int(random(attackArray.size()));




    //if win... if lose
  }



  void fortify() {
    //if neighbor is != owned && army bigger than mine
  }
}
