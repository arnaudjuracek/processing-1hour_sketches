public class Cuboid{
	PVector CENTROID;
	ArrayList<PVector> POINTS, TPOINTS;
	float EASING = 0.09, RADIUS;

	Cuboid(PVector centroid, float radius){
		this.CENTROID = centroid;
		this.RADIUS = radius;

		this.POINTS = new ArrayList<PVector>();
		for(int a=0; a<360; a+=60) this.POINTS.add(new PVector(this.CENTROID.x + cos(radians(a))*radius, this.CENTROID.y + sin(radians(a))*radius));

		this.TPOINTS = new ArrayList<PVector>();
		this.generate();
	}

	void update(){
		for(int i=0; i<this.POINTS.size(); i++) this.POINTS.get(i).lerp(this.TPOINTS.get(i), this.EASING);
	}

	void draw(){
		this.update();
		beginShape();
			for(PVector p : this.POINTS){
				vertex(p.x, p.y);
				line(p.x, p.y, this.CENTROID.x, this.CENTROID.y);
			}
		endShape(CLOSE);
	}

	void generate(){
		this.TPOINTS.clear();
		for(float alpha=random(60); this.TPOINTS.size()<6; alpha+=random(50,70)){
			float r = random(this.RADIUS*.1, this.RADIUS*.5);
			this.TPOINTS.add(new PVector(this.CENTROID.x + cos(radians(alpha)) * r, this.CENTROID.y + sin(radians(alpha)) *r));
		}
	}
}