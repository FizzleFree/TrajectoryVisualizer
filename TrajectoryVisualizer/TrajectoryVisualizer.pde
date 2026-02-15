//Copyright Rylynn Hautala 2026
//This is a Trajectory Visualizer Project


//Scenes:
SceneTitle sceneTitle;
SceneLearn sceneLearn;
SceneExperiment sceneExperiment;


MouseObject mouseO;


float dt, prevTime = 0;


void setup() {
  size(1280, 720);
  switchToTitle();
  mouseO = new MouseObject();
  
}


void draw() {
  calcDeltaTime();
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
  
  Mouse.update();
  mouseO.draw();
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
