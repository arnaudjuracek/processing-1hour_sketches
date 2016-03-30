PGraphics gen(){
	PGraphics p = createGraphics(width, height);
		p.beginDraw();
			p.background(255);
			// p.image(get(), 0, 0);
		p.endDraw();
	p.loadPixels();

	int x = int(width*.5),
		y = int(height*.5);
	for(int i=0; i<p.pixels.length*100; i++){
		int x_factor = int(random(-1.5,1.5)),
			y_factor = int(random(-1.5,1.5));
		
			x += x_factor;
			y += y_factor;

		int index = constrain(x + y*width, 0, p.pixels.length-1);
		p.pixels[index] = color( constrain( brightness(p.pixels[index]) - 3, 0, 255) );
	}
	p.updatePixels();
	return p;
}