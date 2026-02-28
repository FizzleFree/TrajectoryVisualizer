class SceneLearn {
  
  ArrayList<Projectile> projectiles = new ArrayList<Projectile>();
  
  ShootableObject lowerGraphLine;
  
  int pageNumber = 0;
  int totalPages = 5;
  float animTimer = 0;
  float animResetPoint = 5;
  
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
    lowerGraphLine = new ShootableObject(new PVector(1046, 539), 467, 5, false, color(0));
    
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
    
    for(Projectile p : projectiles) p.update();
    
    
    
    
    
    
    
    //Button Collisions----------------------------------------------------------------
    if(nextButton.checkOverlap(mouseO) && pageNumber < totalPages && !buttonClicked) {
      nextButton.highlighted = true;
      if (Mouse.onDown(Mouse.LEFT)) {
        pageNumber++;
        buttonClicked = true;
        animTimer = 0;
        projectiles.clear();
      }
    }
    
    if(tryItButton.checkOverlap(mouseO) && pageNumber == totalPages && !buttonClicked) {
      tryItButton.highlighted = true;
      if (Mouse.onDown(Mouse.LEFT)) {
        switchToExperiment();
        buttonClicked = true;
        animTimer = 0;
        projectiles.clear();
      }
    }
    
    if(backButton.checkOverlap(mouseO) && pageNumber > 0 && !buttonClicked) {
      backButton.highlighted = true;
      if (Mouse.onDown(Mouse.LEFT)) {
        pageNumber--;
        buttonClicked = true;
        animTimer = 0;
        projectiles.clear();
      }
    }
    if(exitButton.checkOverlap(mouseO) && !buttonClicked) {
      exitButton.highlighted = true;
      if (Mouse.onDown(Mouse.LEFT)) {
        switchToTitle();
        buttonClicked = true;
        animTimer = 0;
        projectiles.clear();
      }
    }
    
    
    //PageProjectileUpdates-------------------------
    if (pageNumber == 0) {
      if (animTimer == 0) {
        projectiles.clear();
        projectileColorSelector = 0;
        projectiles.add(new Projectile(new PVector(width-width/2.75, height - height/4 - 10), 0, 1000, 1500, -PI/2.5));
      }
    } else if (pageNumber == 1) {
      if (animTimer == 0) {
        projectiles.clear();
        projectileColorSelector = 0;
        projectiles.add(new Projectile(new PVector(width-width/2.75, height - height/4 - 10), 0, 1000, 1500, -PI/2.5));
        projectileColorSelector = 1;
        projectiles.add(new Projectile(new PVector(width-width/2.75, height - height/4 - 10), 0, 750, 1500, -PI/2.5));
        projectileColorSelector = 2;
        projectiles.add(new Projectile(new PVector(width-width/2.75, height - height/4 - 10), 0, 500, 1500, -PI/2.5));
      }
    }
    
    
    if (animTimer > 0.3) {
      for(Projectile p : projectiles) {
        if (p.checkOverlap(lowerGraphLine)) p.isStopped = true;
      }
    }
    
    animTimer += dt;
    
    if (animTimer >= animResetPoint) animTimer = 0;
    
  }
  
  void draw() {
    
    fill(255);
    noStroke();
    textAlign(LEFT);
    textSize(30);
    text("Page: " + (pageNumber + 1) + " / " + (totalPages + 1), width - 150, height - 150);
    
    for (Projectile p : projectiles) p.draw();
    
    
    //-------------------------------------------------------------------------------------------------------------------
    //                                                  PAGE TEXT                                                       |
    //-------------------------------------------------------------------------------------------------------------------
    
    ToTitleText();
    
    if (pageNumber == 0) { //-------------------------------PAGE 1---------------------
    
      //--------Title Text-----------
        text("What is Trajectory?", width/2, height/6);
      
      //----------------------Page Content-----------------------------------------------| use these "|" bars for the text cut off for each line
        ToBodyText();
        text("Trajectory has a couple of ways it is defined, but put simply, trajectory", 60, height/4);
        text("is the path an object follows while moving through space over a period of time.", 20, height/4 + 40);
        text("Basically, whenever an object is moving, the path it passes through is it's", 20, height/4 + 80);
        text("trajectory. This most often refers to throwing an object but also can apply", 20, height/4 + 120);
        text("for orbits of objects. Therefore, some sources define trajectory as the path ", 20, height/4 + 160);
        text("followed by a moving object under the action of gravity. The forces that", 20, height/4 + 200);
        text("impact trajectory include; Initial Velocity, Initial Launch Angle, Initial", 20, height/4 + 240);
        text("Height/Position, and Gravity, which accounts for object mass and the", 20, height/4 + 280);
        text("gravitational pull of the planet the object is being pulled towards.", 20, height/4 + 320);
        text("To predict the horizontal velocity, the equation 'x = velocity * cos(launch angle)'", 50, height/4 + 360);
        text("can be used. However, the equation for the vertical velocity is much more complex:", 20, height/4 + 400);
        text("'y = initial height + x * tan(launch angle) - gravity force * (x^2/2 * velocity^2 * cos^2(launch angle))'", 20, height/4 + 440);
        text("This equation is much more important as it is able to be inputted in a graphing calculator,", 20, height/4 + 480);
        text("allowing you to find the length and max height of the trajectory. Let's break it down!", 20, height/4 + 520);
        
        stroke(2);
        //line(813, 539, 1280, 539);
        line(813, 539, 813, 200);
        noStroke();
        
        if (animTimer >= 1) text("This red line is the trajectory!", width - width/3.5, height/3 - 25);
        
    } else if (pageNumber == 1) { //-------------------------------PAGE 2----------------|
    
      //--------Title Text-----------
        ToTitleText();
        text("Forces of Trajectory: Initial Velocity", width/2, height/6);
      
      //----------------------Page Content-----------
        ToBodyText();
        text("Trajectory's first main influential force is the initial velocity the object", 60, height/4);
        text("is launched at. For example if you throw an object with a lot of force it", 20, height/4 + 40);
        text("flies farther, but if you just lightly release it, the object will not fly far.", 20, height/4 + 80);
        text("The three projectiles shown on the right all have the exact same forces except", 20, height/4 + 120);
        text("for the initial velocity. You can see that the red ball, with the most velocity,", 20, height/4 + 160);
        text("flies further than the green and blue balls, which have less initial velocity.", 20, height/4 + 200);
        text("Shifting focus to math, the inital velocity is integral to predicting the velocity", 60, height/4 + 240);
        text("of the whole arc. As long as you also have the launch angle, you can actually", 20, height/4 + 280);
        text("find the horizontal velocity, which is a key piece of the main equation!", 20, height/4 + 320);
      
      
        stroke(2);
        line(813, 539, 813, 200);
        noStroke();
    } else if (pageNumber == 2) { //-------------------------------PAGE 3-----------------|
    
       //--------Title Text-----------
         ToTitleText();
         text("Forces of Trajectory: Initial Angle", width/2, height/6);
      
       //----------------------Page Content-----------
         ToBodyText();
         text("Trajectory's second main influential force is the initial angle the object", 60, height/4);
         text("is launched at. Generally, throwing an object at an angle closer to 45 degrees", 20, height/4 + 40);
         text("allows the object to make it further in the x axis, but going near 90 allows the", 20, height/4 + 80);
         text("greatest height, while closer to 0 allows the lowest height. The three balls on", 20, height/4 + 120);
         text("the right demonstrate this. The red ball is launched at 70 degrees, the green at", 20, height/4 + 160);
         text("45, and the blue at 20.", 20, height/4 + 200);
         text("In terms of math, the angle is used even more than the initial velocity, and is", 60, height/4 + 240);
         text("important in calculating the horizontal velocity for the rest of the equation,", 20, height/4 + 280);
         text("along with being used for a tangent and cosine aspect in the main equation itself", 20, height/4 + 320);
      
        stroke(2);
        line(813, 539, 813, 200);
        noStroke();
      
      
    } else if (pageNumber == 3) { //-------------------------------PAGE 4-----------------|
    
      //--------Title Text-----------
        ToTitleText();
        text("Forces of Trajectory: Initial Height", width/2, height/6);
      
      //----------------------Page Content-----------
        ToBodyText();
        text("A minor but important third aspect of the trajectory forces is the initial height", 60, height/4);
        text("of the object before being launched. All this does is add it's value to the height", 20, height/4 + 40);
        text("in the equation after everything else is applied, and therefore shifts everything up", 20, height/4 + 80);
        text("by its value. This has no impact on the horizontal velocity but will likely shift", 20, height/4 + 120);
        text("the final distance traveled unless interrupted and will definitely change the max ", 20, height/4 + 160);
        text("height. On the right different max heights are used between the three balls", 20, height/4 + 200);
      
        stroke(2);
        line(813, 539, 813, 200);
        noStroke();
      
      
    } else if (pageNumber == 4) { //-------------------------------PAGE 5-----------------|
    
      //--------Title Text-----------
        ToTitleText();
        text("Forces of Trajectory: Gravity", width/2, height/6);
      
      //----------------------Page Content-----------
        ToBodyText();
        text("The final and most important force in calculating Trajectory is the force of", 60, height/4);
        text("GRAVITY. This force is important because this is the thing constantly changing", 20, height/4 + 40);
        text("every other aspect of the movement causing objects to fall down and not just float", 20, height/4 + 80);
        text("away into the distance. Unfortunately the force of gravity is also the most ", 20, height/4 + 120);
        text("complicated force, as it has to be calculated depending on multiple factors. ", 20, height/4 + 160);
        text("These factors include the mass of the object being launched, the mass of the ", 20, height/4 + 200);
        text("planet the the object is being thrown on, and the size of the planet the ", 20, height/4 + 240);
        text("object is being thrown on, along with those being multiplied by the Newtonian ", 20, height/4 + 280);
        text("constant of gravitation (6.674 * 10^-11)", 20, height/4 + 320);
        text("On the right three differing gravitational forces are being applied on the balls,", 60, height/4 + 360);
        text("including 0.", 20, height/4 + 400);
      
        stroke(2);
        line(813, 539, 813, 200);
        noStroke();
      
      
    } else if (pageNumber == 5) { //-------------------------------PAGE 6-----------------|
    
      //--------Title Text-----------
        ToTitleText();
        text("Gravity Cont.", width/2, height/6);
      
      //----------------------Page Content-----------
        ToBodyText();
        text("ExampleTextPage6", width/6, height/4);
      
      
      
      
    }
    
    lowerGraphLine.draw();
    
    
    
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
  
  void ToTitleText() {
      textAlign(CENTER);
      textSize(60);
      fill(255);
  }
  
  void ToBodyText() {
      fill(255);
      noStroke();
      textAlign(LEFT);
      textSize(23);
  }
  
  
}
