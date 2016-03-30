import java.util.Collections;
import java.util.Comparator;
import java.util.Iterator;
import peasy.*;

ArrayList<PVector> POINTS;

void setup(){
	size(1200, 800, P3D);
		// PeasyCam pc = new PeasyCam(this, 1000);

	// random points distribution
	POINTS = new ArrayList<PVector>();

	// //circle
	// for(int i=0; i<3000; i++){
	// 	float a = random(TWO_PI), r = random(height/2), x = width/2 + r*sin(a), y = height/2 + r*cos(a);
	// 	POINTS.add(new PVector(x,y));
	// }

	// //plan
	for(int i=0; i<5000; i++) POINTS.add(new PVector(random(25, width - 25), random(25, height - 25)));

	// //stable sphere
	// for(float theta=0; theta<PI; theta+=(PI/100)){
	// 	for(float phi=0; phi<TWO_PI; phi+=(TWO_PI/100)){
	// 		float
	// 			r = width,
	// 			x = r*sin(theta)*cos(phi),
	// 			y = r*sin(theta)*sin(phi),
	// 			z = r*cos(theta);
	// 		POINTS.add(new PVector(x,y,z));
	// 	}
	// }

	// // random sphere
	// for(int i=0; i<5000; i++){
	// 	float
	// 		t = random(TWO_PI),
	// 		p = random(TWO_PI),
	// 		r = width,
	// 		x = r*sin(t)*cos(p),
	// 		y = r*sin(t)*sin(p),
	// 		z = r*cos(t);
	// 	POINTS.add(new PVector(x,y,z));
	// }

	// sorting
	POINTS = sort(POINTS);
}

void draw(){
	background(30);

	// rotateX(frameCount*.005);
	// rotateY(frameCount*.005);

	strokeWeight(1);
	stroke(200);
	for(PVector p : POINTS) point(p.x, p.y, p.z);

	strokeWeight(3);
	for(int c=1; c<frameCount*20%POINTS.size(); c++){
	// for(int c=1; c<POINTS.size(); c++){
		stroke(map(c, 0, POINTS.size(), 0, 255), 0, 200);
		line(POINTS.get(c).x, POINTS.get(c).y, POINTS.get(c).z, POINTS.get(c-1).x, POINTS.get(c-1).y, POINTS.get(c-1).z);
	}

	noStroke();
	ellipse(POINTS.get(0).x, POINTS.get(0).y, 5, 5);
}

void mousePressed(){
	frameCount = 0;
	POINTS = sort(POINTS, new PVector(mouseX, mouseY));
}

void keyPressed(){
	frameCount = 0;
	POINTS = sort(POINTS, POINTS.get(POINTS.size()-1));
}
