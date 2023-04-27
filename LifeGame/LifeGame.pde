// dx, dy to 8 directions
final int[] dx = { 0, 1, 0, -1, 1, 1, -1, -1 };
final int[] dy = { -1, 0, 1, 0, -1, 1, 1, -1 };

final int FRAME_RATE = 5;
final int IMAGE_DOTS = 100;

PImage field;
PImage prevField;
PImage output;

void setup() {
    size(400, 400);
    background(0);
    field = loadImage("/home/ry05k2ulv/Pictures/mino_taki.jpg");
    field.resize(IMAGE_DOTS, IMAGE_DOTS);
    prevField = field.get();
    frameRate(FRAME_RATE);
}



void draw() {
    for (int i = 0; i < width; i++) {
        for (int j = 0; j < height; j++) {
            int dir1 = floor(random(0, 8));
            int c1 = prevField.get(i + dx[dir1], j + dy[dir1]);
            int dir2 = floor(random(0, 8));
            int c2 = prevField.get(i + dx[dir2], j + dy[dir2]);
            // choose c1 or c2 and set it as new color to field
            int newR = floor(random(0, 1) < 0.5 ? red(c1) : red(c2));
            int newG = floor(random(0, 1) < 0.5 ? green(c1) : green(c2));
            int newB = floor(random(0, 1) < 0.5 ? blue(c1) : blue(c2));
            
            field.set(i, j, color(newR, newG, newB));
        }
    }

    for( int i = 0; i < IMAGE_DOTS; i++ ) {
        for( int j = 0; j < IMAGE_DOTS; j++ ) {
            int c = field.get(i, j);
            fill(c);
            noStroke();
            rect(i * width / IMAGE_DOTS, j * height / IMAGE_DOTS, width / IMAGE_DOTS, height / IMAGE_DOTS);
        }
    }


    prevField = field.get();
}

void keyPressed() {
    if( keyCode == ENTER ) {
        save("ortus-ch.jpg");
    }
}