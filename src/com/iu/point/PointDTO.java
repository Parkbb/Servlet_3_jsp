package com.iu.point;

public class PointDTO {
	
	//멤버변수의 접근지정자 private
	//getter setter
	//생성자는 디폴트 생성자 필요
	//멤버변수의 이름은 table의 컬럼명과 동일하게
	private int num;
	private String name;
	private int kor;
	private int eng;
	private int math;
	private int total;
	private double aver;
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getKor() {
		return kor;
	}
	public void setKor(int kor) {
		this.kor = kor;
	}
	public int getEng() {
		return eng;
	}
	public void setEng(int eng) {
		this.eng = eng;
	}
	public int getMath() {
		return math;
	}
	public void setMath(int math) {
		this.math = math;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public double getAver() {
		return aver;
	}
	public void setAver(double aver) {
		this.aver = aver;
	}
}
