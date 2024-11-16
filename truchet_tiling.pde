float i, j;
float step = 60;
float arcRadius = step;
float arcPos = arcRadius / 2;
float margin = 100;

void setup() {
  size(800, 800);
  pixelDensity(2);
  stroke(255);
  strokeWeight(5);
  noLoop();
}

void draw() {
  background(255);

  fill(0);
  rect(margin, margin, width - 2 * margin, height - 2 * margin);
  
  
  for (i = margin + step / 2; i < width - margin; i += step) {
    for (j = margin + step / 2; j < height - margin; j += step) {
      push();

      translate(i, j);

      noFill();
      float r = random(1);
      if (r < 0.5) {
        arc(-arcPos, -arcPos, arcRadius, arcRadius, 0, HALF_PI);
        arc(arcPos, arcPos, arcRadius, arcRadius, PI, 3 * HALF_PI);
      } else {
        arc(arcPos, -arcPos, arcRadius, arcRadius, HALF_PI, PI);
        arc(-arcPos, arcPos, arcRadius, arcRadius, 3 * HALF_PI, TWO_PI);
      }

      pop();
    }
  }
}

void keyPressed() {
  if (key == 's') {
    saveFrame("media/output_" + millis() + ".png");
  }
}
