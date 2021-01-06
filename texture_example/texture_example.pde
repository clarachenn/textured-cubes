PImage diamond, dirt, grass_top, grass_side, tnt_top, tnt_bottom, tnt_side, oak_log_top, oak_log,
  oak_trapdoor, bricks, chiseled_quartz_block, chiseled_quartz_block_top, hay_block_top, hay_block_side;
float rotx, roty;

void setup() {
  size(800, 800, P3D);
  diamond = loadImage("diamond.png");
  dirt = loadImage("dirt.png");
  grass_top = loadImage("grass_top.png");
  grass_side = loadImage("grass_side.png");
  tnt_top = loadImage("tnt_top.png");
  tnt_bottom = loadImage("tnt_bottom.png");
  tnt_side = loadImage("tnt_side.png");
  oak_log_top = loadImage("oak_log_top.png");
  oak_log = loadImage("oak_log.png");
  oak_trapdoor = loadImage("oak_trapdoor.png");
  bricks = loadImage("bricks.png");
  chiseled_quartz_block = loadImage("chiseled_quartz_block.png");
  chiseled_quartz_block_top = loadImage("chiseled_quartz_block_top.png");
  hay_block_top = loadImage("hay_block_top.png");
  hay_block_side = loadImage("hay_block_side.png");

  textureMode(NORMAL);
}

void draw() {
  background(0);

  texturedCube(350, 350, 0, diamond, 100);
  texturedCube(350, 525, 0, dirt, 100);
  texturedCube(350, 175, 0, grass_top, grass_side, dirt, 100);
  texturedCube(175, 350, 0, tnt_top, tnt_side, tnt_bottom, 100);
  texturedCube(175, 175, 0, oak_log_top, oak_log, oak_log_top, 100);
  texturedCube(175, 525, 0, bricks, 100);
  texturedCube(525, 525, 0, chiseled_quartz_block_top, chiseled_quartz_block, chiseled_quartz_block_top, 100);
  texturedCube(525, 175, 0, hay_block_top, hay_block_side, hay_block_top, 100);
  texturedCube(525, 350, 0, oak_trapdoor, 100);
}


void texturedCube(float x, float y, float z, PImage texture, float size) {
  pushMatrix();
  translate(x, y, z);
  scale(size);
  rotateX(rotx);
  rotateY(roty);

  noStroke();

  beginShape(QUADS);
  texture(texture);

  //top
  //     x, y, z, tx,ty
  vertex(0, 0, 0, 0, 0);
  vertex(1, 0, 0, 1, 0);
  vertex(1, 0, 1, 1, 1);
  vertex(0, 0, 1, 0, 1);

  //bottom
  vertex(0, 1, 0, 0, 0);
  vertex(1, 1, 0, 1, 0);
  vertex(1, 1, 1, 1, 1);
  vertex(0, 1, 1, 0, 1);

  //front
  vertex(0, 0, 1, 0, 0);
  vertex(1, 0, 1, 1, 0);
  vertex(1, 1, 1, 1, 1);
  vertex(0, 1, 1, 0, 1);

  //back
  vertex(0, 0, 0, 0, 0);
  vertex(1, 0, 0, 1, 0);
  vertex(1, 1, 0, 1, 1);
  vertex(0, 1, 0, 0, 1);

  //left
  vertex(0, 0, 0, 0, 0);
  vertex(0, 0, 1, 1, 0);
  vertex(0, 1, 1, 1, 1);
  vertex(0, 1, 0, 0, 1);

  //right
  vertex(1, 0, 0, 0, 0);
  vertex(1, 0, 1, 1, 0);
  vertex(1, 1, 1, 1, 1);
  vertex(1, 1, 0, 0, 1);

  endShape();

  popMatrix();
}

void texturedCube(float x, float y, float z, PImage top, PImage side, PImage bottom, float size) {
  pushMatrix();
  translate(x, y, z);
  scale(size);
  rotateX(rotx);
  rotateY(roty);

  noStroke();

  beginShape(QUADS);
  texture(top);

  vertex(0, 0, 0, 0, 0);
  vertex(1, 0, 0, 1, 0);
  vertex(1, 0, 1, 1, 1);
  vertex(0, 0, 1, 0, 1);

  endShape();

  beginShape(QUADS);
  texture(bottom);

  //bottom
  vertex(0, 1, 0, 0, 0);
  vertex(1, 1, 0, 1, 0);
  vertex(1, 1, 1, 1, 1);
  vertex(0, 1, 1, 0, 1);

  endShape();

  beginShape(QUADS);
  texture(side);

  //front
  vertex(0, 0, 1, 0, 0);
  vertex(1, 0, 1, 1, 0);
  vertex(1, 1, 1, 1, 1);
  vertex(0, 1, 1, 0, 1);

  //back
  vertex(0, 0, 0, 0, 0);
  vertex(1, 0, 0, 1, 0);
  vertex(1, 1, 0, 1, 1);
  vertex(0, 1, 0, 0, 1);

  //left
  vertex(0, 0, 0, 0, 0);
  vertex(0, 0, 1, 1, 0);
  vertex(0, 1, 1, 1, 1);
  vertex(0, 1, 0, 0, 1);

  //right
  vertex(1, 0, 0, 0, 0);
  vertex(1, 0, 1, 1, 0);
  vertex(1, 1, 1, 1, 1);
  vertex(1, 1, 0, 0, 1);

  endShape();

  popMatrix();
}

void mouseDragged() {
  rotx = rotx + (pmouseY - mouseY)*0.01;
  roty = roty + (pmouseX - mouseX)*0.01;
}
