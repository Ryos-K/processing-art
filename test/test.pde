// image declaration
PImage img;




void setup() {
    // setup
    size(400, 400);
    background(0);
    // load image
    img = loadImage("aquatanicon.png");
    img.resize(width, height);
    noStroke();
}
void draw() {
    textSize(10);
    text("a", 0, 0);

    int step = 10;
    // for (int x = 0; x < width; x += step) {
    //     for (int y = 0; y < height; y += step) {
    //         // get color of pixel
    //         int c = img.get(x, y);
    //         // set color of pixel
    //         fill(c, 100);
    //         // get noise value for length and floar it
    //         int len = step * 2;
            
    //         // draw rect
    //         textSize(len);
    //         text("a", x, y);
    //     }
    // }
}
