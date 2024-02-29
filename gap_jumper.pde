//declare global variables
Sprite ball;
float move_speed;

PeonEnemy peon;

//initialize global variables
// ("load image", "img scale")
void setup(){
  size(800,600);
  imageMode(CENTER); // position of image is its center
  move_speed = 3;
  ball = new Sprite("data/ball.png",(width - .9), (height - .9), 1.0);
  peon = new PeonEnemy("data/peon.png",(width - .1),(height -.9), .4);
}

void draw(){
  background(255);
  //Are these extra?
  ball.display();
  peon.display();
  //ball.move();

  //draw sprite, move by wasd
  //ball.display();
  if(keyPressed) {
    ball.move();
  } else {
    keyReleased();
  }
}


//native processing method that detects keystrokes
void keyPressed(){
  if(key == 'w') {
    ball.change_y = move_speed;
  }
  if(key == 'a') {
    ball.change_x = -move_speed;
  }
  if(key == 's') {
    ball.change_y = -move_speed;
  }
  if(key == 'd') {
    ball.change_x = move_speed;
  }
}

// I agree, would be less updates I think
void keyReleased(){
  //I think this commented out code is better/more efficient but not sure yet
  ball.change_x = 0;
  ball.change_y = 0;
  /*
  if(key == 'w') {
    ball.change_y = 0;
  }
  if(key == 'a') {
    ball.change_x = 0;
  }
  if(key == 's') {
    ball.change_y = 0;
  }
  if(key == 'd') {
    ball.change_x = 0;
  */
  }
