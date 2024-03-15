import java.util.*;
import java.util.Random;
import java.util.Scanner;

//declare global variables
String map;
//String[] maps = {tavern, level1};
static int levelCtr = 0;
String test = "this is a test";

// LIST OF GAME OBJECTS
List<game_obj> game_objs = new ArrayList<>();
// GAME OBJECTS
Sprite ball;
Platform ground;
Platform house;
Hero hero;


float move_speed;
int game_state;
boolean level_complete;

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
  move_speed = 10;
  
  // filename,scale,x_spawn, y_spawn
  ball = new Sprite("data/ball.png", 1.0, 1500, 800);
  hero = new Hero("data/copyright_wizard.png", .15, 100 , 600);
  ground = new Platform("data/ground.png", 3.0, 800, 1200);
  house = new Platform("data/house.png", 1.5, 200, 840);
  
  level_complete = false;
}

// 
void draw(){
  background(255);
  winCondition();
  ground.display();
  ground.showHitbox();
  house.display();
  ball.display();
  ball.showHitbox();
  hero.display();
  hero.showHitbox();
  hero.update();
  
  game_objs.add(ball);
  game_objs.add(hero);
  game_objs.add(ground);
  game_objs.add(house);
  
  levelCtr = 0;
  if(level_complete == true){
    levelCtr++;
    level_complete = false;
  }

  if(levelCtr == 1){
    background(50);
  }
  // Debugging for hit detect
  // should print red when collision detected
  
  text("game_objs: " + game_objs, 800,400);
  
  
  fill(0, 255, 0); // Default to no collision color
  boolean collisionDetected = false;
  for(game_obj obj : game_objs) {
    if(obj != hero && hero.hitDetect(obj)) { // Exclude hero self-check
      collisionDetected = true;
    }
  }
  if(collisionDetected) {
    text("hit = true", 800, 600); 
    fill(255, 0, 0); // Collision color
  } else {
    text("hit = false", 800, 600); 
  }
    

  //draw sprite, move by wasd
  // STOPS the hero when they reach the right wall as current win condition
  if(keyPressed) {
    hero.update();
  } else {
    keyReleased();
  }
}

// KEYBOARD INPUT HANDLING
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
    // need to make a jump function
  
      hero.change_y = (move_speed * 2);
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
