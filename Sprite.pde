// Used for making characters rn


public class Sprite {
    PImage img;
    float center_x, center_y;
    float change_x, change_y;
    float w, h;
    
    
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
    }
}
