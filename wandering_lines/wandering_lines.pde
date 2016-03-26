import peasy.*;
PeasyCam CAM;



void setup(){
	size(800, 800, P3D);
	stroke(255);
	strokeWeight(2);
	noFill();
	background(50);

	CAM = new PeasyCam(this, 1000);
	LINES.add(new ArrayList<PVector>());
}



ArrayList<ArrayList> LINES = new ArrayList<ArrayList>();
float
	LENGTH = 100, RADIUS = 1000,
	px = 0, py = 0, pz = 0;



void draw(){
	background(50);
	float
		n1 = (float) SimplexNoise.noise(px, py, frameCount),
		n2 = (float) SimplexNoise.noise(py, pz, frameCount),
		theta = n1*TWO_PI, phi = n2*TWO_PI,
		x = px + sin(theta)*cos(phi)*LENGTH,
		y = py + sin(theta)*sin(phi)*LENGTH,
		z = pz + cos(theta)*LENGTH;

	LINES.get(LINES.size()-1).add(new PVector(x,y,z));

	for(ArrayList<PVector> LINE : LINES){
		beginShape();
			curveVertex(0,0,0);
			int i = 0;
			for(PVector p : LINE){
				i++;

				float r = map(p.dist(new PVector(0,0,0)), 0, RADIUS, 0, 255);
				stroke(127-r,r,255-r, map(i, 0, LINE.size(), 255, 50));
				strokeWeight(map(r, 0, 255, 10, 0));
				curveVertex(p.x, p.y, p.z);
			}
		endShape();
	}

	if(PVector.dist(new PVector(0,0,0), new PVector(x,y,z))>RADIUS){
		x = 0; y = 0; z = 0;
		px = 0; py = 0; pz = 0;
		LINES.add(new ArrayList<PVector>());
	}

	px = x; py = y; pz = z;
}