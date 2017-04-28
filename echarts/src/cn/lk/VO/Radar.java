package cn.lk.VO;

public class Radar {
	private int budget;
	private int spending;
	public int getBudget() {
		return budget;
	}
	public void setBudget(int budget) {
		this.budget = budget;
	}
	public int getSpending() {
		return spending;
	}
	public void setSpending(int spending) {
		this.spending = spending;
	}
	@Override
	public String toString() {
		return "Radar [budget=" + budget + ", spending=" + spending + "]";
	}
	public Radar(int budget, int spending) {
		super();
		this.budget = budget;
		this.spending = spending;
	}
	public Radar(){}
}
