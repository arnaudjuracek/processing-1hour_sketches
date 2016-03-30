// inspired by http://normalfutu.re/the-stream/normal-like-a-first-dip-into-the-stream/
Timer timer;
Normal normal;

void setup(){
size(800, 600);
		noSmooth();
	timer = new Timer(2000);
	normal = new Normal(2, .45, .25);
}

void draw(){
	normal.draw();
	if(timer.TICK) normal = new Normal(int(random(1, 8)), random(1), 1, random(1)>.5);
	timer.update();
}

void mouseReleased(){ normal = new Normal(normal.GRID_SIZE, normal.ODD, normal.EVEN, normal.HORIZONTAL); }
void keyPressed(){ normal = new Normal(normal.GRID_SIZE, random(1), 1, random(1)>.5); }