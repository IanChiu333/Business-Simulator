class Business {
  float money;
  ArrayList<Business> connections = new ArrayList<Business>();
  HashMap<Business,Float> contracts = new HashMap<Business,Float>();
  String name;
  float r = random(0, 256);
  float g = random(0, 256);
  float b = random(0, 256);
  float x = random(0, 1400);
  float y = random(0, 800);
  boolean bankrupt = false;
  public Business(float money, String name) {
    this.money = money;
    this.name = name;
  }

  public void display() {
    if (money > 0) {
      fill(r, g, b);
      circle(x, y, money/10);
      textSize(money/60);
      fill(0);
      text(name, x, y);
    }
  }
  public void resetConnections() {
    connections = new ArrayList<Business>();
    contracts = new HashMap<Business, Float>();
  }
  public void addConnection(Business business) {
    connections.add(business);
    contracts.put(business, random(1,5));
  }

  public void setContracts() {
    for(Business i: contracts.keySet()) {
      contracts.put(i, random(1,5));
    }
  }
  public void getMoney(float money) {
    this.money += money;
  }

  public void payMoney() {
    for (int i=0; i < connections.size(); i++) {
      if (money > 1) {
        float payment = contracts.get(connections.get(i));
        if (connections.get(i).bankrupt == false) {
          connections.get(i).getMoney(payment);
          money -= payment;
        }
        stroke(r,g,b);
        line(x,y,connections.get(i).x,connections.get(i).y);
      }
      else {
        bankrupt = true;
      }
    }
  }
}
