ArrayList<PVector> points, t_points;
float mrgn = 50, w, h, x, y;

void setup(){
	size(800, 800);
		noFill();
		stroke(50);
		strokeWeight(5);

	w = width - mrgn*2;
	h = height - mrgn*2;
	x = width*.5;
	y = height*.5;

	points = new ArrayList<PVector>();
	for(int a=0; a<360; a+=60) points.add(new PVector(x + cos(radians(a))*w, y + sin(radians(a))*h));

	t_points = new ArrayList<PVector>();
	generate();
}

void draw(){
	background(200);
	beginShape();
		PVector prev = new PVector(x,y);
		for(int i=0; i<points.size(); i++){
			PVector p = points.get(i).lerp(t_points.get(i), .09);

			vertex(p.x, p.y);
			line(p.x, p.y, x, y);
		}
	endShape(CLOSE);

}

void keyPressed(){ generate(); }
void generate(){
	t_points.clear();
	for(float alpha=random(60); t_points.size()<6; alpha+=random(50,70)){
		float r = random(w*.1, w*.5);
		t_points.add(new PVector(x + cos(radians(alpha)) * r, y + sin(radians(alpha)) *r));
	}
}

/*
// GRID
float
	mrgn = 1;
int
	cols = 6,
	rows = 6;

void draw(){
	noLoop();
	background(200);

	float
	 	w = width / ((cols+1)*mrgn),
	 	h = height / ((rows+1)*mrgn);

	for(int i=1; i<cols+1; i++){
		for(int j=1; j<rows+1; j++){
			float
				x = i*mrgn*w,
				y = j*mrgn*h;

			ArrayList<PVector> points = new ArrayList<PVector>();

			for(float alpha=random(60); points.size()<6; alpha+=random(50,70)){
				float r = random(w*.1, w*.5);
				points.add(new PVector(x + cos(radians(alpha)) * r, y + sin(radians(alpha)) *r));
			}

			beginShape();
				PVector prev = new PVector(x,y);
				for(PVector p : points){
					vertex(p.x, p.y);
					line(p.x, p.y, x, y);
				}
			endShape(CLOSE);

		}
	}
}

void keyPressed(){ loop(); }
*/