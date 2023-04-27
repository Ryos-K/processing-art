final int MAX_CHAR_SIZE = 40;
final float MAX_ATTENUATION_RATE = 1.0;
final float MIN_ATTENUATION_RATE = 0.1;
// final int CHAR_ALPHA = 255;
final int CHAR_PER_FRAME = 20;
final int FRAME_RATE = 60;
final int MAX_TICK = FRAME_RATE * 6;

char[] aquatanstudioChar = {
    'A', 'Q', 'U', 'A', 'T', 'A', 'N', 'S', 'T', 'U', 'D', 'I', 'O'
};

int tick = 0;
PImage img;

int alpha = 0;


void setup() {
    background(0);
    size(500, 500);
    noStroke();
    img = loadImage("aquatanicon.png");
    frameRate(FRAME_RATE);
}

void draw() {
    // saveFramesUntil(MAX_TICK + FRAME_RATE);
    // if(tick >= MAX_TICK) return;

    for(int i = 0; i < CHAR_PER_FRAME; i++){    
        int size = floor(random(1, MAX_CHAR_SIZE));
        int x = floor(random(size / 2, width - size / 2));
        int y = floor(random(size / 2, height - size / 2));
        char ch = aquatanstudioChar[floor(random(0, aquatanstudioChar.length))];
        int c = img.get(x, y);
        float attenuationRate = random(MIN_ATTENUATION_RATE, MAX_ATTENUATION_RATE);
        
        fill(red(c) * attenuationRate, green(c) * attenuationRate, blue(c) * attenuationRate, alpha);
        textSize(size);
        text(ch, x - size / 2, y + size / 2);
    }
    alpha = min(alpha + 1, 255);
    tick++;
}


void saveFramesUntil(int frame) {
    if(frameCount < frame) {
        saveFrame("frames/aqicontxt_####.png");
    }
}

void keyPressed() {
    if( keyCode == ENTER ) {
        save("aqicontxt.png");
    }
}