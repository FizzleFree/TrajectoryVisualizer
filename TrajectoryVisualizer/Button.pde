class Button extends AABB {
  
  String buttonText;
  float buttonWidth;
  float buttonHeight;
  boolean highlighted = false;
  
  Button(float initX, float initY, float initW, float initH, String initButtonText) {
    this.x = initX;
    this.y = initY;
    setSize(initW, initH);
    buttonWidth = initW;
    buttonHeight = initH;
    buttonText = initButtonText;
    
  }
  
  void update() {
    super.update(dt);
    highlighted = false;
    
  }
  
  void draw() {
    
    noStroke();
    rectMode(CENTER);
    if (highlighted) {
      fill(0, 255, 255);
    } else {
      fill(0, 128, 255);
    }
    rect(x, y, buttonWidth, buttonHeight);
    
    textAlign(CENTER);
    textSize(30);
    fill(255);
    text(buttonText, x, y + 10);
    
  }
  
}
