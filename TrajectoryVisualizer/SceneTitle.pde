class SceneTitle {
  
  Button learnButton;
  Button experimentButton;
  
  float projectileDelay = 0.75;
  
  ArrayList<Projectile> projectiles = new ArrayList<Projectile>();
  
  
  SceneTitle() {
    learnButton = new Button(width/3, height - height/4, 250, 150, "Learn");
    experimentButton = new Button(width - width/3, height - height/4, 250, 150, "Experiment");
    
  }
  
  void update() {
    //Updates-------------------------------------------------------------------
    projectileDelay -= dt; 
    learnButton.update();
    experimentButton.update();
    
    if (projectileDelay <= 0) {
      projectileColorSelector = int(random(7));
      projectiles.add(new Projectile(new PVector(0, height), random(height), random(500, 2000), 1000, -random(QUARTER_PI)));
      projectileDelay = random(1.5);
      
      if (projectiles.size() > 10) {
        projectiles.remove(0);
      }
    }
    
    for (Projectile p : projectiles) p.update();
    
    
    //Collisions----------------------------------------------------------------
    if(learnButton.checkOverlap(mouseO)) {
      learnButton.highlighted = true;
      if (Mouse.onDown(Mouse.LEFT)) {
        switchToLearn();
        beep.play();
      }
    }
    
    if(experimentButton.checkOverlap(mouseO)) {
      experimentButton.highlighted = true;
      if (Mouse.onDown(Mouse.LEFT)) {
        switchToExperiment();
        beep.play();
      }
    }
    
    for (Projectile p : projectiles) {
      if(p.checkOverlap(mouseO)) {
        if (Mouse.onDown(Mouse.LEFT)) {
           p.isStopped = true;
        }
    }
      
      
    }
    
    
    
  }
  
  void draw() {
    background(86, 0, 180);
    
    for (Projectile p : projectiles) p.draw();
    
    noStroke();
    fill(0);
    rectMode(CENTER);
    rect(width/2, height/6 - 25, 700, 100);
    textAlign(CENTER);
    textSize(75);
    fill(255);
    text("Trajectory Visualizer", width/2, height/6);
    
    learnButton.draw();
    experimentButton.draw();
    
  }
  
  
}
