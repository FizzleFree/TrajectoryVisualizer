static public class Mouse {
  
  private static boolean[] keys = new boolean[40];
  private static boolean[] pKeys = new boolean[40];
  
  public static final int LEFT = 37;
  public static final int RIGHT = 39;
  public static final int CENTER = 3;
  
  public static void update() {
      // Update the state of all keys in the previous frame to the state in the current frame.
      for(int i = 0; i < keys.length; i++) {
        pKeys[i] = keys[i];
      }
    }
    
    private static void handleKey(int code, boolean isDown){
      if(code < 40) {
      keys[code] = isDown;    
      }
    }
    
    public static boolean isDown(int code){
      return keys[code];
    }
    
    public static boolean onDown(int code){
      return (keys[code] && !pKeys[code]);
    }
    
    public static void handleKeyDown(int code){
      handleKey(code,true);
    }
    
    public static void handleKeyUp(int code){
      handleKey(code, false);
    }
  
}


class MouseObject extends AABB {
  
  PImage cursorImg;
  
  MouseObject() {
    this.x = mouseX;
    this.y = mouseY;
    setSize(15, 15);
    cursorImg = loadImage("Cursor.png");
 
  }
  
  void update() {
    super.update(dt);
    this.x = mouseX;
    this.y = mouseY;
  }
  
  void draw() {
    imageMode(CENTER);
    image(cursorImg, x, y, 15, 15);
    
  }
  
}
