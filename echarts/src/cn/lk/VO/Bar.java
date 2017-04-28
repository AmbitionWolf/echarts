package cn.lk.VO;

public class Bar {
	private String time;
	private int waterin;
	private int waterout;
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public int getWaterin() {
		return waterin;
	}
	public void setWaterin(int waterin) {
		this.waterin = waterin;
	}
	public int getWaterout() {
		return waterout;
	}
	public void setWaterout(int waterout) {
		this.waterout = waterout;
	}
	@Override
	public String toString() {
		return "bar [time=" + time + ", waterin=" + waterin + ", waterout=" + waterout + "]";
	}
	public Bar(String time, int waterin, int waterout) {
		super();
		this.time = time;
		this.waterin = waterin;
		this.waterout = waterout;
	}
	public Bar(){}
}
