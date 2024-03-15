// Used for making characters rn
// Used for making characters rn
import java.util.*;

public class Sprite implements game_obj {
    PImage img;
    float center_x, center_y;
    float change_x, change_y;
    float w, h;
    float hitbox_x, hitbox_y, hitbox_w, hitbox_h;
    boolean danger;
    boolean solid;
    List<game_obj> game_objs = new ArrayList<>();
    
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
        
        game_objs.add(this);
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
        
        game_objs.add(this);
    }

    public Sprite(String filename, float scale) {
        this(filename, scale, 0, 0);
        game_objs.add(this);
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

    public void showHitbox() {
        noFill();
        stroke(255,0,0);
        rect(hitbox_x, hitbox_y, hitbox_w, hitbox_h);
        
    }

    @Override
    public void solid_check(){
        solid = true;
    }

    @Override
    public void danger_check() { 
        danger = true;
    }
    
    @Override
    public boolean hitDetect(game_obj obj) {
        Hitbox sprite_hitbox = new Hitbox(this.hitbox_x, this.hitbox_y, this.hitbox_w, this.hitbox_h);
        Hitbox obj_hitbox = new Hitbox(obj.getHitboxX(),obj.getHitboxY(),obj.getHitboxW(),obj.getHitboxH());
        return sprite_hitbox.intersects(obj_hitbox);
    }
    
    public float getHitboxX() {
        return hitbox_x;
    }

    public float getHitboxY() {
        return hitbox_y;
    }

    public float getHitboxW() {
        return hitbox_w;
    }

    public float getHitboxH() {
        return hitbox_h;
    }
    
    // Sets for changing 
    public void solid_check(boolean solid){
        this.solid = solid;
    }

    public void danger_check(boolean danger){
        this.danger = danger;
    }
}