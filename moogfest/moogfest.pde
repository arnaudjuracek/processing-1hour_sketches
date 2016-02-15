// inspired by https://twitter.com/Moogfest/status/698230369502564354

import peasy.*;
PeasyCam CAM;

color BLUE = color(0, 0, 254);
color YELLOW = color(255, 164, 47);
color BLACK = color(0);
color WHITE = color(255);
boolean SHOW_SPHERE = true;

void setup(){
	size(800, 800, P3D);
	CAM = new PeasyCam(this, 800);
	CAM.setMinimumDistance(100);
	CAM.setMaximumDistance(1000);

	strokeWeight(2);
}

void draw(){
	background(BLUE);

	// translate(width*.5, height*.5);
	pushMatrix();

		rotateZ(PI*.25 - frameCount*.001);
		rotateY(PI*.75 - frameCount*.001);
		rotateX(PI*.75 - frameCount*.001);

		float radius = 200;
		float x, y, z;

		noStroke();
		fill(BLUE);
		sphereDetail(30);
		if(SHOW_SPHERE) sphere(radius);

		noFill();
		beginShape();
			for(float theta=0; theta<PI; theta+=(PI/30)){
				for(float phi=0; phi<TWO_PI; phi+=(TWO_PI/50)){
					float r = radius + 30*sq(noise(theta, phi)) + (100*noise(phi))*sq(sin(frameCount*.001)-cos(frameCount*.01));
					float t = theta
						+ (1-abs(map(theta, 0, PI, -1, 1)))*(
						 	.6*noise(cos(phi)) +
							.4*noise(phi)
						);



					x = r*sin(t)*cos(phi);
					y = r*sin(t)*sin(phi);
					z = r*cos(t);

					stroke(WHITE);
					if(r>radius+10) phi -= .1;
					if(r>radius+15) theta += .01;

					if(noise(phi, theta) > .5) vertex(x, y, z);
					else curveVertex(x, y, z);
				}
			}
		endShape();


		pushMatrix();
			translate(
				(radius+50)*sin(frameCount*.01%TWO_PI*sin(frameCount*.01))*cos(frameCount*.05%TWO_PI),
				(radius+50)*sin(frameCount*.01%TWO_PI*sin(frameCount*.02))*sin(frameCount*.05%TWO_PI),
				(radius+50)*cos(frameCount*.01%TWO_PI));
			noStroke();
			fill(YELLOW);
			sphereDetail(30);
			sphere(40);
		popMatrix();


		pushMatrix();
			translate(
				(radius+50)*sin(-frameCount*.005%TWO_PI)*cos(-frameCount*.001%TWO_PI),
				(radius+50)*sin(-frameCount*.005%TWO_PI)*sin(-frameCount*.001%TWO_PI),
				(radius+50)*cos(-frameCount*.005%TWO_PI));
			noStroke();
			fill(BLACK);
			box(40);
		popMatrix();


		pushMatrix();
			rotateX(frameCount*.001%TWO_PI);
			rotateX(frameCount*.002%TWO_PI);
			translate(0, radius + 100);
			pushMatrix();
				rotateX(PI*.5);
				noStroke();
				fill(WHITE);
				sphereDetail(1);
				sphere(40);
			popMatrix();
		popMatrix();

	popMatrix();
}

void keyPressed(){
	if(key == 's') SHOW_SPHERE = !SHOW_SPHERE;
}