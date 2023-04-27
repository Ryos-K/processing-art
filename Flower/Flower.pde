final int RADIUS = 20;
final int RADIUS_AMP = 100;
final int SATELLITE_RADIUS = 20;
final int SATELLITE_AMP = 60;
final int ANGLE_VELOCITY = 5;
final int FRAME_RATE = 60;

int angle = 0;
int satelliteAngle = 0;
int c = 0;
int tick = 0;

void setup() {
    size(400, 400);
    background(255);
    frameRate(FRAME_RATE);
    // colorMode(HSB, 360, 100, 100);
}

void draw() {
    saveFramesUntil(2400);


    tick++;
    translate(width / 2, height / 2);
    
    int radius = RADIUS + floor(noise(tick * 0.01) * RADIUS_AMP);
    int satelliteRadius = SATELLITE_RADIUS + floor(noise(tick * 0.01) * SATELLITE_AMP);
    
    // stroke(angle, (radius * 100 / (RADIUS + RADIUS_AMP)) , satelliteRadius * 100 / (SATELLITE_RADIUS + SATELLITE_AMP));
    stroke(0, c / 2, c, 48);


    PVector satellite = new PVector(radius * cos(radians(angle)), radius * sin(radians(angle)));
    PVector satellite_arm = new PVector(satelliteRadius * cos(radians(satelliteAngle)), satelliteRadius * sin(radians(satelliteAngle)));
    PVector satellite_left = PVector.add(satellite, satellite_arm);
    PVector satellite_right = PVector.sub(satellite, satellite_arm);
    
    line(satellite_left.x, satellite_left.y, satellite_right.x, satellite_right.y);
    
    angle += ANGLE_VELOCITY;
    satelliteAngle += floor(noise(tick * 0.01) * 10) - 5;
    angle = (angle + 360) % 360;
    satelliteAngle = (satelliteAngle + 360) % 360;

    if(tick % 4 == 0) {
        c++;
    }

    
}

void saveFramesUntil(int frame) {
    if(frameCount < frame) {
        saveFrame("frames/flower_####.png");
    }
}
