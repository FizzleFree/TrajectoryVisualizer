class ExtendableDashboards extends AABB {
  
  float a = 0;
  float xPosOne, xPosTwo;
  boolean isAchievementBoard;

  
  ExtendableDashboards(float X, float Y, float offScreenX, boolean type) {
    x = offScreenX;
    xPosOne = x;
    y = Y;
    xPosTwo = X;
    setSize(400, 350);
    isAchievementBoard = type;
  }
  
  void update() {
    super.update(dt);
    a += 0.05;
    if (isAchievementBoard) {
      if (pAchievementDashboardExtended != achievementDashboardExtended) {
        a = 0;
      }
      if (a > 1) a = 1;
      
      if (achievementDashboardExtended && a < 1) {
        x = lerp(x, xPosTwo, a);
      } else if (!achievementDashboardExtended && a < 1) {
        x = lerp(x, xPosOne, a);
      }
      
      pAchievementDashboardExtended = achievementDashboardExtended;
    } else if (!isAchievementBoard) {
        if (pPlanetDashboardExtended != planetDashboardExtended) {
          a = 0;
        }
        if (a > 1) a = 1;
        
        if (planetDashboardExtended && a < 1) {
          x = lerp(x, xPosTwo, a);
        } else if (!planetDashboardExtended && a < 1) {
          x = lerp(x, xPosOne, a);
        }
        
        pPlanetDashboardExtended = planetDashboardExtended;
      }
    
    
  }
  
  void draw() {
    stroke(0);
    rectMode(CENTER);
    fill(0, 128, 255);
    rect(x, y, 400, 350);
  }
  
}
