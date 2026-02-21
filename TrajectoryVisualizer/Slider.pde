class Slider extends AABB {
  
  float centerX;
  
  float sliderWidth;
  float sliderHeight;
  float sliderLineWidth;
  float sliderValue;
  String sliderText;
  float sliderMax;
  float sliderPercentage = 0;
  boolean isMoving = false;
  boolean convertToDegrees = false;
  
  boolean highlighted = false;
  
  Slider(float initX, float initY, float initW, float initH, float initLineWidth, float max, String text, boolean ConvertToDegrees) {
    this.x = initX;
    centerX = initX;
    this.y = initY;
    sliderWidth = initW;
    sliderHeight = initH;
    setSize(sliderWidth, sliderHeight);
    sliderLineWidth = initLineWidth;
    sliderMax = max;
    sliderText = text;
    convertToDegrees = ConvertToDegrees;
    
  }
  
  void update() {
    
    if (isMoving) {
      
      x = mouseX;
    
      if (this.x > centerX + sliderLineWidth/2) this.x = centerX + sliderLineWidth/2;
      if (this.x < centerX - sliderLineWidth/2) this.x = centerX - sliderLineWidth/2;
    
    }
    
    sliderPercentage = (this.x - centerX + sliderLineWidth/2) / sliderLineWidth;
    sliderValue = sliderMax * sliderPercentage;
    
    super.update(dt);
    highlighted = false;
    isMoving = false;
    
  }
  
  void draw() {
    
    
    stroke(0);
    strokeWeight(3);
    line(centerX - sliderLineWidth/2, this.y, centerX + sliderLineWidth/2, this.y);
    
    
    rectMode(CENTER);
    if (highlighted) {
      fill(0, 255, 255);
    } else {
      fill(0, 128, 255);
    }
    rect(x, y, sliderWidth, sliderHeight);
    
    
    textAlign(CENTER);
    textSize(20);
    fill(255);
    if (convertToDegrees) {
      text(sliderText + ": " + int(degrees(sliderValue)), centerX, y - 50);
    } else {
      text(sliderText + ": " + int(sliderValue), centerX, y - 50);
    }
    
    
    
  }
  
}
