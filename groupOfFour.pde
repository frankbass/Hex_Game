void groupOfFour(int x, int y, int owner) {
  int indexOffset = hexes.size();
  int a = indexOffset;
  int b = indexOffset + 1;
  int c = indexOffset + 2;
  int d = indexOffset + 3;

  ArrayList<Integer> connectionsA = new ArrayList(); 
  ArrayList<Integer> connectionsB = new ArrayList(); 
  ArrayList<Integer> connectionsC = new ArrayList(); 
  ArrayList<Integer> connectionsD = new ArrayList(); 

  connectionsA.add(a);
  connectionsA.add(c);
  connectionsA.add(d);
  hexes.add(new Hex(a, x, y, wide, high, owner, connectionsA));

  connectionsB.add(b);
  connectionsB.add(c);
  connectionsB.add(d);
  hexes.add(new Hex(b, x + (wide * 3), y, wide, high, owner, connectionsB));

  connectionsC.add(a);
  connectionsC.add(b);
  connectionsC.add(c);
  connectionsC.add(d);
  hexes.add(new Hex(c, x + wide + wide / 2, y + high, wide, high, owner, connectionsC));

  connectionsD.add(a);
  connectionsD.add(b);
  connectionsD.add(c);
  connectionsD.add(d);
  hexes.add(new Hex(d, x + wide + wide / 2, y - high, wide, high, owner, connectionsD));
}
