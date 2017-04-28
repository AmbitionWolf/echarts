package cn.lk.VO;

public class Cloud {
	private String word;
	private int count;
	public String getWord() {
		return word;
	}
	public void setWord(String word) {
		this.word = word;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	@Override
	public String toString() {
		return "Cloud [word=" + word + ", count=" + count + "]";
	}
	public Cloud(String word, int count) {
		super();
		this.word = word;
		this.count = count;
	}
	public Cloud(){}
}
