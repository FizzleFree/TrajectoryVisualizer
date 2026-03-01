class SceneTitle {
  
  Button learnButton;
  Button experimentButton;
  
  
  
  SceneTitle() {
    learnButton = new Button(width/3, height - height/4, 250, 150, "Learn");
    experimentButton = new Button(width - width/3, height - height/4, 250, 150, "Experiment");
    
  }
  
  void update() {
    //Updates-------------------------------------------------------------------
    learnButton.update();
    experimentButton.update();
    
    
    
    //Collisions----------------------------------------------------------------
    if(learnButton.checkOverlap(mouseO)) {
      learnButton.highlighted = true;
      if (Mouse.onDown(Mouse.LEFT)) {
        switchToLearn();
      }
    }
    
    if(experimentButton.checkOverlap(mouseO)) {
      experimentButton.highlighted = true;
      if (Mouse.onDown(Mouse.LEFT)) {
        switchToExperiment();
      }
    }
    
    
    
  }
  
  void draw() {
    background(86, 0, 180);
    
    textAlign(CENTER);
    textSize(75);
    fill(255);
    text("Trajectory Visualizer", width/2, height/6);
    
    learnButton.draw();
    experimentButton.draw();
    
  }
  
  
}
