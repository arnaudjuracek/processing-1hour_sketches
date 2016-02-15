import java.awt.Rectangle;

public ArrayList<Box> BOXES = new ArrayList<Box>();
Light LIGHT;

color
	COLOR_SHADOW = color(34, 0, 46),
	COLOR_LIGHT = color(255, 224, 0);

void setup(){
size(400, 400, P2D);
	LIGHT = new Light();
	spawn(1);
}

void draw(){
	background(COLOR_LIGHT);
	LIGHT.draw();
	for(Box b : BOXES) b.draw();
}

void spawn(int n){
	BOXES = new ArrayList<Box>();
	for(int i=0; i<n;i++){
		float size = random(20, 100);
		BOXES.add(new Box(random(size, width - size), random(size, height - size), size, size));
	}
}

void mouseReleased(){ spawn(int(random(5))); }