class SceneExperiment {
  
  Button exitButton;
  Button launchButton;
  Projectile currentProjectile;
  ShootableObject floor;
  ShootableObject target;
  float launchHeight = 0;
  float launchSpeed = 1500;
  float currentGravityForce = 981;
  float angleOfLaunch = -QUARTER_PI;
  PVector launchLocation = new PVector(width/10, height - 150);
  PVector floorLocation = new PVector(width/2, height - 75);
  PVector targetOneLocation = new PVector (width/2, height - 150);
  
  SceneExperiment() {
    exitButton = new Button(70, 70, 100, 100, "Exit");
    launchButton = new Button(100, height - 45, 150, 50, "LAUNCH!!");
    floor = new ShootableObject(floorLocation, width, 150, false, color(0, 255, 0));
    target = new ShootableObject(targetOneLocation, 100, 25, true, color(255, 0, 0));
    
    
  }
  
  void update() {
    //Updates-------------------------------------------------------------------
    exitButton.update();
    launchButton.update();
    floor.update();
    target.update();
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
        currentGravityForce = (calcGravityForce()) * 100;
        currentProjectile = new Projectile(launchLocation, launchHeight, launchSpeed, currentGravityForce, angleOfLaunch);
      }
    }
    if (currentProjectile != null) {
      if (currentProjectile.checkOverlap(floor) && currentProjectile.launchTimer > 0.5) {
        currentProjectile.isStopped = true;
      }
      
      
      
    }
    
    
  }
  
  void draw() {
    
    floor.draw();
    target.draw();
    
    exitButton.draw();
    launchButton.draw();
    
    if (currentProjectile != null) {
      currentProjectile.draw();
    }
  }    
    
}
  
