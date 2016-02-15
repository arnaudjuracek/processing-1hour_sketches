// inspired by https://www.behance.net/gallery/24049973/Hyper-Contemporary-Institute

color
	BLUE = color(6, 41, 248),
	BLACK = color(10);

float easing = .06;
int margin = 5,
	length = 60,
	offset = -50;


PVector[]
	tpoints = new PVector[12],
	points = new PVector[12];

void setup(){
	size(350, 530);
	smooth();

	for(int i=0; i<tpoints.length; i++){
		tpoints[i] = new PVector(0.0, 0.0);
		points[i] = new PVector(0.0, 0.0);
	}

	textFont(loadFont("Helvetica-48.vlw"));
	textSize(38);
	textLeading(36);
	textAlign(LEFT, TOP);

	strokeWeight(3);
	stroke(BLUE);
	noFill();

	spawn();
}

void draw(){
	if(frameCount%240==0) spawn();

	background(255);

	//EASING
	for(int i=0; i<tpoints.length; i++){
		float
			dx = tpoints[i].x - points[i].x,
			dy = tpoints[i].y - points[i].y;
		points[i].x += dx*easing;
		points[i].y += dy*easing;

		points[i].x = int(points[i].x);
		points[i].y = int(points[i].y);
	}

	fill(BLACK);
	text("Hyper\nContemporary\nInstitute", margin, margin);


	//DRAWING
	stroke(BLUE);
	fill(255, map(sin(frameCount*.01), -1, 1, 0, 100));
	for(int a=0; a<length; a++){
		float
			delta = map(sqrt(a),0,sqrt(length-1),1,0),
			coef = a*margin;

		beginShape();
			vertex(points[0].x, delta*margin + coef + height*.5 + offset);
			vertex(points[0].x, delta*margin + coef + height*.5 + offset);
			for(int i=1; i<points.length-1; i++){
				PVector p = points[i];
				float y = (coef + height*.5 + offset) - p.y*delta;
				curveVertex(p.x, y + 10*sin(i + frameCount*.05));
			}

			curveVertex(points[points.length-1].x, (coef + height*.5 + offset) + delta*margin - points[points.length-1].y*delta);
			curveVertex(points[points.length-1].x, (coef + height*.5 + offset) + delta*margin - points[points.length-1].y*delta);
		endShape();
	}

}

void keyPressed(){ spawn(); }
void mousePressed(){ spawn(); }

void spawn(){
	float m = frameCount;
	for(int i=0; i<tpoints.length; i++){
		tpoints[i].x = map(i, -1, tpoints.length-1, 0, width-margin) + noise(m+i);
		tpoints[i].y = 100 * (
				+ .2 * ( sin(map(i, 0, tpoints.length, 0, TWO_PI)+TWO_PI*noise(m*i)) )
				+ .3 * ( sin(map(i, 0, tpoints.length, 0, PI)+TWO_PI*noise(m-i)) )
				+ .7 * ( cos(map(i, 0, tpoints.length, 0, PI)-TWO_PI*noise(m)) )
			);
	}
}