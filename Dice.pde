import java.util.ArrayList;
import java.util.List;

// Declare a list to hold all the Dice objects.
List<Dice> diceList;
int sum = 0;

void setup() {
  size(400, 400);
  noLoop(); // Stop draw() from looping automatically.

  // Initialize the list in setup().
  diceList = new ArrayList<>();

  // Use nested loops to create and position 16 dice in a 4x4 grid.
  for (int row = 0; row < 4; row++) {
    for (int col = 0; col < 4; col++) {
      // Calculate a unique position for each dice.
      int xPos = 50 + col * 75;
      int yPos = 50 + row * 75;
      diceList.add(new Dice(xPos, yPos));
    }
  }
}

void draw() {
  background(192);
  sum = 0; // Reset sum at the start of each draw cycle.

  // Iterate through the list of dice to draw them and calculate the sum.
  for (Dice dice : diceList) {
    dice.show();
    sum += dice.getRoll(); // Add each die's individual roll to the total sum.
  }
  
  fill(0);
  textSize(20);
  text("Total sum: " + sum, 150, 350);
}

void mousePressed() {
  // When the mouse is clicked, iterate through the list and re-roll each dice.
  for (Dice dice : diceList) {
    dice.rollDice();
  }
  redraw(); // Tell Processing to redraw the screen with the new rolls.
}

class Dice {
  int myX, myY;
  int roll; // Each Dice object now has its own unique roll value.

  Dice(int x, int y) {
    myX = x;
    myY = y;
    rollDice(); // Roll the dice when it's created.
  }

  void rollDice() {
    roll = (int)(Math.random() * 6) + 1;
  }
  
  // Method to get the current roll value, necessary for the sum.
  int getRoll() {
    return roll;
  }

  void show() {
    fill(255);
    rect(myX, myY, 50, 50);
    fill(0);
    
    // Draw logic for the dots (pips) based on the current roll.
    if (roll == 1){
      ellipse (myX + 25, myY + 25, 8, 8);
    }
    if (roll == 2){
      ellipse(myX + 15, myY + 25, 8, 8);
      ellipse(myX + 35, myY + 25, 8, 8);
    }
    if (roll == 3){
      ellipse(myX + 10, myY + 25, 8, 8);
      ellipse(myX + 25, myY + 25, 8, 8);
      ellipse(myX + 40, myY + 25, 8, 8);
    }
    if (roll == 4){
      ellipse(myX + 15, myY + 17, 8, 8);
      ellipse(myX + 35, myY + 17, 8, 8);
      ellipse(myX + 15, myY + 33, 8, 8);
      ellipse(myX + 35, myY + 33, 8, 8);
    }
    if (roll == 5){
      ellipse(myX + 15, myY + 15, 8, 8);
      ellipse(myX + 35, myY + 15, 8, 8);
      ellipse(myX + 25, myY + 25, 8, 8);
      ellipse(myX + 15, myY + 35, 8, 8);
      ellipse(myX + 35, myY + 35, 8, 8);
    }
    if (roll == 6){
      ellipse(myX + 10, myY + 17, 8, 8);
      ellipse(myX + 25, myY + 17, 8, 8);
      ellipse(myX + 40, myY + 17, 8, 8);
      ellipse(myX + 10, myY + 33, 8, 8);
      ellipse(myX + 25, myY + 33, 8, 8);
      ellipse(myX + 40, myY + 33, 8, 8);
    }
  }
}
