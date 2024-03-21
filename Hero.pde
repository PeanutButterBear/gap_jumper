// Hero is the user's character
// Same as sprite


public class Hero implements game_obj {
    PImage img;
    float center_x, center_y;
    float change_x, change_y;
    float w, h;
    float hitbox_x, hitbox_y, hitbox_w, hitbox_h;
    boolean solid,danger;
    
    // Using filename instead of previous "data/example.png")
    // 
    public Hero(String filename, float scale, float x, float y) {
        img = loadImage("data/cooler_copyright_wizard.png");
        w = img.width * scale;
        h = img.height * scale;
        this.center_x = x;
        this.center_y = y;
        change_x = 0;
        change_y = 0;
        
        this.hitbox_x = center_x - w / 2;
        this.hitbox_y = center_y - h / 2;
        this.hitbox_w = w;
        this.hitbox_h = h;
        game_objs.add(this);
    }

    // DEFAULT SPAWN LOCATION IF USING ONLY FILENAME/SCALE
    public Hero(String filename, float scale) {
        this(filename, scale, 100, 500);
    }
  
    // Displays Hero used for movement
    public void display() {
        image(img, center_x, center_y, w, h);
    }

    // Keystrokes should only move Hero 
    public void update() {
        center_x += change_x;
        center_y -= change_y; //down is positive direction for y axis in processing so I inverted this as a preference

        hitbox_x = center_x - w / 2;
        hitbox_y = center_y - h / 2;
    }

    public void showHitbox() {
        noFill();
        stroke(0,255,0);
        rect(hitbox_x, hitbox_y, hitbox_w, hitbox_h);
         
        hitbox_x = center_x - w / 2;
        hitbox_y = center_y - h / 2;
        hitbox_w = w;
        hitbox_h = h;

        Hitbox hero_hitbox = new Hitbox(hitbox_x, hitbox_y, hitbox_w, hitbox_h);
    }

    @Override
    public void solid_check() {
        solid = true;
    }

    @Override
    public void danger_check() {
        danger = false;
    }
    
    @Override
    public boolean hitDetect(game_obj obj) {
        Hitbox hero_hitbox = new Hitbox(this.hitbox_x, this.hitbox_y, this.hitbox_w, this.hitbox_h);
        Hitbox obj_hitbox = new Hitbox(obj.getHitboxX(), obj.getHitboxY(), obj.getHitboxW(), obj.getHitboxH());
        return hero_hitbox.intersects(obj_hitbox);
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
    
}



    
