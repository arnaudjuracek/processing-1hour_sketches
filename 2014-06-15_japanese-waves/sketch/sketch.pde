Grid grid;

void setup(){
	size(displayWidth - 50, displayHeight - 80);
		noSmooth();
	grid = new Grid(32);
}

void draw(){ grid.render(); }

void mouseMoved(){
	grid.mouse.EASING = .05;
	grid.mouse.TARGET = new PVector(mouseX, mouseY);
}
void keyPressed(){
	grid.mouse.EASING = .005;
	grid.mouse.TARGET = new PVector(random(width), random(height));
}