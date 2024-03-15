// Class that create a Hitbox that mirrors the drawn-on hitbox made with the rect()
// Hit-detection is done by checking if two hitboxes intersect
// game_obj class has a hitbox object as a field so all Sprites will have a h-box
// 
public class Hitbox {
    public float x;
    public float y;
    public float width;
    public float height;

    public Hitbox(float x, float y, float width, float height) {
        this.x = x;
        this.y = y;
        this.width = width;
        this.height = height;
    }

    // Returns true if the hitbox intersects with another hitbox
    public boolean intersects(Hitbox other) {
        if(x + width < other.x || x > other.x + other.width ||
         y + height < other.y || y > other.y + other.height) {
            return false;
        }
        return true;
    }

    // Returns true if the hitbox contains a point
    public boolean contains(int x, int y) {
        return (x > this.x && x < this.x + width && y > this.y && y < this.y + height);
    }

    // Returns true if the hitbox is completely contained within another hitbox
    public boolean containedIn(Hitbox other) {
        return (x > other.x && x + width < other.x + other.width && y > other.y && y + height < other.y + other.height);
    }
    
    // Simple true/false for hit detection
    // Usable for any object that has a hitbox
    public boolean hitDetect(Hitbox other) {
        if(intersects(other)) {
            return true;
        }
        return false;
    }
    
}