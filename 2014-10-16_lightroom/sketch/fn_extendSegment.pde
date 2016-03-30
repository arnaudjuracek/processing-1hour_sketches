PVector extend_segment(PVector a, PVector b){
	PVector	c = new PVector(0, 0);

	float l = sqrt( sq(a.x - b.x) + sq(a.y - b.y) );
	c.x = b.x + (b.x - a.x) / l * 10000;
	c.y = b.y + (b.y - a.y) / l * 10000;

	return c;
}