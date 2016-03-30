Grid grid;
Timer timer;

void setup(){
	size(500, 500);
		noSmooth();
	timer = new Timer(2000);
	grid = new Grid(50, 7);
}

void draw(){
	grid.draw();
	// if(timer.TICK) grid = new Grid(int(random(20, 200)));

	fill(grid.FOREGROUND);
		textAlign(LEFT, BOTTOM);
			text(grid.RESOLUTION + "*" + grid.RESOLUTION, 10, height-10);
		textAlign(RIGHT, BOTTOM);
			text("(" + grid.EQ + ") " + grid.EQ_EXP[grid.EQ], width-10, height-10);

	// timer.update();
	// if(timer.TICK) grid = new Grid(int(random(150, 200)));
}
void mouseReleased(){ grid = new Grid(int(random(20, 200)), grid.EQ); }
void keyPressed(){ grid = new Grid(int(random(20, 200))); }