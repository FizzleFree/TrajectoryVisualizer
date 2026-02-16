class SceneLearn {
  
  Button nextButton;
  Button backButton;
  Button exitButton;
  
  
  SceneLearn() {
    nextButton = new Button(width - 70, height - 70, 100, 100, "Next");
    backButton = new Button(width - 190, height - 70, 100, 100, "Back");
    exitButton = new Button(70, 70, 100, 100, "Exit");
    
  }
  
  void update() {
    //Updates-------------------------------------------------------------------
    nextButton.update();
    backButton.update();
    exitButton.update();
    
    
    
    //Collisions----------------------------------------------------------------
    if(nextButton.checkOverlap(mouseO)) {
      nextButton.highlighted = true;
      if (Mouse.onDown(Mouse.LEFT)) {
        
      }
    }
    
    if(backButton.checkOverlap(mouseO)) {
      backButton.highlighted = true;
      if (Mouse.onDown(Mouse.LEFT)) {
        
      }
    }
    if(exitButton.checkOverlap(mouseO)) {
      exitButton.highlighted = true;
      if (Mouse.onDown(Mouse.LEFT)) {
        switchToTitle();
      }
    }
    
  }
  
  void draw() {
    
    
    
    
    nextButton.draw();
    backButton.draw();
    exitButton.draw();
  }
  
  
}
