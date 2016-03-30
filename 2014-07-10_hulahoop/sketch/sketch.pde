// inspired by http://pstk-way.tumblr.com/post/96095303070

void setup(){
size(600,400,P3D);
		ortho();
		noStroke();
}

void draw(){
	float S = 1;
	float
		speed = .1,
		h = cos(frameCount*.01) - .5;
	float[] H = {
		1 + sin(PI + frameCount*speed) * (h*.5),
		1 + cos(PI + frameCount*speed) * (h*.5),
		1 + sin(0  + frameCount*speed) * (h*.5),
		1 + cos(0  + frameCount*speed) * (h*.5)
	};

	background(255,255,250);
	translate(width*.5, height*.5);
	scale(height*.1);
	pushMatrix();
		rotateX(radians(-45));
		rotateY(radians(45));
		pushMatrix();
			translate(0,S*5,0);
			// top
				// squares
				fill(244,247,182);
				beginShape(); vertex(0,-H[1],0); vertex(0,-H[1],-S); vertex(S,-H[1],-S); vertex(S,-H[1],0); endShape(CLOSE);
				beginShape(); vertex(S*3,-H[2],0); vertex(S*3,-H[2],-S); vertex(S*4,-H[2],-S); vertex(S*4,-H[2],0); endShape(CLOSE);
				beginShape(); vertex(S*3,-H[3],-S*3); vertex(S*3,-H[3],-S*4); vertex(S*4,-H[3],-S*4); vertex(S*4,-H[3],-S*3); endShape(CLOSE);
				beginShape(); vertex(0,-H[0],-S*3); vertex(0,-H[0],-S*4); vertex(S,-H[0],-S*4); vertex(S,-H[0],-S*3); endShape(CLOSE);
				// pinks
				fill(249,150,172);
				beginShape(); vertex(0,-H[1],-S); vertex(0,-H[0],-S*3); vertex(S,-H[0],-S*3); vertex(S,-H[1],-S); endShape(CLOSE);
				beginShape(); vertex(S,-H[0],-S*3); vertex(S*3,-H[3],-S*3); vertex(S*3,-H[3],-S*4); vertex(S,-H[0],-S*4); endShape(CLOSE);
				beginShape(); vertex(S*3,-H[3],-S*3); vertex(S*3,-H[2],-S); vertex(S*4,-H[2],-S); vertex(S*4,-H[3],-S*3); endShape(CLOSE);
				beginShape(); vertex(S*3,-H[2],0); vertex(S,-H[1],0); vertex(S,-H[1],-S); vertex(S*3,-H[2],-S); endShape(CLOSE);
			// sides
				// in
				fill(94,211,188); beginShape(); vertex(0,-H[1],0); vertex(S,-H[1],0); vertex(S*3,-H[2],0); vertex(S*4,-H[2],0); vertex(S*4,0,0); vertex(0,0,0); endShape(CLOSE);
				fill(78,109,223); beginShape(); vertex(0,-H[1],0); vertex(0,-H[1],-S); vertex(0,-H[0],-S*3); vertex(0,-H[0],-S*4); vertex(0,0,-S*4); vertex(0,0,0); endShape(CLOSE);
				// out
				fill(94,211,188); beginShape(); vertex(S,-H[0],-S*3); vertex(S*3,-H[3],-S*3); vertex(S*3,0,-S*3); vertex(S,0,-S*3); endShape(CLOSE);
				fill(78,109,223); beginShape(); vertex(S*3,-H[3],-S*3); vertex(S*3,-H[2],-S); vertex(S*3,0,-S); vertex(S*3,0,-S*3); endShape(CLOSE);
		popMatrix();
	popMatrix();
}