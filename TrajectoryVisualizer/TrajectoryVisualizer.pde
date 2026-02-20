//Copyright Rylynn Hautala 2026
//This is a Trajectory Visualizer Project


//Scenes:
SceneTitle sceneTitle;
SceneLearn sceneLearn;
SceneExperiment sceneExperiment;


MouseObject mouseO;


float dt, prevTime = 0;
static float gravitationalConstant = 6.6742 * (pow(10, -11));
static float earthRadius = 6371000;
static float earthMassKg = 5.9722 * (pow(10, 24));
float planetRadius = earthRadius;
float planetMassKg = earthMassKg;
float objectMassKg = 1;




void setup() {
  size(1280, 720);
  switchToTitle();
  mouseO = new MouseObject();
  
}


void draw() {
  calcDeltaTime();
  calcGravityForce();
  background(128);
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

float calcGravityForce() {
    float gravityForce = 0;
    gravityForce = gravitationalConstant * objectMassKg * planetMassKg;
    gravityForce /= (planetRadius * planetRadius);
    return gravityForce;
}
