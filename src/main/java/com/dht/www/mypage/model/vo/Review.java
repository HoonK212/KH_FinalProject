package com.dht.www.mypage.model.vo;

import java.sql.Date;

public class Review {
	
	private int no;
	private int score;
	private String review;
	private Date dates;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public String getReview() {
		return review;
	}
	public void setReview(String review) {
		this.review = review;
	}
	public Date getDates() {
		return dates;
	}
	public void setDates(Date dates) {
		this.dates = dates;
	}
	
	@Override
	public String toString() {
		return "Review [no=" + no + ", score=" + score + ", review=" + review + ", dates=" + dates + "]";
	}
	
}
