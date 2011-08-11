class PixelButton
{
 int x, y, r, c;
 boolean isBlack = false;
 color black = color(0);
 color white = color(255);
 color currentColor = white;
 
 PixelButton(int col, int row, int pX, int pY) { 
   x = pX;
   y = pY;
   r = row;
   c = col;
 }
 boolean pressed() {
   if (mouseX >= x && mouseX <= x+pixelSize && 
      mouseY >= y && mouseY <= y+pixelSize) {
      return true;
    } 
    else {
      return false;
   }
 }
 void switchColors() {

  currentColor = (isBlack ? white : black);
  isBlack = (isBlack ? false : true);
  Pixels[c][r] = isBlack;
 }
 void clearColors() {
   currentColor = white;
   isBlack = false;
   Pixels[c][r] = false;
 }
 
 void display() {
  stroke(200);
  fill(currentColor);
  rect(x, y, pixelSize, pixelSize); 
 }
 
}

class SubmitButton
{
 int x = 120;
 int y = 200; 
 int w = 50;
 int h = 20;
 
 void display() {
  noStroke();
  noFill();
  image(bld, x, y);
 }
 
 boolean pressed() {
   if (mouseX >= x && mouseX <= x+w && 
      mouseY >= y && mouseY <= y+h) {
      return true;
    } 
    else {
      return false;
   }
 }
 
}

class ClearButton
{
 int x = 10;
 int y = 200; 
 int w = 50;
 int h = 20;
 
 void display() {
  noStroke();
  image(clr, x, y);
 }
 boolean pressed() {
   if (mouseX >= x && mouseX <= x+w && 
      mouseY >= y && mouseY <= y+h) {
      return true;
    } 
    else {
      return false;
   }
 }
  
}
