ArrayList<Triangle> triangulate(ArrayList<PVector> _points, PVector... sort_from){
	// DELAUNAY TRIANGULATION
	// see pseudocode @ http://paulbourke.net/papers/triangulate/
	// subroutine triangulate
	// input : vertex list
	// output : triangle list

	// sort the vertex list for better efficiency
	ArrayList<PVector> points = (ArrayList<PVector>) _points.clone();
		// sort radially from a point
		if(sort_from.length>0 && sort_from[0]!=null) Collections.sort(points, new DistanceComparator(sort_from[0]));
		// else Collections.sort(points, new DistanceComparator(points.get(points.size()-1)));
		else Collections.sort(points, new AngleComparator(new PVector(width/2, height/2)));

		// sort from neighbor to neigbor, see https://github.com/arnaudjuracek/processing-1hour_sketches/tree/master/sort_by_nearest
		// if(sort_from.length>0 && sort_from[0]!=null) points = sort(points, sort_from[0]);
		// else points = sort(points);

	// initialize the triangle list
	ArrayList<Triangle> triangles = new ArrayList<Triangle>();

	// determine the supertriangle
	Triangle supertriangle = new Triangle(new PVector(width/2, height/2), 1000);
	// add supertriangle vertices to the end of the vertex list
	for(PVector p : supertriangle.vertices) points.add(p);
	// add the supertriangle to the triangle list
	triangles.add(supertriangle);

	// for each sample point in the vertex list
	for(PVector p : points){
		// initialize the edge buffer
		ArrayList<PVector[]> edges = new ArrayList<PVector[]>();

		// for each triangle currently in the triangle list
		Iterator<Triangle> t_iter = triangles.iterator();
		while(t_iter.hasNext()){
			Triangle t = t_iter.next();
			// calculate the triangle circumcircle center and radius
			// if the point lies in the triangle circumcircle then
			if(PVector.dist(p, t.getCenter()) < t.getRadius()){
				// add the three triangle edges to the edge buffer
				for(PVector[] e : t.getEdges()) edges.add(e);
				// remove the triangle from the triangle list
				t_iter.remove();
				triangles.remove(t);
			}
		 }

		// delete all doubly specified edges from the edge buffer : this leaves the edges of the enclosing polygon only
		// using http://stackoverflow.com/a/33590358
		for(int i=0; i<edges.size()-1; i++){
			for(int j = i+1; j < edges.size(); j++){
				if((edges.get(i)[0] == edges.get(j)[1] && edges.get(i)[1] == edges.get(j)[0]) || (edges.get(i)[1] == edges.get(j)[1] && edges.get(i)[0] == edges.get(j)[0])){
					edges.remove(j);
					edges.remove(i);
				}
			}
		}

		// add to the triangle list all triangles formed between the point and the edges of the enclosing polygon
		for(PVector[] e : edges) triangles.add(new Triangle(e[0], e[1], p));
	}

	// remove any triangles from the triangle list that use the supertriangle vertices
	Iterator<Triangle> t_iter = triangles.iterator();
	while(t_iter.hasNext()){
		Triangle t = t_iter.next();
		boolean r = false;
		for(PVector v : t.vertices){
			for(PVector s : supertriangle.vertices){
				if(v==s){
					r = true;
					break;
				}
			}
		}
		if(r) t_iter.remove();
	}

	// remove the supertriangle vertices from the vertex list
	triangles.remove(supertriangle);

	return triangles;
}