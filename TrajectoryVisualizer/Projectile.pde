class Projectile extends AABB {
  
  float gravityForce;
  float initialHeight;
  float launchVelocity;
  float launchTimer = 0;
  float horizontalVelocity;
  float verticalVelocity;
  float launchAngle;
  float distanceTraveled;
  float maxHeight;
  FloatList prevxPositions;
  FloatList prevyPositions;
  boolean isStopped = false;
  
  
  Projectile(PVector initLocation, float initHeight, float launchSpeed, float gravity, float angle) {
    initialHeight = initHeight;
    launchVelocity = launchSpeed;
    launchAngle = angle;
    gravityForce = gravity;
    this.x = initLocation.x;
    this.y = initLocation.y - initHeight;
    setSize(50, 50);
    prevxPositions = new FloatList();
    prevyPositions = new FloatList();
    velocity.y = sin(launchAngle) * launchVelocity;
    velocity.x = cos(launchAngle) * launchVelocity;
    
  }
  
  void update() {
    launchTimer += dt;
    prevxPositions.append(x);
    prevyPositions.append(y);
    
    if (!isStopped) {
      velocity.x += calcHorizVelocity();
      velocity.y += calcVertVelocity();
    } else {
      velocity = new PVector(0, 0);
    }
    
    //println(sqrt(sq(calcHorizVelocity()) + sq(calcVertVelocity())));
    
    super.update(dt);
  }
  
  void draw() {
    noStroke();
    ellipseMode(CENTER);
    fill(255, 0, 0);
    ellipse(x, y, 50, 50);
    
    
    for (int i = 0; i < prevxPositions.size(); i++) {
      strokeWeight(5);
      stroke(255, 0, 0);
      if (prevxPositions.size() - 1 == i) {
        line(prevxPositions.get(i), prevyPositions.get(i), x, y);
      } else {
        line(prevxPositions.get(i), prevyPositions.get(i), prevxPositions.get(i + 1), prevyPositions.get(i+1));
      }
      
    }
    
  }
  
  
  float calcHorizVelocity() {
    float velocityOutput;
    velocityOutput = cos(launchAngle) * launchVelocity * dt;
    return velocityOutput;
  }
  
  float calcVertVelocity() {
    float velocityOutput;
    //I was wayyy overthinking this trying to follow some of the math for predicting it instead of the math that *does* it lmao
    //positionOutput = initialHeight - (this.x * tan(launchAngle)) + gravityForce * (sq(x)/2*sq(launchVelocity) * sq(cos(launchAngle)));
    //velocityOutput = -initialHeight - (sin(launchAngle) * launchVelocity) * launchTimer + ((gravityForce * launchTimer * launchTimer)/2);
    
    velocityOutput = gravityForce * dt;
    
    return velocityOutput;
  }
  
}
