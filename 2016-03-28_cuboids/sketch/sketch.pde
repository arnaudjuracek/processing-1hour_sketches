ArrayList<Cuboid> cuboids;

void setup(){
	size(800, 800);
		background(200);
		noFill();
		stroke(50);
		strokeWeight(3);

	int cols = 3,
		rows = 3;
	float r = width/(cols+1);

	cuboids = new ArrayList<Cuboid>();

	for(int i=1; i<cols+1; i++){
		for(int j=1; j<rows+1; j++){
			float
				x = i*r,
				y = j*r;

			Cuboid q = new Cuboid(new PVector(x,y),r);
			q.EASING = random(.05, .1);
			cuboids.add( q );
		}
	}
}

void draw(){
	// pushStyle();
	// 	noStroke();
	// 	fill(200,100);
	// 	rect(0,0,width,height);
	// popStyle();
	background(200);

	for(Cuboid q : cuboids) q.draw();
}

void keyPressed(){
	if(key=='r') for(Cuboid q : cuboids) q.generate();
}