/**
 CLICK IMAGE TO SAVE
 */

PImage mimasImage, sortImage;
color colour;
int pixelsLocation;
float r, g, b;

String imageName = "mimas";
String fileType = ".jpg";
String folder = "images/";

int redTolerance = 200; // number of lines (higher number = fewer lines)
int greenTolerance = 200; // number of lines (higher number = fewer lines)
int blueTolerance = 200; // number of lines (higher number = fewer lines)
int sortLength = 90; // length of lines in pixels
float fadeSpeed = 2.1; // how fast the lines fade to black

void setup() {
  size(750, 750);

  mimasImage = loadImage(imageName + fileType);

  mimasImage.loadPixels();

  for (int i = 0; i < height; i++) {
    for (int j = 0; j < width; j++) {
      colour = mimasImage.get(i, j);

      if (red(colour) >= redTolerance & green(colour) >= greenTolerance & blue(colour) >= blueTolerance) {
        pixelsLocation = i + j * width;

        r = red(colour);
        g = green(colour);
        b = blue(colour);

        for (int k = 1; k <= sortLength; k++) {
          mimasImage.pixels[pixelsLocation - k] = color(r - k * fadeSpeed, g - k * fadeSpeed, b - k * fadeSpeed);
        } // end for
      } // end if
    } // end for
  } // end for

  mimasImage.updatePixels();
} // end setup

void draw() {
  background(0);
  image(mimasImage, 0, 0);
  noLoop();
} // end draw

void mouseClicked() {
  save(folder + imageName + " " + redTolerance + " " + greenTolerance + " " + blueTolerance + " " + fadeSpeed + fileType);
} // end mouseClicked