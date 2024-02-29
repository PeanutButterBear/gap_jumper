// Interface for game objects that checks danger/solid/moving status
// for use in collision detection and most objects I think

public interface GameObjects{
  boolean solidCheck();
  boolean movingCheck();
  boolean dangerCheck();
}  
  

  
