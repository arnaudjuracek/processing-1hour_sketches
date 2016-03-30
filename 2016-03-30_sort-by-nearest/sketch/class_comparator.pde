public class DistanceComparator implements Comparator<PVector>{
	private PVector point;
	public DistanceComparator(PVector node){ this.point = node; }

	public int compare(PVector n1, PVector n2){
		float d1 = 0, d2 = 0;

		try{
			if(n1 != null && n2 != null){
				d1 = PVector.dist(this.point, n1);
				d2 = PVector.dist(this.point, n2);
			}
		}catch(Exception e){
			throw new RuntimeException("Error while comparing !");
		}

		return (n1 == null) ? -1 : ((n2 == null) ? 1 : ((Comparable<Float>) d1).compareTo(d2));
	}

}