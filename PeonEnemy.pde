class PeonEnemy extends GameObjects{
    
    float change_x, change_y;
    float scale;
    float w, h;
    float center_x, center_y;
    float x, y;

    boolean isSolid, isDanger, isMoving;
    
    PImage img; // 

    public PeonEnemy(String filename, float scale, float x, float y){
      img = loadImage("data/peon.png");
      this.scale = scale;
      w = img.width * scale;
      h = img.height * scale;
      center_x = x + width/2;
      center_y = y + height/2;
      change_x = 0;
      change_y = 0;

      this.x = x;
      this.y = y;

      this.isSolid = true;
      this.isDanger = true;
      this.isMoving = false;
    }

    public void display(){
      image(img, x, y, w, h);
    }

    public void move(){
      getSpeed();
    }

    public void setChange_x(float change_x){
      this.change_x = change_x;
    }

    public void setChange_y(float change_y){
      this.change_y = change_y;
    }
  
    //Not implemented
    @Override
    public boolean dangerCheck(){
        return false;
    }
    //Not implemented
    @Override
    public boolean solidCheck(){
        return false;
    }
    
    // If change in any direction is < 0, object is moving
    @Override
    public boolean movingCheck(){
        if((change_x != 0 || change_y != 0)){
        isMoving = true;
        } else {
        isMoving = false;
        }
        return isMoving;
        }
    
    // If an object is moving, will find the change in x and y
    // which is the direction/speed of the object
    // Some weird speed formula
    public float getSpeed(){
    if(change_x != 0 || change_y != 0) {
        return sqrt(change_x * change_x + change_y * change_y);
    } else {
        return 0;
    }
}
}
