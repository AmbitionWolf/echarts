package cn.lk.VO;

public class line {
	private String time;
	private int high;
	private int low;
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public int getHigh() {
		return high;
	}
	public void setHigh(int high) {
		this.high = high;
	}
	public int getLow() {
		return low;
	}
	public void setLow(int low) {
		this.low = low;
	}
	@Override
	public String toString() {
		return "line [time=" + time + ", high=" + high + ", low=" + low + "]";
	}
	public line(String time, int high, int low) {
		super();
		this.time = time;
		this.high = high;
		this.low = low;
	}
	public line(){}
}
