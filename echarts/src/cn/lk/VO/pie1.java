package cn.lk.VO;

public class pie1 {
	private String range;
	private String num;
		
	public String getRange() {
		return range;
	}

	public void setRange(String range) {
		this.range = range;
	}

	public String getNum() {
		return num;
	}

	public void setNum(String num) {
		this.num = num;
	}

	@Override
	public String toString() {
		return "pie1 [range=" + range + ", num=" + num + "]";
	}

	public pie1(String range, String num) {
		super();
		this.range = range;
		this.num = num;
	}

	public pie1(){}
}
