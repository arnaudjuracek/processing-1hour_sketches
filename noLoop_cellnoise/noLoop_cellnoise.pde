PImage IMAGE;

void setup(){
	size(400, 400);
		noSmooth();
		background(255);
	IMAGE = gen();
}

void draw(){
	imageMode(CORNER);
	image(IMAGE, 0, 0);

	if(zoom){
		float scale = 5.0;
		int w = 30,
			h = 30;

		imageMode(CENTER);
		PImage z = get(mouseX, mouseY, w, h);
		rect(mouseX-w*scale*.5, mouseY-h*scale*.5, w*scale, h*scale);
		image(z, mouseX, mouseY, w*scale, h*scale);
	}
}

boolean zoom = false;
void mouseReleased(){ IMAGE = gen(); }
void keyPressed(){ zoom = !zoom; }