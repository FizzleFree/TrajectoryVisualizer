class ShootableObject extends AABB {
  
  boolean isATarget = false;
  float objectWidth, objectHeight;
  color objectColor;
  boolean wasHit = false;
  PImage target;
  
  ShootableObject(PVector initLocation, float initWidth, float initHeight, boolean isTarget, color initColor) {
    this.x = initLocation.x;
    this.y = initLocation.y;
    objectWidth = initWidth;
    objectHeight = initHeight;
    setSize(objectWidth, objectHeight);
    isATarget = isTarget;
    objectColor = initColor;
    target = loadImage("target.png");
  }
  
  void update() {
    super.update(dt);
  }
  
  void draw() {
    fill(objectColor);
    
    
    if (isATarget) {
      image(target, x, y, objectWidth, objectHeight);
    } else {
      rect(x, y, objectWidth, objectHeight);
    }
  }
  
  
}
