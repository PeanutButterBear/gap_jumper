// Abstract class for all game objects
// Checks object type, location, etc
// 
class GameObject implements GameObjects{
    // Location by pixel
    public float center_x, center_y;
    //
    public float change_x, change_y;
    // Width/Height 
    public float w, h;
    
    // Image for object / Sprite
    public String image;
    
    // Visible/Active on Screen maybe
    protected boolean visible;
    protected boolean danger;
    protected boolean solid;

    
    // Specific name like goomba or background cloud
    protected String name;
    // Decide on types later (enemy, deco, item w/e)
    protected String type;

    // Constructor
    public GameObject(String image, float center_x, float center_y,  String name, String type){
        this.image = image;  
        this.center_x = center_x;
        this.center_y = center_y;
       
        this.name = name;
        this.type = type;
        
        this.visible = true;
        
        
    }

    // GET/SET
    
    // By default name is 
    // type + (Placeholder + # of total Placeholders)
    public void setName(String name){
        this.name = name;
    }

    public String getName(){
        return name;
    }

    public String getType(){
        return type;
    }
    
    public void setType(String type){
        this.type = type;
    }

    // X+Y is the center of the created object
    public int getX(){
        return center_x;
    }

    public int getY(){
        return center_y;
    }
    
    public void setX(float x){
      this.center_x = x;
    }
    
    public void setY(float y){
      this.center_y = y;
    }

    // W/H are the width and height of the object
    public float getWidth(){
        return w;
    }

    public float getHeight(){
        return h;
    }
    
    public void setWidth(float width){
      this.w = width;
    }
    
    public void setHeight(float height){
      this.h = height;
    }

    public String getImage(){
        return image;
    }
    
    public String setImage(String image){
      this.image = image;
    }

    public boolean isVisible(){
        return visible;
    }

    public void setVisible(boolean visible){
        this.visible = visible;
    }
    
    public boolean isDanger(){
      return danger;
    }
    
    public void setDanger(boolean danger){
      this.danger = danger;
      
    public boolean isSolid(){
      return solid;
    }
    
    public void setSolid(boolean solid){
      this.solid = solid;
    }
}

    // Should be stationary by default and then report any
    // change values from the move()
    @Override
    public boolean movingCheck(){
        if(change_x != 0 || change_y!= 0){
          return true;
        } else {
          return false;
    }

    // Eventually need spikes/traps like 'hazards' or something
    @Override
    public boolean dangerCheck(){
        return danger;
    }

    // Most things but decorations are solid right
    @Override
    public boolean solidCheck(){
        return false;
    }
    
    // This was the Update method from Sprite
    // Keeping the custom y inversion
    // * Should we combine values somehow and check both at once? *
    public void move(){
        x += change_x;
        y -= change_y; //down is positive direction for y axis in processing so I inverted this as a preference
    }
    }
    
