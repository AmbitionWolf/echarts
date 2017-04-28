package cn.lk.VO;

public class Map {
	private String name;
	private float value;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public float getValue() {
		return value;
	}
	public void setValue(float value) {
		this.value = value;
	}
	
	public Map(String name, float value) {
		super();
		this.name = name;
		this.value = value;
	}
	@Override
	public String toString() {
		return "Map [name=" + name + ", value=" + value + "]";
	}
	public Map(){}
}
