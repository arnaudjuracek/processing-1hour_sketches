public class Grid{
	PGraphics IMAGE;
	int RESOLUTION;
	color
		BACKGROUND = #EEEEEE, // #303030, // 184
		FOREGROUND = #303030; // #EEEEEE; // 20

	Grid(int resolution, int... eq){
		this.RESOLUTION = resolution;
		this.EQ = eq.length > 0 ? eq[0] : int(random(this.EQ));

		// println("grid.RESOLUTION = " + resolution);
		// println("select_equation(" + this.EQ_EXP[this.EQ] + ")");

		this.IMAGE = this.render(resolution);
	}

	int EQ = 10;
	String[] EQ_EXP = {
		"noise(x,y)",
		"noise(x*y)",
		"noise(x+y)",
		"sin(x)",
		"sin(y)",
		"sin(x*y)",
		"(sin(x) + cos(y))*.5",
		"sin(exp(x)+exp(y))",
		"sin(exp(x*y))",
		"random(1)" };
	float select_equation(int x, int y){
		float R = 0;
		switch(EQ){
			case 0 : R = noise(x,y); break;
			case 1 : R = noise(x*y); break;
			case 2 : R = noise(x+y); break;
			case 3 : R = sin(x); break;
			case 4 : R = sin(y); break;
			case 5 : R = sin(x*y); break;
			case 6 : R = (sin(x) + cos(y))*.5; break;
			case 7 : R = sin(exp(x)+exp(y)); break;
			case 8 : R = sin(exp(x*y)); break;

			case 9 : R = random(1); break;
		}
		return R;
	}
	PGraphics render(int resolution){
		int w = resolution,
			h = resolution;
		float SCALE = (width-40) / resolution;

		PGraphics p = createGraphics(int(w*SCALE), int(h*SCALE));
			p.beginDraw();
				p.strokeWeight(1);
				// p.strokeWeight(2);
				p.stroke(this.FOREGROUND);

				int A = int(random(4));
				for(int x=1; x<w-1; x++){
					for(int y=1; y<h-1; y++){
						float R = this.select_equation(x,y);
						if(R <= .5 && x<w-1)
							p.line(
								(x)*SCALE,
								(y)*SCALE,
								(x+1)*SCALE,
								(y+0)*SCALE);
						else if(y<h-1)
							p.line(
								(x)*SCALE,
								(y)*SCALE,
								(x+0)*SCALE,
								(y+1)*SCALE);

						// float R = this.eq(x,y);
						if(R <= .5 && x<w-1 && y<h-1)
							p.line(
								(x)*SCALE,
								(y)*SCALE,
								(x+1)*SCALE,
								(y+1)*SCALE);
						else if(x>1 && y<h-1 && x<w-1)
							p.line(
								(x+1)*SCALE,
								(y)*SCALE,
								(x)*SCALE,
								(y+1)*SCALE);
					}
				}
			p.endDraw();
		return p;
	}

	void draw(){
		background(this.BACKGROUND);
		imageMode(CENTER);
		image(this.IMAGE, width*.5, height*.5);
	}
}