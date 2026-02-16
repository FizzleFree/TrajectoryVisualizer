class SceneExperiment {
  
  Button exitButton;
  Button launchButton;
  Projectile currentProjectile;
  float launchHeight = 0;
  float launchSpeed = 10;
  float gravityForce = 10;
  float angleOfLaunch = QUARTER_PI;
  PVector launchLocation = new PVector(width/10, height - 150);
  
  SceneExperiment() {
    exitButton = new Button(70, 70, 100, 100, "Exit");
    launchButton = new Button(100, height - 45, 150, 50, "LAUNCH!!");
    
    
  }
  
  void update() {
    //Updates-------------------------------------------------------------------
    exitButton.update();
    launchButton.update();
    if (currentProjectile != null) {
      currentProjectile.update();
    }
    
    
    
    //Collisions----------------------------------------------------------------
    if(exitButton.checkOverlap(mouseO)) {
      exitButton.highlighted = true;
      if (Mouse.onDown(Mouse.LEFT)) {
        switchToTitle();
      }
    }
    if(launchButton.checkOverlap(mouseO)) {
      launchButton.highlighted = true;
      if (Mouse.onDown(Mouse.LEFT)) {
        currentProjectile = new Projectile(launchLocation, launchHeight, launchSpeed, gravityForce, angleOfLaunch);
      }
    }
    
    
  }
  
  void draw() {
    
    exitButton.draw();
    launchButton.draw();
    if (currentProjectile != null) {
      currentProjectile.draw();
    }
  }
  
  
  
}
