class SceneLearn {
  
  int pageNumber = 0;
  int totalPages = 5;
  
  boolean buttonClicked = false;
  
  
  Button nextButton;
  Button backButton;
  Button exitButton;
  Button tryItButton;
  
  
  SceneLearn() {
    nextButton = new Button(width - 70, height - 70, 100, 100, "Next");
    backButton = new Button(width - 190, height - 70, 100, 100, "Back");
    exitButton = new Button(70, 70, 100, 100, "Exit");
    tryItButton = new Button(width - 70, height - 70, 100, 100, "Try It!!");
    
  }
  
  void update() {
    //Updates-------------------------------------------------------------------
    buttonClicked = false;
    
    if (pageNumber < totalPages) {
      nextButton.update();
    }
    if (pageNumber == totalPages) {
      tryItButton.update();
    }
    
    if (pageNumber > 0) {
      backButton.update();
    }
    exitButton.update();
    
    
    
    //Collisions----------------------------------------------------------------
    if(nextButton.checkOverlap(mouseO) && pageNumber < totalPages && !buttonClicked) {
      nextButton.highlighted = true;
      if (Mouse.onDown(Mouse.LEFT)) {
        pageNumber++;
        buttonClicked = true;
      }
    }
    
    if(tryItButton.checkOverlap(mouseO) && pageNumber == totalPages && !buttonClicked) {
      tryItButton.highlighted = true;
      if (Mouse.onDown(Mouse.LEFT)) {
        switchToExperiment();
        buttonClicked = true;
      }
    }
    
    if(backButton.checkOverlap(mouseO) && pageNumber > 0 && !buttonClicked) {
      backButton.highlighted = true;
      if (Mouse.onDown(Mouse.LEFT)) {
        pageNumber--;
        buttonClicked = true;
      }
    }
    if(exitButton.checkOverlap(mouseO) && !buttonClicked) {
      exitButton.highlighted = true;
      if (Mouse.onDown(Mouse.LEFT)) {
        switchToTitle();
        buttonClicked = true;
      }
    }
    
  }
  
  void draw() {
    
    fill(255);
    noStroke();
    textAlign(LEFT);
    textSize(30);
    text("Page: " + pageNumber + " / " + totalPages, width - 150, height - 150);
    
    
    
    if (pageNumber < totalPages) {
      nextButton.draw();
    }
    if (pageNumber == totalPages) {
      tryItButton.draw();
    }
    
    if (pageNumber > 0) {
      backButton.draw();
    }
    exitButton.draw();
  }
  
  
}
