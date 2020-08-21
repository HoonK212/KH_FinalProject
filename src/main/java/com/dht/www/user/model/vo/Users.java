package com.dht.www.user.model.vo;

import java.sql.Date;

public class Users {

	private String id;
	private String pw;
	private String name;
	private String nick;
	private Date birth;
	private String gender;
	private String mail;
	private String tel;
	private String addr;
	private String post;
	private Date dates;
	private Date report;
	private int leave;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	public Date getBirth() {
		return birth;
	}
	public void setBirth(Date birth) {
		this.birth = birth;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getPost() {
		return post;
	}
	public void setPost(String post) {
		this.post = post;
	}
	public Date getDates() {
		return dates;
	}
	public void setDates(Date dates) {
		this.dates = dates;
	}
	public Date getReport() {
		return report;
	}
	public void setReport(Date report) {
		this.report = report;
	}
	public int getLeave() {
		return leave;
	}
	public void setLeave(int leave) {
		this.leave = leave;
	}
	
	@Override
	public String toString() {
		return "User [id=" + id + ", pw=" + pw + ", name=" + name + ", nick=" + nick + ", birth=" + birth + ", gender="
				+ gender + ", mail=" + mail + ", tel=" + tel + ", addr=" + addr + ", post=" + post + ", dates=" + dates
				+ ", report=" + report + ", leave=" + leave + "]";
	}
	
}
