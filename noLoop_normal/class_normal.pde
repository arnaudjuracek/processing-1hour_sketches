public class Normal{
	int GRID_SIZE;
	float ODD, EVEN;
	boolean[][] MATRIX;
	boolean HORIZONTAL;
	PGraphics IMAGE;

	color 
		BACKGROUND = #EEEEEE, // #303030, // 184
		FOREGROUND = #303030; // #EEEEEE; // 20

	Normal(int grid_size, float odd, float even, boolean... horizontal){
		this.GRID_SIZE = grid_size;
		this.ODD = odd;
		this.EVEN = even;

		this.HORIZONTAL = (horizontal.length > 0 && horizontal[0]);

		if(this.ODD+this.EVEN > 1){
			if(this.ODD > 1) this.ODD = random(1);
			this.EVEN = random(1 - this.ODD);
			// println("ODD + EVEN cannot be superior to 1.");
			// println("new ODD = "+ this.ODD);
			// println("new EVEN = "+ this.EVEN);
		}

		this.MATRIX = this.HORIZONTAL ? this.generate_vertical(int(width/grid_size), int(height/grid_size)) : this.generate_horizontal(int(width/grid_size), int(height/grid_size));
		this.IMAGE = this.render(this.MATRIX);
	}


	boolean[][] generate_vertical(int w, int h){
		boolean[][] b = new boolean[w][h];

		for(int x=0; x<w; x++){
			int n = x%2==0 ? int(h*this.EVEN) : int(h*this.ODD);
			while(n>0){
				int y = int( random(h) );
				if(!b[x][y] && !b[constrain(x-1, 0, w-1)][y] && !b[constrain(x+1, 0, w-1)][y]){
					b[x][y] = true;
					if(!b[x][(y+1)%h] && !b[constrain(x-1, 0, w-1)][(y+1)%h] && !b[constrain(x+1, 0, w-1)][(y+1)%h]){
						b[x][(y+1)%h] = true;
						n--;
					}
					n--;
				}
			}
		}
		return b;
	}

	boolean[][] generate_horizontal(int w, int h){
		boolean[][] b = new boolean[w][h];

		for(int y=0; y<h; y++){
			int n = y%2==0 ? int(w*this.EVEN) : int(w*this.ODD);
			while(n>0){
				int x = int( random(w) );
				if(!b[x][y] && !b[x][constrain(y-1, 0, h-1)] && !b[x][constrain(y+1, 0, h-1)]){
					b[x][y] = true;
					if(!b[(x+1)%w][y] && !b[x][constrain(y-1, 0, h-1)] && !b[x][constrain(y+1, 0, h-1)]){
						b[(x+1)%w][y] = true;
						n--;
					}
					n--;
				}
			}
		}
		return b;
	}

	PGraphics render(boolean[][] matrix){
		int w = matrix.length,
			h = matrix[0].length;

		PGraphics p = createGraphics(w - 2, h - 2);
			p.beginDraw();
				p.strokeWeight(1);
				p.stroke(this.FOREGROUND);
				for(int y=0; y<h; y++)
					for(int x=0; x<w; x++)
						if(matrix[x][y]) p.point(x, y);
			p.endDraw();
		return p;
	}

	void draw(){
		background(this.BACKGROUND);
		
		// fill(this.BACKGROUND, 20);
		// noStroke();
		// rect(0, 0, width, height);

		pushMatrix();
			scale(this.GRID_SIZE);
			image(this.IMAGE, 1, 1);
		popMatrix();
	}
}