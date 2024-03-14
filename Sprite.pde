// Used for making characters rn


public class Sprite implements game_obj {
    PImage img;
    float center_x, center_y;
    float change_x, change_y;
    float w, h;
    float hitbox_x, hitbox_y, hitbox_w, hitbox_h;
    
    // Using filename instead of previous "data/example.png")
    // Can make multiple in program runner with ("data/example.png", scale, center_x, center_y)
    public Sprite(String filename, float scale, float center_x, float center_y) {
        img = loadImage(filename);
        w = img.width * scale;
        h = img.height * scale;
        this.center_x = center_x;
        this.center_y = center_y;
        change_x = 0;
        change_y = 0;

        hitbox_x = center_x - w/2;
        hitbox_y = center_y - h/2;
        hitbox_w = w;
        hitbox_h = h;
    }

    public Sprite(String filename, float scale, float center_x, float center_y, boolean danger, boolean solid) {
        img = loadImage(filename);
        w = img.width * scale;
        h = img.height * scale;
        this.center_x = center_x;
        this.center_y = center_y;
        this.danger = danger;
        this.solid = solid;
        change_x = 0;
        change_y = 0;

        hitbox_x = center_x - w/2;
        hitbox_y = center_y - h/2;
        hitbox_w = w;
        hitbox_h = h;
    }

    public Sprite(String filename, float scale) {
        this(filename, scale, 0, 0);
    }

    public void display() {
        image(img, center_x, center_y, w, h);
    }
    
    public void update() {
        center_x += change_x;
        center_y -= change_y; //down is positive direction for y axis in processing so I inverted this as a preference

        hitbox_x = center_x - w/2;
        hitbox_y = center_y - h/2;
    }

    public void displayHitbox() {
        noFill();
        stroke(red);
        rect(hitbox_x, hitbox_y, hitbox_w, hitbox_h);
    }

    @Override
    public boolean solid_check(){
        return true;
    }

    @Override
    public boolean danger_check() { 
        return true;
    }

    // Sets for changing 
    public set solid_check(boolean solid){
        this.solid = solid;
    }

    public set danger_check(boolean danger){
        this.danger = danger;
    }
}
