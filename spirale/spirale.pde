//boolean sketchFullScreen(){ return true; }

//Toolbox toolbox;

void setup() {
  //size(displayWidth, displayHeight);
  size(800,600);
  colorMode(HSB);
  noStroke();

  //toolbox = new Toolbox(this);
    //toolbox.ease(.05);
    //toolbox.gui(0, height-30, width, 30, color(0,230));
      //toolbox.gui.slider(
        //"timeX", "" , -1, 1, 0.01,
        //5, 5,
        //width-10, 20);
      // toolbox.gui.toggle("","", false, 520, 10, 25, 25);
      // toolbox.gui.toggle("","", false, 555, 10, 25, 25);
      // toolbox.gui.toggle("","", false, 590, 10, 25, 25);
      // toolbox.gui.button("gifExport","", width-35, 10, 25, 25);
}


float a = 100, timeX = 0;

void draw(){
  background(50);

 // toolbox.ease.set("x",width-mouseX);
  //toolbox.ease.set("y",height-mouseY);

   a += millis() * map(mouseX,0,width,-1,1) * .0000005;
  //a += millis() * timeX * .0000005;
  // a += millis() * .0000001 * noise(a);

  for(int i=1; i<300; i++){
    pushMatrix();
      translate(
        width*.5  + ( i * (width-mouseX - width*.5 ) )*.001, 
        height*.5 + ( i * (height-mouseY - height*.5) )*.001
      );
      rotate(i*a);
      fill(
        (255*.9)*abs(sin(a)) + (255*.1)*(i%2),
        (100*.8) + map(i,1,255,0,255)*.2, 
        map(i,1,255,100,255)
      );
      rect(i-5, i-5, 50+i, 50+i);
    popMatrix();
  }

  //toolbox.update();
  //if(mouseY>height-50) toolbox.gui.show(); else toolbox.gui.hide();
}
