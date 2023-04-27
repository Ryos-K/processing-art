final int DOT_NUM = 500;
final int DOT_RADIUS = 10;
final int THRESHOLD = 20;
final int DIST = 20;
final int FRAME_RATE = 10;
final int MAX_TICK = FRAME_RATE * 40;

PImage img;
Dot dots[] = new Dot[DOT_NUM];

void setup() {
    img = loadImage("images/kosen.jpg");
    size(1500, 500);
    background(0);
    frameRate(FRAME_RATE);
    
    println(img.width, img.height);
    img.resize(width, height);
    initDots(img);
    noStroke();
    for (Dot d : dots) {
        d.display();
    }
}

void draw() {
    saveFramesUntil(MAX_TICK);
    for (Dot d : dots) {
        d.moveToSimilarPixel(img, DIST, THRESHOLD);
        d.display();
    }
}

void initDots(PImage img) {
    for (int i = 0; i < DOT_NUM; i++) {
        int x = (int)random(width);
        int y = (int)random(height);
        int c = img.get(x, y);
        int r = floor(red(c));
        int g = floor(green(c));
        int b = floor(blue(c));
        dots[i] = new Dot(x, y, r, g, b, DOT_RADIUS);
    }
}


class Dot {
    int x, y;
    int r, g, b;
    int radius;
    Dot(int x, int y, int r, int g, int b, int radius) {
        this.x = x;
        this.y = y;
        this.r = r;
        this.g = g;
        this.b = b;
        this.radius = radius;
    }
    
    void display() {
        fill(r, g, b);
        circle(x, y, radius);
    }
    
    boolean isSimilar(int r, int g, int b, int threshold) {
        if (abs(this.r - r) + abs(this.g - g) + abs(this.b - b) < threshold) {
            return true;
        } else {
            return false;
        }
    }
    
    boolean moveToSimilarPixel(PImage img, int dist, int threshold) {
        ArrayList<Integer[]> similarPixels = new ArrayList<>();
        int right = min(width, x + dist);
        int left =  max(0, x - dist);
        int top = max(0, y - dist);
        int bottom = min(height, y + dist);
        for (int i = left; i <= right; i++) {
            for (int j = top; j <= bottom; j++) {
                if (i == x && j == y) {
                    continue;
                }
                int c = img.get(i, j);
                int r = floor(red(c));
                int g = floor(green(c));
                int b = floor(blue(c));
                if (isSimilar(r, g, b, threshold)) {
                    Integer[] p = {i, j};
                    similarPixels.add(p);
                }
            }
        }
        if (similarPixels.size() > 0) {
            Integer[] p = similarPixels.get((int)random(similarPixels.size()));
            x = p[0];
            y = p[1];
            return true;
        }
        return false;
    }
    
    void move(int dx, int dy) {
        if (x + dx < 0) {
            x = 0;
        } else if (x + dx > width) {
            x = width;
        } else {
            x += dx;
        }
        if (y + dy < 0) {
            y = 0;
        } else if (y + dy > height) {
            y = height;
        } else {
            y += dy;
        }
    }
    
    void setColor(int r, int g, int b) {
        this.r = r;
        this.g = g;
        this.b = b;
    }
}

void saveFramesUntil(int frame) {
    if (frameCount < frame) {
        saveFrame("frames/dotsart_####.png");
    }
}

void keyPressed() {
    if (keyCode == ENTER) {
        save("dotsart.png");
    }
}