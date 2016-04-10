public class Triangle{
	PShape SHAPE;
	PVector[] vertices = new PVector[3];
	PVector CENTER = null;
	float RADIUS = -1;
	color SHADE = -1, COLOR = -1;

	Triangle(PVector v1, PVector v2, PVector v3){
		this.vertices[0] = v1;
		this.vertices[1] = v2;
		this.vertices[2] = v3;
		// this.vertices = this.sortVertices(this.vertices, new PVector(width/2,height/2));
		this.vertices = this.sortVerticesByAngle(this.vertices, this.getCenter());
	}

	Triangle(PVector center, float radius){
		float a = 0;
		for(int i=0; i<3; i++){
			float
				x = center.x + cos(radians(a))*radius,
				y = center.y + sin(radians(a))*radius;
			this.vertices[i] = new PVector(x,y);
			a+=120;
		}
		// this.vertices = this.sortVertices(this.vertices, new PVector(width/2,height/2));
		this.vertices = this.sortVerticesByAngle(this.vertices, this.getCenter());
	}

	private PVector[] sortVerticesByAngle(PVector[] to_sort, PVector origin){
		ArrayList<PVector> sortable = new ArrayList<PVector>();
		for(PVector p : to_sort) sortable.add(p);
		Collections.sort(sortable, new AngleComparator(origin));

		PVector[] sorted = new PVector[to_sort.length];
		for(int i=0; i<sorted.length; i++) sorted[i] = sortable.get(i);
		return sorted;
	}

	private PVector[] sortVertices(PVector[] to_sort, PVector sort_from){
		ArrayList<PVector> sortable = new ArrayList<PVector>();
		for(PVector p : to_sort) sortable.add(p);
		Collections.sort(sortable, new DistanceComparator(sort_from));

		PVector[] sorted = new PVector[to_sort.length];
		for(int i=0; i<sorted.length; i++) sorted[i] = sortable.get(i);
		return sorted;
	}

	public PVector[][] getEdges(){
		PVector[][] edges = {
			{this.vertices[0], this.vertices[1]},
			{this.vertices[1], this.vertices[2]},
			{this.vertices[2], this.vertices[0]}
		};

		return edges;
	}

	public PShape getShape(){
		if(this.SHAPE==null){
			this.SHAPE = createShape();
			this.SHAPE.beginShape(POLYGON);
				this.SHAPE.vertex(this.vertices[0].x, this.vertices[0].y);
				this.SHAPE.vertex(this.vertices[1].x, this.vertices[1].y);
				this.SHAPE.vertex(this.vertices[2].x, this.vertices[2].y);
			this.SHAPE.endShape(CLOSE);
			this.SHAPE.disableStyle();
		}
		return this.SHAPE;
	}

	public color getShade(){
		if(this.SHADE==-1) this.SHADE = color(255 * sq(map(degrees(PVector.angleBetween(new PVector(mouseX, mouseY).normalize(), PVector.add(this.vertices[0], this.vertices[1]).add(this.vertices[2]))), 0, 90, 1, 0)));
		return this.SHADE;
	}

	public color getColor(){
		if(this.COLOR==-1) this.COLOR = color(255 * sq(map(degrees(PVector.angleBetween(this.vertices[0], this.vertices[1])), 0, 90, 1, 0)), 255 * sq(map(degrees(PVector.angleBetween(this.vertices[1], this.vertices[2])), 0, 90, 1, 0)), 255 * sq(map(degrees(PVector.angleBetween(this.vertices[2], this.vertices[0])), 0, 90, 1, 0)));
		return this.COLOR;
	}

	//------------------------------------------------------------
	// CIRCUMCIRCLE

	// see https://en.wikipedia.org/wiki/Circumscribed_circle#Circumcircle_equations
	public PVector getCenter(){
		if(this.CENTER==null){
			PVector a = this.vertices[0], b = this.vertices[1], c = this.vertices[2];
			float
				d = 2*(a.x*(b.y-c.y) + b.x*(c.y-a.y) + c.x*(a.y-b.y)),
				x = ((sq(a.x)+sq(a.y))*(b.y-c.y)+(sq(b.x)+sq(b.y))*(c.y-a.y)+(sq(c.x)+sq(c.y))*(a.y-b.y))/d,
				y = ((sq(a.x)+sq(a.y))*(c.x-b.x)+(sq(b.x)+sq(b.y))*(a.x-c.x)+(sq(c.x)+sq(c.y))*(b.x-a.x))/d;
			this.CENTER = new PVector(x,y);
		}
		return this.CENTER;
	}

	public float getRadius(){
		if(this.RADIUS==-1){
			float
				a = PVector.dist(this.vertices[0], this.vertices[1]),
				b = PVector.dist(this.vertices[1], this.vertices[2]),
				c = PVector.dist(this.vertices[2], this.vertices[0]);
			this.RADIUS = (a*b*c) / sqrt((a+b+c)*(b+c-a)*(c+a-b)*(a+b-c));
		}
		return this.RADIUS;
	}
}