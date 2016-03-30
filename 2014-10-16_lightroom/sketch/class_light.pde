class Light{
	Light(){};

	void draw(){
		for(Box box : BOXES){
			if(!box.hover()){
				Rectangle r = box.HITBOX;
				PShape shadow = createShape();
					shadow.beginShape(QUAD_STRIP);
					shadow.noStroke();
					shadow.fill(COLOR_SHADOW);

				PVector a = new PVector(mouseX, mouseY), b, c;

				b = new PVector(r.x, r.y);
				c = extend_segment(a, b);
					shadow.vertex(b.x, b.y);
					shadow.vertex(c.x, c.y);

				b = new PVector(r.x + r.width*.5, r.y + r.height*.5);
				c = extend_segment(a, b);
					shadow.vertex(c.x, c.y);
					shadow.vertex(b.x, b.y);

				b = new PVector(r.x + r.width, r.y);
				c = extend_segment(a, b);
					shadow.vertex(c.x, c.y);
					shadow.vertex(b.x, b.y);

				b = new PVector(r.x + r.width*.5, r.y + r.height*.5);
				c = extend_segment(a, b);
					shadow.vertex(c.x, c.y);
					shadow.vertex(b.x, b.y);

				b = new PVector(r.x, r.y);
				c = extend_segment(a, b);
					shadow.vertex(b.x, b.y);
					shadow.vertex(c.x, c.y);

				b = new PVector(r.x + r.width, r.y + r.height);
				c = extend_segment(a, b);
					shadow.vertex(c.x, c.y);
					shadow.vertex(b.x, b.y);

				b = new PVector(r.x + r.width*.5, r.y + r.height*.5);
				c = extend_segment(a, b);
					shadow.vertex(c.x, c.y);
					shadow.vertex(b.x, b.y);

				b = new PVector(r.x, r.y + r.height);
				c = extend_segment(a, b);
					shadow.vertex(c.x, c.y);
					shadow.vertex(b.x, b.y);

				shadow.endShape(CLOSE);
				shape(shadow);
			}
		}
	}


}