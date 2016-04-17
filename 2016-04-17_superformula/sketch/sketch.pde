/**
 * superformula
 * by Arnaud Juracek
 * 2016-04-17
 *
 * https://github.com/arnaudjuracek/processing-1hour_sketches/tree/master/2016-04-17_superformula
 * superformula thanks to http://www.k2g2.org/blog:bit.craft:superdupershape_explorer
 * more infos https://en.wikipedia.org/wiki/Superformula
 */

void setup(){
	size(800, 800, P2D);
	textAlign(LEFT, TOP);
	mouseX = width/2;
	mouseY = height/2;
}

void draw(){
	float
		resolution = 360*.7,
		radius = 100,
		a = 1,
		b = 1,
		x = 10,
		y = 3,
		n1 = -20,
		n2 = map(mouseX, 0, width, 0, 1) * 10,
		n3 = map(mouseY, 0, height, 0, 1) * 10;

	if(frameCount%10==0){
		println("-----------------");
		println("a  = " + a);
		println("b  = " + b);
		println("x  = " + x);
		println("y  = " + y);
		println("n1 = " + n1);
		println("n2 = " + n2);
		println("n3 = " + n3);
	}

	background(50);
	stroke(250);
	strokeWeight(3);
	fill(200, 50);

	beginShape();
	for(int alpha=0; alpha<360; alpha+=(360/resolution)){
		float
			phi = radians(alpha),
			r = superformula(phi, a, b, x, y, n1, n2, n3),
			_x = radius*cos(phi)*r,
			_y = radius*sin(phi)*r;
		vertex(width/2 + _x, height/2 + _y);
	}
	endShape(CLOSE);

	fill(255);
	text(int(frameRate) + "fps", 10, 10);
}

float superformula(float phi, float a, float b, float x, float y, float n1, float n2, float n3) {
	return pow(pow(abs(cos(x * phi / 4) / a), n2) + pow(abs(sin(y * phi / 4) / b),n3), - 1/n1);
}