ArrayList<PVector> sort(ArrayList<PVector> to_sort, PVector... from){
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

		// the first point is the nearest from the last sorted point
		sorted.add(to_sort.get(0));

		// this point is now sorted, it can be removed from the array to sort
		to_sort.remove(0);
	}

	return sorted;
}