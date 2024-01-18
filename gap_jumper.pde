//declare global variables
Sprite ball;
float move_speed;

//initialize global variables
void setup(){
  size(800,600);
  imageMode(CENTER); // position of image is its center
  move_speed = 3;
  ball = new Sprite("data/ball.png", 1.0);
}

void draw(){
  background(255);
  
  ball.display();
  ball.update();

  //draw sprite, move by wasd
  ball.display();
  if(keyPressed) {
    ball.update();
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

void keyReleased(){
  //I think this commented out code is better/more efficient but not sure yet
  //ball.change_x = 0;
  //ball.change_y = 0;
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
  }
}
