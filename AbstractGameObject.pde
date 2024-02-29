// Abstract class for all game objects
// Checks object type, location, etc
// 
abstract class GameObject implements GameObjects{
    // Location by pixel
    protected int x, y;
    // Width/Height 
    protected int w, h;
    
    // Image for object / Sprite
    protected String image;
    // Visible/Active on Screen maybe
    protected boolean visible;

    
    // Specific name like goomba or background cloud
    protected String name;
    // Decide on types later (enemy, deco, item w/e)
    protected String type;

    // Constructor
    public GameObject(int x, int y, String image, String name, String type){
        this.x = x;
        this.y = y;
        this.image = image;
        this.visible = true;
        this.name = name;
        this.type = type;
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
        return type;
    }

    // X+Y is the center of the created object
    public int getX(){
        return x;
    }

    public int getY(){
        return y;
    }

    // W/H are the width and height of the object
    public int getWidth(){
        return w;
    }

    public int getHeight(){
        return h;
    }

    public String getImage(){
        return image;
    }

    public boolean isVisible(){
        return visible;
    }

      public void setVisible(boolean visible){
        this.visible = visible;
    }
}

    // Should be stationary by default and then report any
    // change values from the move()
    @Override
    public boolean movingCheck(){
        return change_x != 0 || change_y!= 0;
    }

    // Eventually need spikes/traps like 'hazards' or something
    @Override
    public boolean dangerCheck(){
        return false;
    }

    // Most things but decorations are solid right
    @Override
    public boolean isSolid(){
        if(this.type.equals("deco")){
            return false;
        } else {
            return true;
        }
    }
    // This was the Update method from Sprite
    // Keeping the custom y inversion
    // * Should we combine values somehow and check both at once? *
    public void move() {
        x += change_x;
        y -= change_y; //down is positive direction for y axis in processing so I inverted this as a preference
    }
    
    // Force an object to move
    public void setChangeX(int change_x){
        this.change_x = change_x;
    }
    public void setChangeY(int change_y){
        this.change_y = change_y;
    }
