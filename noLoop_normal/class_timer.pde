public class Timer{
	float
		LAST,
		DURATION;
	boolean TICK;

	Timer(float duration_in_millis){
		this.LAST = millis();
		this.DURATION = duration_in_millis;
	}

	void update(){
		if(this.LAST + this.DURATION < millis()){
			this.TICK = true;
			this.LAST = millis();
		}else this.TICK = false;
	}
}