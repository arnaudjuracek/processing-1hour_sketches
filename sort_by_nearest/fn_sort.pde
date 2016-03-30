ArrayList<PVector> sort(ArrayList<PVector> to_sort, PVector... from){
	// OPTIONS
	int BUFFER_SIZE = 10; // 3 ; 10; 20
	boolean BUFFER = true;

	// (OPTIONAL) sort from a reference point to take the first
	// if not used, the sorting begins from the first chronological point
	if(from.length>0 && from[0]!=null) Collections.sort(to_sort, new DistanceComparator(from[0]));
	else Collections.sort(to_sort, new DistanceComparator(to_sort.get(0)));

	// create an empty array for the sorted points
	ArrayList<PVector> sorted = new ArrayList<PVector>();

	// populate with the first point from which the next will be sorted
	sorted.add(to_sort.get(0));

	// iterate through the array to sort
	Iterator<PVector> p_iter = to_sort.iterator();
	while(p_iter.hasNext()){
		// sort the array to sort from the nearest to the farthest
		Collections.sort(to_sort, new DistanceComparator(sorted.get(sorted.size()-1)));

		if(BUFFER){
			/*
			 * WORK
			 * IN
			 * PROGRESS
			 */


			// put in a buffer the n (n=BUFFER_SIZE) nearest points to sort
			// increasing the size of the buffer allows smoother sorting
			ArrayList<PVector> buffer = new ArrayList<PVector>();
			for(int i=0; i<min(to_sort.size(), BUFFER_SIZE); i++) buffer.add(to_sort.get(i));

			// DYNAMIC BUFFERING :
			// sort the buffer by nearest from the center of points to sort
			PVector centroid = to_sort.get(0).copy();
			for(PVector p : to_sort) centroid.add(p);
				centroid.div(to_sort.size());
				centroid.lerp(to_sort.get(0), .1);
			Collections.sort(buffer, new DistanceComparator(centroid));

			// // STATIC BUFFERING :
			// // sort the buffer by nearest from reference point
			// Collections.sort(buffer, new DistanceComparator((from.length>0) ? from[0] : new PVector(0,0)));

			// add the first point of the buffer to the sorted, then remove it from the array to sort
			sorted.add(buffer.get(0));
			to_sort.remove(buffer.get(0));
		}else{
			// the first point is the nearest from the last sorted point
			sorted.add(to_sort.get(0));
			// this point is now sorted, it can be removed from the array to sort
			to_sort.remove(0);
		}
	}
	return sorted;
}