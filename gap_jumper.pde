//declare global variables
boolean level_complete;


Sprite ball;
Platform ground;
Platform house;

Hero hero;
float move_speed;
boolean game_state;


// Eventually
static float frame_ctr;

//initialize global variables
// Main methods for running program
// Setup 1 time draw 60times/1second
void setup(){
  
  // CHANGE THIS FOR WINDOW SIZE
  //displayWidth,displayHeight created by size(x,y)
  size(1600,1200);
  
  imageMode(CENTER); // position of image is its center
  move_speed = 30;
  
  // filename,scale,x_spawn, y_spawn
  ball = new Sprite("data/ball.png", 1.0, 1500, 800);
  hero = new Hero("data/copyright_wizard.png", .2, 100 , 600);
  ground = new Platform("data/ground.png", 3.0, 800, 1200);
  house = new Platform("data/house.png", 1.5, 200, 840);
  
  level_complete = false;
}

void draw(){
  background(255);
  winCondition();
  ground.display();
  house.display();
  ball.display();
  hero.display();
 
  hero.update();
  
  //draw sprite, move by wasd
  // STOPS the hero when they reach the right wall as current win condition
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
  if(key == 'x') {
    hero.change_y = move_speed * 2;
  }
}
 


// I agree, would be less updates I think
void keyReleased() {
  if(key == 'w' || key == 's') {
    hero.change_y = 0;
  }
  if(key == 'a' || key == 'd') {
    hero.change_x = 0;
  }
}

// Win condition
void winCondition(){
  if(hero.center_x >= displayWidth){
  level_complete = true;
  exit();
}
}
