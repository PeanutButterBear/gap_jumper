//declare global variables
Sprite ball;
// User
Hero hero;

float move_speed;
boolean game_state;


// Eventually
static float frame_ctr;

//initialize global variables
// Main methods for running program
// Setup/draw
// Setup 1 time draw 60times/1second
void setup(){
  //displayWidth,displayHeight created by size(x,y)
  size(1600,1200);
  
  imageMode(CENTER); // position of image is its center
  move_speed = 3;
  
  // filename,scale,x_spawn, y_spawn
  ball = new Sprite("data/ball.png", 1.0, 1500, 1100);
  hero = new Hero("data/copyright_wizard.png", .2, 100 ,1100);
  
}

void draw(){
  background(255);
 
  
  ball.display();
 
  
  hero.display();
  hero.update();
  
  
  

  //draw sprite, move by wasd
  // STOPS the hero when they reach the right wall as current win condition
  if(hero.center_x >= displayWidth){
    keyReleased(); 
  }
  
  if(keyPressed) {
    hero.update();
  } else {
    keyReleased();
  }
}


//native processing method that detects keystrokes
void keyPressed(){
  if(key == 'w') {
    hero.change_y = move_speed;
  }
  if(key == 'a') {
    hero.change_x = -move_speed;
  }
  if(key == 's') {
    hero.change_y = -move_speed;
  }
  if(key == 'd') {
    hero.change_x = move_speed;
  }
  
 
  }

// I agree, would be less updates I think
void keyReleased(){
  //I think this commented out code is better/more efficient but not sure yet
  hero.change_x = 0;
  hero.change_y = 0;



// Win condition
  if(hero.center_x >= displayWidth){
  exit();
  } else {
    ;
}
}
