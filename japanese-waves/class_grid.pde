public class Grid{
	Mouse mouse;
	int MARGIN;

	Grid(int margin){
		this.mouse = new Mouse(.05);
		this.MARGIN = margin;
	}

	void render(){
		this.mouse.update();

		background(184);
		stroke(20);
		strokeWeight(1);
		noFill();

		for(int y=this.MARGIN; y<height-this.MARGIN; y+=this.MARGIN){
			beginShape();
			for(int x=this.MARGIN; x<width-this.MARGIN; x+=this.MARGIN){
				PVector v = this.FISH(
					x + this.MARGIN*cos( (x+y) + frameCount*.1*noise(y) )*.5,
					y + this.MARGIN*sin( (x+y) + frameCount*.1*noise(y) )*.5);
				curveVertex(v.x, v.y);
			}
			endShape();
		}
	}

	PVector FISH(float x, float y){
		float
			q = 1,
			k = .01,
			vx = x - this.mouse.COORD.x,
			vy = y - this.mouse.COORD.y,
			norm = sqrt( sq(vx) + sq(vy) );

		return new PVector(
			this.mouse.COORD.x + vx*( norm + (q*norm/( 1 + (pow(k*norm, 3)))) ) / norm,
			this.mouse.COORD.y + vy*( norm + (q*norm/( 1 + (pow(k*norm, 3)))) ) / norm);
	}
}