class Projectile extends AABB {
  
  float gravityForce = -9.8;
  float initialHeight;
  float launchVelocity;
  float launchTimer = 0;
  float horizontalVelocity;
  float verticalVelocity;
  float launchAngle;
  float distanceTraveled;
  float maxHeight;
  
  
  Projectile(float initHeight, float launchSpeed, float gravity, float angle) {
    initialHeight = initHeight;
    launchVelocity = launchSpeed;
    launchAngle = angle;
    gravityForce = gravity;
    
    
  }
  
  
  
  
  float calcHorizVelocity() {
    float velocityOutput = 0;
    
    
    
    return velocityOutput;
  }
  
}
