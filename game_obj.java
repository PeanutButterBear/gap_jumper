
// INTERFACE FOR PHYSICAL GAME OBJECTS
// platform, hero, enemy 
// Solid/danger checks
public interface game_obj {
    public void solid_check();
    public void danger_check();
    public boolean hitDetect(game_obj other_obj);
    public float getHitboxX();
    public float getHitboxY();
    public float getHitboxW();
    public float getHitboxH();
}
