public class Sprite {
    PImage img;
    float center_x, center_y;
    float change_x, change_y;
    float w, h;

    public Sprite(String filename, float scale, float x, float y) {
        img = loadImage("data/ball.png");
        w = img.width * scale;
        h = img.height * scale;
        center_x = x;
        center_y = y;
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