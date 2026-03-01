class SceneLearn {

  ArrayList<Projectile> projectiles = new ArrayList<Projectile>();

  PImage trajectoryEquation;
  PImage gravityEquation;

  ShootableObject lowerGraphLine;

  int pageNumber = 0;
  int totalPages = 6;
  float animTimer = 0;
  float animResetPoint = 5;

  boolean buttonClicked = false;
  boolean autoAnimate = false;
  boolean animPlaying = false;


  Button nextButton;
  Button backButton;
  Button exitButton;
  Button tryItButton;
  Button playAnimButton;
  Button autoPlayButton;


  SceneLearn() {
    nextButton = new Button(width - 70, height - 70, 100, 100, "Next");
    backButton = new Button(width - 190, height - 70, 100, 100, "Back");
    exitButton = new Button(70, 70, 100, 100, "Exit");
    tryItButton = new Button(width - 70, height - 70, 100, 100, "Try It!!");
    playAnimButton = new Button(width - 450, height - 70, 100, 100, "Play");
    autoPlayButton = new Button(width - 320, height - 70, 120, 100, "AutoPlay");
    lowerGraphLine = new ShootableObject(new PVector(1046, 539), 467, 10, false, color(0));
    trajectoryEquation = loadImage("trajectoryequation.png");
    gravityEquation = loadImage("gravityequation.png");
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

    if (pageNumber != 1 && pageNumber != 5) {
      playAnimButton.update();
      autoPlayButton.update();
    }

    for (Projectile p : projectiles) p.update();







    //Button Collisions----------------------------------------------------------------
    if (nextButton.checkOverlap(mouseO) && pageNumber < totalPages && !buttonClicked) {
      nextButton.highlighted = true;
      if (Mouse.onDown(Mouse.LEFT)) {
        pageNumber++;
        buttonClicked = true;
        animTimer = 0;
        projectiles.clear();
      }
    }

    if (tryItButton.checkOverlap(mouseO) && pageNumber == totalPages && !buttonClicked) {
      tryItButton.highlighted = true;
      if (Mouse.onDown(Mouse.LEFT)) {
        switchToExperiment();
        buttonClicked = true;
        animTimer = 0;
        projectiles.clear();
      }
    }

    if (backButton.checkOverlap(mouseO) && pageNumber > 0 && !buttonClicked) {
      backButton.highlighted = true;
      if (Mouse.onDown(Mouse.LEFT)) {
        pageNumber--;
        buttonClicked = true;
        animTimer = 0;
        projectiles.clear();
      }
    }
    if (exitButton.checkOverlap(mouseO) && !buttonClicked) {
      exitButton.highlighted = true;
      if (Mouse.onDown(Mouse.LEFT)) {
        switchToTitle();
        buttonClicked = true;
        animTimer = 0;
        projectiles.clear();
      }
    }
    if (playAnimButton.checkOverlap(mouseO) && !buttonClicked) {
      playAnimButton.highlighted = true;
      if (Mouse.onDown(Mouse.LEFT)) {
        buttonClicked = true;
        animTimer = 0;
        if (pageNumber == 0) {
          ProjectilesBasic();
        } else if (pageNumber == 2) {
          ProjectilesVelocity();
        } else if (pageNumber == 3) {
          ProjectilesAngles();
        } else if (pageNumber == 4) {
          ProjectilesInitialHeight();
        } else if (pageNumber == 6) {
          ProjectilesGravity();
        }
        animPlaying = true;
        autoAnimate = false;
      }
    }
    if (autoPlayButton.checkOverlap(mouseO) && !buttonClicked) {
      autoPlayButton.highlighted = true;
      if (Mouse.onDown(Mouse.LEFT)) {
        if (autoAnimate) {
          autoAnimate = false;
        } else {
          autoAnimate = true;
          animPlaying = true;
        }
        buttonClicked = true;
        animTimer = 0;
      }
    }


    //PageProjectileUpdates-------------------------
    if (autoAnimate) {
      if (pageNumber == 0) {
        if (animTimer == 0) ProjectilesBasic();
      } else if (pageNumber == 2) {
        if (animTimer == 0) ProjectilesVelocity();
      } else if (pageNumber == 3) {
        if (animTimer == 0) ProjectilesAngles();
      } else if (pageNumber == 4) {
        if (animTimer == 0) ProjectilesInitialHeight();
      } else if (pageNumber == 6) {
        if (animTimer == 0) ProjectilesGravity();
      }
    }

    if (animTimer > 0.25) {
      for (Projectile p : projectiles) {
        if (p.checkOverlap(lowerGraphLine)) p.isStopped = true;
      }
    }

    if (animPlaying) animTimer += dt;

    if (animTimer >= animResetPoint && autoAnimate == true) animTimer = 0;
  }

  void draw() {

    background(86, 0, 180);

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


      if (animTimer >= 1) text("This red line is the trajectory!", width - width/3.5, height/3 - 25);
    } else if (pageNumber == 1) { //-------------------------------PAGE 2----------------|

      //--------Title Text-----------
      ToTitleText();
      text("What is Trajectory? Cont.", width/2, height/6);

      //----------------------Page Content-----------
      ToBodyText();
      text("To predict the horizontal velocity, the equation 'x = velocity * cos(launch angle)'", width/6 + 40, height/4);
      text("can be used. However, the equation for the vertical velocity is much more complex:", width/6, height/4 + 40);
      text("'y = initial height + x * tan(launch angle) - gravity force * (x^2/2 * velocity^2 * cos^2(launch angle))'", width/6, height/4 + 80);
      text("This equation is much more important as it is able to be inputted in a graphing calculator,", width/6, height/4 + 120);
      text("allowing you to find the distance and max height of the trajectory. Let's break it down!", width/6, height/4 + 160);

      imageMode(CENTER);
      image(trajectoryEquation, width/2, height - height/4, width/2, height/2);
      fill(0);
      textSize(15);
      text("Source: omnicalculator.com", width/2 + 145, height - 5);
    } else if (pageNumber == 2) { //-------------------------------PAGE 3-----------------|

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
    } else if (pageNumber == 3) { //-------------------------------PAGE 4-----------------|

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
    } else if (pageNumber == 4) { //-------------------------------PAGE 5-----------------|

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
    } else if (pageNumber == 5) { //-------------------------------PAGE 6-----------------|

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
      text("planet the the object is being thrown on, the distance between the center of ", 20, height/4 + 240);
      text("mass of both the object and planet, along with those being multiplied by the", 20, height/4 + 280);
      text("Newtonian constant of gravitation (6.674 * 10^-11)", 20, height/4 + 320);

      imageMode(CENTER);
      image(gravityEquation, width - width/6, height/2, width/3, height/3);
    } else if (pageNumber == 6) { //-------------------------------PAGE 7-----------------|

      //--------Title Text-----------
      ToTitleText();
      text("Gravity Cont.", width/2, height/6);

      //----------------------Page Content-----------
      ToBodyText();
      text("Notably, when handling gravity, if the value becomes zero, the graph becomes", 60, height/4);
      text("linear, as the gravity no longer changes the vertical velocity. Now this scenario", 20, height/4 + 40);
      text("is not something that will be encountered in regular life, although very close", 20, height/4 + 80);
      text("situations may be found in environments like space. What this teaches us however", 20, height/4 + 120);
      text("is that lower values in this calculation leads to a weaker pull of gravity and", 20, height/4 + 160);
      text("a flatter trajectory, while a greater value creates a sharper, heavily curved", 20, height/4 + 200);
      text("trajectory", 20, height/4 + 240);
      text("On the right three differing gravitational forces are being applied on the balls,", 60, height/4 + 280);
      text("including a value very close to 0.", 20, height/4 + 320);
    }


    //Draw Borders for visualization
    if (pageNumber != 1 && pageNumber != 5) {
      lowerGraphLine.draw();
      stroke(10);
      line(813, 539, 813, 160);
      noStroke();
    }



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
    
    if (pageNumber != 1 && pageNumber != 5) {
      autoPlayButton.draw();
      playAnimButton.draw();
    }
    
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

  void ProjectilesBasic() {
    projectiles.clear();
    projectileColorSelector = 0;
    projectiles.add(new Projectile(new PVector(width-width/2.75, height - height/4 - 10), 0, 1000, 1500, -PI/2.5));
  }

  void ProjectilesVelocity() {
    projectiles.clear();
    projectileColorSelector = 0;
    projectiles.add(new Projectile(new PVector(width-width/2.75, height - height/4 - 10), 0, 1000, 1500, -PI/2.5));
    projectileColorSelector = 1;
    projectiles.add(new Projectile(new PVector(width-width/2.75, height - height/4 - 10), 0, 750, 1500, -PI/2.5));
    projectileColorSelector = 2;
    projectiles.add(new Projectile(new PVector(width-width/2.75, height - height/4 - 10), 0, 500, 1500, -PI/2.5));
  }

  void ProjectilesAngles() {
    projectiles.clear();
    projectileColorSelector = 0;
    projectiles.add(new Projectile(new PVector(width-width/2.75, height - height/4 - 10), 0, 750, 1500, -radians(70)));
    projectileColorSelector = 1;
    projectiles.add(new Projectile(new PVector(width-width/2.75, height - height/4 - 10), 0, 750, 1500, -QUARTER_PI));
    projectileColorSelector = 2;
    projectiles.add(new Projectile(new PVector(width-width/2.75, height - height/4 - 10), 0, 750, 1500, -radians(20)));
  }

  void ProjectilesInitialHeight() {
    projectiles.clear();
    projectileColorSelector = 0;
    projectiles.add(new Projectile(new PVector(width-width/2.75, height - height/4 - 10), 0, 500, 1500, -QUARTER_PI));
    projectileColorSelector = 1;
    projectiles.add(new Projectile(new PVector(width-width/2.75, height - height/4 - 10), 100, 500, 1500, -QUARTER_PI));
    projectileColorSelector = 2;
    projectiles.add(new Projectile(new PVector(width-width/2.75, height - height/4 - 10), 200, 500, 1500, -QUARTER_PI));
  }

  void ProjectilesGravity() {
    projectiles.clear();
    projectileColorSelector = 0;
    projectiles.add(new Projectile(new PVector(width-width/2.75, height - height/4 - 10), 0, 750, 0, -QUARTER_PI));
    projectileColorSelector = 1;
    projectiles.add(new Projectile(new PVector(width-width/2.75, height - height/4 - 10), 0, 750, 1500, -QUARTER_PI));
    projectileColorSelector = 2;
    projectiles.add(new Projectile(new PVector(width-width/2.75, height - height/4 - 10), 0, 750, 3000, -QUARTER_PI));
  }
}
