// Hero is the user's character
// Same as sprite


public class Hero implements game_object {
    PImage img;
    float center_x, center_y;
    float change_x, change_y;
    float w, h;
    
    // Using filename instead of previous "data/example.png")
    // 
    public Hero(String filename, float scale, float x, float y) {
        img = loadImage("data/copyright_wizard.png");
        w = img.width * scale;
        h = img.height * scale;
        
 
       
        this.center_x = x;
        this.center_y = y;
        
        change_x = 0;
        change_y = 0;
    }

    public Hero(String filename, float scale) {
        this(filename, scale, 100, 500);
    }
  
    // 
    public void display() {
        image(img, center_x, center_y, w, h);
    }

    // Keystrokes should only move Hero 
    public void update() {
        center_x += change_x;
        center_y -= change_y; //down is positive direction for y axis in processing so I inverted this as a preference
    }
    
}

    
