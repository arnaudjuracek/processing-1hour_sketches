void setup(){
  size(400, 400, P3D);
  display("RNO", 3);
}

void draw(){
  filter(BLUR, 2);
  if(frameCount%2 == 0) filter(POSTERIZE, 3);
}

void display(String str, int step){
  background(20);
  textAlign(CENTER, CENTER);
  textSize(200);
  
  fill(0, 255, 0, 200);
  text(str, width*.5 - step, height*.5);
  fill(255, 0, 255, 200);
  text(str, width*.5 + step, height*.5);
  fill(255, 200);
  text(str, width*.5, height*.5);
}