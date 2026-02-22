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
    text("Page: " + (pageNumber + 1) + " / " + (totalPages + 1), width - 150, height - 150);
    
    
    //----------------------------------------PAGE TEXT---------------------------------------------
    fill(0);
    noStroke();
    textAlign(CENTER);
    textSize(25);
    if (pageNumber == 0) {
      text("ExampleTextPage1", width/6, height/4);
    } else if (pageNumber == 1) {
      text("ExampleTextPage2", width/6, height/4);
    } else if (pageNumber == 2) {
      text("ExampleTextPage3", width/6, height/4);
    } else if (pageNumber == 3) {
      text("ExampleTextPage4", width/6, height/4);
    } else if (pageNumber == 4) {
      text("ExampleTextPage5", width/6, height/4);
    } else if (pageNumber == 5) {
      text("ExampleTextPage6", width/6, height/4);
    }
    
    //-----------------------------------------Animation Playing-------------------------------------
    
    
    
    
    
    //-----------------------------------------Button Drawing-------------------------------------------
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
