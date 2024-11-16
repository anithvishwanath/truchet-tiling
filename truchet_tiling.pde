float i, j;
float step = 60;
float arcRadius = step;
float arcPos = arcRadius / 2;
float margin = 80;

void setup() {
  size(1000, 1000);
  pixelDensity(2);
  noLoop();
}

void draw() {
  background(255);

  float gridWidth = width - 2 * margin;
  float gridHeight = height - 2 * margin;

  fill(255);
  noStroke();
  rect(margin, margin, gridWidth, gridHeight);

  float cols = floor(gridWidth / step);
  float rows = floor(gridHeight / step);

  for (i = 0; i < cols; i++) {
    for (j = 0; j < rows; j++) {
      push();

      float x = margin + i * step + arcPos;
      float y = margin + j * step + arcPos;

      translate(x, y);

      noFill();

      stroke(0);
      strokeWeight(8);
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
