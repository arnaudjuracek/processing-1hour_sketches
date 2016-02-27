PImage INPUT;
PGraphics OUTPUT;

void setup(){
	size(800, 800);
	INPUT = loadImage("david.jpg");
	create();
}

void draw(){
	if(OUTPUT != null) image(OUTPUT, 0, 0);
	if(mousePressed) image(INPUT, 0, 0);
}



int RES = 10;
void create(){
	INPUT.loadPixels();
	OUTPUT = createGraphics(INPUT.width, INPUT.height);

	OUTPUT.beginDraw();
	OUTPUT.background(255);
	OUTPUT.stroke(0);

	for(int x=0; x<INPUT.width; x+=RES){
		for(int y=0; y<INPUT.height; y+=RES){
			int index = x + y*INPUT.width;
			float b = brightness( INPUT.pixels[index] );

			/*
			OUTPUT.pushMatrix();
				OUTPUT.translate(x, y);
				OUTPUT.strokeWeight(map(b,0,255, 3,1));
				OUTPUT.rotate(b/255);
				OUTPUT.line(0, 0, 0, map(b,0,255, 10,20));
			OUTPUT.popMatrix();
			*/

			OUTPUT.line(x, y, x + int(map(b, 0,255, -2.5, 2.5))*RES, y+RES);
		}
	}

	OUTPUT.endDraw();
}