public class Mouse{
	PVector COORD, TARGET;
	float EASING;

	Mouse(float easing){
		this.EASING = easing;

		this.COORD = new PVector(0, 0);
		this.TARGET = new PVector(0, 0);
	}

	void update(){
		PVector delta = new PVector(
			this.TARGET.x - this.COORD.x,
			this.TARGET.y - this.COORD.y);
		if(abs(delta.x)>1) this.COORD.x += delta.x * ( -Math.pow( 2, -10 * this.EASING ) + 1 );
		if(abs(delta.y)>1) this.COORD.y += delta.y * ( -Math.pow( 2, -10 * this.EASING ) + 1 );
	}
}