class SceneExperiment {
  
  Button exitButton;
  Button launchButton;
  
  ArrayList<Slider> sliders = new ArrayList<Slider>();
  /*
   Array Locations
   launchSpeed = 0
   launchAngle = 1
   launchHeight = 2
   ObjectMass = 3
  */
  
  boolean[] achievements = {false, false, false, false};
  ShootableObject[] targets = new ShootableObject[3];
  
  
  Projectile currentProjectile;
  ShootableObject floor;
  
  
  
  float launchHeight = 0;
  float launchSpeed = 1500;
  float currentGravityForce = 981;
  float angleOfLaunch = -QUARTER_PI;
  PVector launchLocation = new PVector(width/10, height - 200);
  PVector floorLocation = new PVector(width/2, height - 75);
  PVector targetOneLocation = new PVector (width/2, height - 150);
  PVector targetTwoLocation = new PVector (width/1.5, height - 150);
  PVector targetThreeLocation = new PVector (width - 100, height - 150);
  
  SceneExperiment() {
    exitButton = new Button(70, 70, 100, 100, "Exit");
    launchButton = new Button(100, height - 45, 150, 50, "LAUNCH!!");
    //Slider(initX, initY, initW, initH, initLineWidth, max, text, convertToDegrees)
    sliders.add(new Slider(350, 70, 25, 75, 200, 1500, "Velocity", false)); //Launch Speed
    sliders.add(new Slider(600, 70, 25, 75, 200, HALF_PI, "Angle", true)); //launch Angle
    sliders.add(new Slider(850, 70, 25, 75, 200, 300, "Launch Height", false)); //Launch Height
    sliders.add(new Slider(1100, 70, 25, 75, 200, 3, "Object Mass", false)); //Object Mass
    
    floor = new ShootableObject(floorLocation, width, 150, false, color(0, 255, 0));
    targets[0] = new ShootableObject(targetOneLocation, 100, 25, true, color(255, 0, 0));
    targets[1] = new ShootableObject(targetTwoLocation, 100, 25, true, color(255, 0, 0));
    targets[2] = new ShootableObject(targetThreeLocation, 100, 25, true, color(255, 0, 0));
    
  }
  
  void update() {
    //Updates-------------------------------------------------------------------
    exitButton.update();
    launchButton.update();
    
    for (Slider s : sliders) {
      s.update();
    }
    
    floor.update();
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
        // -----------------------------------------------Set Slider Variables and other conditions------------------------------------
        currentGravityForce = (calcGravityForce(sliders.get(3).sliderValue)) * 100;
        currentGravityForce = (calcGravityForce(1)) * 100;
        launchSpeed = sliders.get(0).sliderValue;
        angleOfLaunch = -sliders.get(1).sliderValue;
        launchHeight = sliders.get(2).sliderValue;
        
        currentProjectile = new Projectile(launchLocation, launchHeight, launchSpeed, currentGravityForce, angleOfLaunch);
      }
    }
    if (currentProjectile != null) {
      if (currentProjectile.checkOverlap(floor)) {
        currentProjectile.isStopped = true;
      }
      for (ShootableObject t : targets) {
        if (currentProjectile.checkOverlap(t)) {
          currentProjectile.isStopped = true;
          achievements[0] = true;
          t.wasHit = true;
        }
      }
      
      
      
      
      
    }
    
    for (Slider s : sliders) {
      if(s.checkOverlap(mouseO)) {
        s.highlighted = true;
        
        if(Mouse.isDown(Mouse.LEFT)) {
          s.isMoving = true;
        }
        
      }
    }
    
    
  }
  
  void draw() {
    
    floor.draw();
    
    for (ShootableObject t : targets) {
      t.draw();
    }
    
    
    strokeWeight(4);
    stroke(0);
    line(launchLocation.x, launchLocation.y - sliders.get(2).sliderValue, 100 * cos(-sliders.get(1).sliderValue) + launchLocation.x, 100 * sin(-sliders.get(1).sliderValue) + launchLocation.y - sliders.get(2).sliderValue);
    
    if (currentProjectile != null) {
      currentProjectile.draw();
    }
    
    //-------------------------HUD DRAW-------------------------
    noStroke();
    rectMode(CENTER);
    if (achievements[0] == true) {
      fill(255, 255, 0);
    } else {
      fill(0);
    }
    rect(35, 150, 25, 25, 5);
    textAlign(CENTER);
    textSize(20);
    fill(0);
    text("Hit a Target", 100, 160);
    
    
    exitButton.draw();
    launchButton.draw();
    
    for (Slider s : sliders) {
      s.draw();
    }
    
    
  }    
    
}
  
