package com.dht.www.exercise.model.vo;

public class Grade {
	private int grade; // 등급
	private Double var; // 변수
	
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	public Double getVar() {
		return var;
	}
	public void setVar(Double var) {
		this.var = var;
	}
	
	@Override
	public String toString() {
		return "Grade [grade=" + grade + ", var=" + var + "]";
	}
}