void setup(){
	size(800, 800, P2D);
	noStroke();
}

float
	mrgn = 1.1;
int
	cols = 5,
	rows = 5;

PVector mouse = new PVector(0,0);

void draw(){
	background(240);
	fill(20);

	mouse.x = width*.5 + sin(frameCount*.03)*width*.5;
	mouse.y = height*.5 + cos(frameCount*.03)*height*.5;

	float
	 	w = width / ((cols+1)*mrgn),
	 	h = height / ((rows+1)*mrgn);

	for(int i=1; i<cols+1; i++){
		for(int j=1; j<rows+1; j++){
			float
				x = i*mrgn*w - w*.5,
				y = j*mrgn*h - h*.5;
			float
				d1 = (sin(i+j)*map(dist(x,y,mouse.x,mouse.y), 0, width*height, .3, 0) + cos(dist(x,y,mouse.x,mouse.y)*.01)) * h,
				d2 = (sin(i+1+j)*map(dist(x,y,mouse.x,mouse.y), 0, width*height, .3, 0) + cos(dist(x+w,y,mouse.x,mouse.y)*.01)) * h;

			beginShape(POLYGON);
				vertex(x,y+constrain(d1, 0, h));
				vertex(x+w,y+constrain(d2, 0, h));
				vertex(x+w,y+h+constrain(d2, -h, 0));
				vertex(x,y+h+constrain(d1, -h, 0));
			endShape(CLOSE);
		}
	}
}

void keyPressed(){
	if(key==' '){
		cols+=10;
		rows+=10;
	}
	if(key=='r'){
		cols = int(random(20));
		rows = int(random(20));
	}
	if(key=='c') cols = rows = 10;
}