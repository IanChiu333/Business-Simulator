//Business business1 = new Business(100, "Starbucks");
//Business business2 = new Business(50, "Peet's Coffee");
String[] businessNames = new String[]{"Target", "Safeway", "In and Out", "Barnes and Nobles", "McDonalds", "Burger King", "Whole Foods", "Amazon", "Apple", "Microsoft", "Steam", "Zoom", "Spotify", "Google", "Bose"};
ArrayList<Business> businesses = new ArrayList<Business>();
int timer;

void setup() {
  size(1400,800);
  textAlign(CENTER, CENTER);
  //business1.addConnection(business2);
  for (int i=0; i < businessNames.length; i++) {
    businesses.add(new Business(random(0, 1500), businessNames[i]));
  }
  setConnections();
  timer = 0;
}

void draw() {
  background(255);
  //business1.display();
  //business2.display();
  //business1.payMoney();
  for (int i=0; i < businesses.size(); i++) {
    businesses.get(i).display();
    businesses.get(i).payMoney();
  }
  timer++;
  if (timer > 600) {
    setConnections();
    timer = 0;
  }
  if (cleanArray() == true) {
    setConnections();
  }
}

public void setConnections() {
  for (int i=0; i < businesses.size(); i++) {
    businesses.get(i).resetConnections();
    int r = (int)(random(0,businesses.size()));
    for (int j=0; j < r; j++) {
      businesses.get(i).addConnection(businesses.get((int)(random(0,businesses.size()))));
    }
  }
}

public boolean cleanArray() {
  for (int i=0; i < businesses.size(); i++) {
    if (businesses.get(i).bankrupt == true) {
      businesses.remove(i);
      return(true);
    }
  }
  return(false);
}
//1) list out a bunch of business names in a String array
//2) create an array of Business Objects
//3) populate the array by creating Business objects with each string in the array
//4) give each Business a random amount of money
//5) randomly add connections to each business object in the array
//6) in the draw function display each business and have them payMoney
