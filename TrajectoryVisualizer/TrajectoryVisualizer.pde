//Copyright Rylynn Hautala 2026
//SFX and Music by Danny Pellerito
//This is a Trajectory Visualizer Project


import processing.sound.*;

//Scenes:
SceneTitle sceneTitle;
SceneLearn sceneLearn;
SceneExperiment sceneExperiment;


MouseObject mouseO;


float dt, prevTime = 0;
static float gravitationalConstant = 6.6742 * (pow(10, -11));
static float earthRadius = 6371000;
static float earthMassKg = 5.9722 * (pow(10, 24));
static float moonRadius = 1737400;
static float moonMassKg = 7.346 * (pow(10, 22));
static float marsRadius = 3389500;
static float marsMassKg = 6.41693 * (pow(10, 23));

SoundFile beep;
SoundFile music;
SoundFile woosh;


float planetRadius = earthRadius;
float planetMassKg = earthMassKg;
float objectMassKg = 1;
int projectileColorSelector = 0;

boolean achievementDashboardExtended = false;
boolean pAchievementDashboardExtended = false;

boolean planetDashboardExtended = false;
boolean pPlanetDashboardExtended = false;

void setup() {
  size(1280, 720);
  switchToTitle();
  mouseO = new MouseObject();
  beep = new SoundFile(this, "beep.wav");
  music = new SoundFile(this, "lofi.wav");
  woosh = new SoundFile(this, "woosh.wav");
  music.loop();
}


void draw() {
  calcDeltaTime();
  noStroke();
  noCursor();
  
  
  
  if(sceneTitle != null) {
    sceneTitle.update();
    if(sceneTitle != null) sceneTitle.draw();
  }
  else if(sceneLearn != null) {
    sceneLearn.update();
    if(sceneLearn != null) sceneLearn.draw();
  }
  else if(sceneExperiment != null) {
    sceneExperiment.update();
    if(sceneExperiment != null) sceneExperiment.draw();
  }
  
  mouseO.update();
  mouseO.draw();
  
  Mouse.update();
}


//----------------Mouse-------------------
void mousePressed() {
  Mouse.handleKeyDown(mouseButton);
}

void mouseReleased() {
  Mouse.handleKeyUp(mouseButton);
}



//----------------SCENES------------------
void switchToTitle(){
  sceneTitle = new SceneTitle();
  sceneLearn = null;
  sceneExperiment = null;
}
void switchToLearn(){
  sceneLearn = new SceneLearn();
  sceneTitle = null;
  sceneExperiment = null;
}
void switchToExperiment(){
  sceneExperiment = new SceneExperiment();
  sceneLearn = null;
  sceneTitle = null;
}

//------------------DELTATIME--------------

void calcDeltaTime() {
  float currTime = millis();
  dt = (currTime - prevTime) / 1000.0;
  prevTime = currTime;
}

//------------------GRAVITYFORCE-----------

float calcGravityForce(float objectMass) {
    float gravityForce = 0;
    objectMassKg = objectMass;
    gravityForce = gravitationalConstant * objectMassKg * planetMassKg;
    gravityForce /= (planetRadius * planetRadius);
    return gravityForce;
}
