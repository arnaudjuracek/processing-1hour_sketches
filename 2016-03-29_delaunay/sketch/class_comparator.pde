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

public class AngleComparator implements Comparator<PVector>{
	private PVector point;
	public AngleComparator(PVector node){ this.point = node; }

	public int compare(PVector n1, PVector n2){
		float d1 = 0, d2 = 0;

		try{
			if(n1 != null && n2 != null){
				d1 = PVector.angleBetween(n1, this.point);
				d2 = PVector.angleBetween(n2, this.point);
			}
		}catch(Exception e){
			throw new RuntimeException("Error while comparing !");
		}

		return (n1 == null) ? -1 : ((n2 == null) ? 1 : ((Comparable<Float>) d1).compareTo(d2));
	}

}

public class XComparator implements Comparator<PVector>{
	private PVector point;
	public XComparator(PVector node){ this.point = node; }

	public int compare(PVector n1, PVector n2){
		float d1 = 0, d2 = 0;

		try{
			if(n1 != null && n2 != null){
				d1 = dist(0, this.point.x, 0, n1.x);
				d2 = dist(0, this.point.x, 0, n2.x);
			}
		}catch(Exception e){
			throw new RuntimeException("Error while comparing !");
		}

		return (n1 == null) ? -1 : ((n2 == null) ? 1 : ((Comparable<Float>) d1).compareTo(d2));
	}

}

public class YComparator implements Comparator<PVector>{
	private PVector point;
	public YComparator(PVector node){ this.point = node; }

	public int compare(PVector n1, PVector n2){
		float d1 = 0, d2 = 0;

		try{
			if(n1 != null && n2 != null){
				d1 = dist(0, this.point.y, 0, n1.x);
				d2 = dist(0, this.point.y, 0, n2.x);
			}
		}catch(Exception e){
			throw new RuntimeException("Error while comparing !");
		}

		return (n1 == null) ? -1 : ((n2 == null) ? 1 : ((Comparable<Float>) d1).compareTo(d2));
	}

}