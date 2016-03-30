class Box{
	Rectangle HITBOX;
	color COLOR = color(255);

	Box(float x, float y, float w, float h){
		this.HITBOX = new Rectangle(int(x), int(y), int(w), int(h));
	}

	boolean hover(){
		Rectangle h = this.HITBOX;
		return (mouseX > h.x && mouseX < h.x + h.width) && (mouseY > h.y && mouseY < h.y + h.height);
	}

	void draw(){
		noStroke();
		fill(this.COLOR);
		rect(this.HITBOX.x, this.HITBOX.y, this.HITBOX.width, this.HITBOX.height);
	}
}