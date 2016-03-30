import java.util.Collections;
import java.util.Comparator;
import java.util.Iterator;

ArrayList<PVector> POINTS;
ArrayList<Triangle> TRIANGLES;

void setup(){
	size(1200, 800, P2D);
	POINTS = new ArrayList<PVector>();
	for(int i=0; i<10; i++) POINTS.add(new PVector(int(random(50, width-50)), int(random(50, height-50))));

	TRIANGLES = triangulate(POINTS, new PVector(mouseX, mouseY));
}

void draw(){
	background(30);

	if(SHADING) noStroke();
	else stroke(200);
	for(Triangle t : TRIANGLES){
		if(SHADING) fill(t.getColor());
		// if(SHADING) fill(t.getShade());
		else noFill();
		shape(t.getShape(), 0, 0);
	}

	fill(200);
	textAlign(LEFT, TOP);
	text(int(frameRate) + "fps", 10, 10);
}

boolean SHADING = false;
void keyPressed(){
	if(key=='c') SHADING = !SHADING;
	if(key=='r') setup();
	if(key=='x') POINTS.clear();
	if(key==' ') POINTS.add(new PVector(random(50, width-50),random(50, height-50)));

	TRIANGLES = triangulate(POINTS, new PVector(width/2, height/2));
}
void mousePressed(){
	POINTS.add(new PVector(mouseX, mouseY));
	TRIANGLES = triangulate(POINTS, new PVector(mouseX, mouseY));
}
PVector last = new PVector(0,0);
void mouseDragged(){
	if(last.dist(new PVector(mouseX, mouseY))>50){
		last = new PVector(mouseX, mouseY);
		POINTS.add(last);
		TRIANGLES = triangulate(POINTS, new PVector(mouseX, mouseY));
	}
}