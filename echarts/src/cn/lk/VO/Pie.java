package cn.lk.VO;

public class Pie {
	private String gender;
	private int num;
	
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	
	public Pie(String gender, int num) {
		super();
		this.gender = gender;
		this.num = num;
	}
	@Override
	public String toString() {
		return "Pie [gender=" + gender + ", num=" + num + "]";
	}
	
	public Pie(){}
	
}
