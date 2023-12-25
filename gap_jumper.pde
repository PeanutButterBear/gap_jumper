/* Bouncing Ball Lab
   There are two versions of this lab:
   1) Friendly version. More helper code is provided in lab template.
   2) More challenging version. Less helper code is provided.
   
   This is the more challenging version. 
   See the friendly version if you need more help.
   
   Complete the code as indicated by the comments.
   The ball moves in a diagonal direction and bounces when
   it collides with any of the four sides of the screen.
*/

PImage ball;
float center_x, center_y;
float change_x, change_y;
float radius;

void setup(){
  size(800,600);
  imageMode(CENTER); // position of image is its center
  
  // load ball image "ball.png"
  ball = loadImage("data/ball.png");
  
  // initialize position, velocity and radius of ball.
  center_x = 400;
  center_y = 300;
  change_x = 5;
  change_y = 5;
  radius = 64;


}

void draw(){
  background(255);
  
  // draw image by calling image(image_variable, x, y, width, height)
  image(ball, center_x, center_y, 128, 128);
  
  // update ball by adding its velocity to its position
  center_x += change_x;
  center_y += change_y;
  
  /* if ball passes right side of screen, fix center_x to 
     align the ball exactly at the right side of the screen. 
     Then negate change_x to change direction. 
     
     else if ball passes left side of screen, fix center_x to 
     align the ball exactly at the left side of the screen. 
     Then negate change_x to change direction.
     
     There should be four conditional: 
     if and else if for horizontal direction
     if and else if for vertical direction
  */

  
  // add in code for the else if conditional
  if (center_x > 800 - 64) {
    change_x *= -1;
  } else if (center_x < 64) {
    change_x *= -1;
  }
  
  
  // now add if and else if for vertical direction(center_y, change_y)
  if (center_y > 600 - 64) {
    change_y *= -1;
  } else if (center_y < 64) {
    change_y *= -1;
  }

}
