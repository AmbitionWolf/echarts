package cn.lk.VO;

public class Map1 {
	private String fromName;
	private String toName;
	private int value;
	public String getFromName() {
		return fromName;
	}
	public void setFromName(String fromName) {
		this.fromName = fromName;
	}
	public String getToName() {
		return toName;
	}
	public void setToName(String toName) {
		this.toName = toName;
	}
	public int getValue() {
		return value;
	}
	public void setValue(int value) {
		this.value = value;
	}
	@Override
	public String toString() {
		return "Map1 [fromName=" + fromName + ", toName=" + toName + ", value=" + value + "]";
	}
	public Map1(String fromName, String toName, int value) {
		super();
		this.fromName = fromName;
		this.toName = toName;
		this.value = value;
	}
	public Map1(){}
}
