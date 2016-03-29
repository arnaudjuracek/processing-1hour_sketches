import java.util.Collections;
import java.util.Comparator;
import java.util.Iterator;

ArrayList<PVector> POINTS;

void setup(){
	size(1200, 800, P2D);

	// random points distribution
	POINTS = new ArrayList<PVector>();
	for(int i=0; i<3000; i++) POINTS.add(new PVector(random(25, width - 25), random(25, height - 25)));

	// sorting
	POINTS = sort(POINTS);
}

void draw(){
	background(30);

	strokeWeight(3);
	for(int c=1; c<POINTS.size(); c++){
		stroke(map(c, 0, POINTS.size(), 0, 255), 0, 200);
		line(POINTS.get(c).x, POINTS.get(c).y, POINTS.get(c-1).x, POINTS.get(c-1).y);
	}

	noStroke();
	ellipse(POINTS.get(0).x, POINTS.get(0).y, 5, 5);
}


void mousePressed(){ POINTS = sort(POINTS, new PVector(mouseX, mouseY)); }
void keyPressed(){ POINTS = sort(POINTS, POINTS.get(POINTS.size()-1)); }