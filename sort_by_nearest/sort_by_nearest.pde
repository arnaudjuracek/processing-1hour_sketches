import java.util.Collections;
import java.util.Comparator;
import java.util.Iterator;

ArrayList<PVector> POINTS;
void setup(){
	size(1200, 800, P2D);

	// random points distribution
	POINTS = new ArrayList<PVector>();
	for(int i=0; i<2000; i++) POINTS.add(new PVector(random(25, width - 25), random(25, height - 25)));

	// sort from a reference point to take the first
	Collections.sort(POINTS, new DistanceComparator(new PVector(mouseX,mouseY)));


	ArrayList<PVector> to_sort = (ArrayList<PVector>) POINTS.clone();
	Iterator<PVector> p_iter = to_sort.iterator();
	ArrayList<PVector> sorted = new ArrayList<PVector>();
	sorted.add(POINTS.get(0));

	while(p_iter.hasNext()){
		PVector p = sorted.get(sorted.size()-1);
		Collections.sort(to_sort, new DistanceComparator(p));
		sorted.add(to_sort.get(0));
		to_sort.remove(0);
	}

	POINTS = (ArrayList<PVector>) sorted.clone();;
}

void draw(){
	background(30);
	strokeWeight(2);
	for(int c=1; c<POINTS.size(); c++){
		stroke(map(c, 0, POINTS.size(), 0, 255), 0, 200);
		line(POINTS.get(c).x, POINTS.get(c).y, POINTS.get(c-1).x, POINTS.get(c-1).y);
	}
}


void keyPressed(){
	setup();
}