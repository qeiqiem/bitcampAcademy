package spms.vo;

import java.sql.Date;

public class Post {
	protected int bno;
	protected int mno;
	protected int vw;
	protected int recommend;
	protected int comm;
	protected int pin;
	protected Date createdDate;
	protected String header;
	protected String title;
	protected String nname;
	protected String content;

	public int getVw() {
		return vw;
	}
	public Post setVw(int vw) {
		this.vw = vw;
		return this;
	}
	public int getRecommend() {
		return recommend;
	}
	public Post setRecommend(int recommend) {
		this.recommend = recommend;
		return this;
	}
	public int getComm() {
		return comm;
	}
	public Post setComm(int comm) {
		this.comm = comm;
		return this;
	}
	public int getPin() {
		return pin;
	}
	public Post setPin(int pin) {
		this.pin = pin;
		return this;
	}
	public int getBno() {
		return bno;
	}
	public Post setBno(int bno) {
		this.bno = bno;
		return this;
	}
	public String getHeader() {
		return header;
	}
	public Post setHeader(String header) {
		this.header = header;
		return this;
	}
	public int getMno() {
		return mno;
	}
	public Post setMno(int mno) {
		this.mno = mno;
		return this;
	}
	public String getTitle() {
		return title;
	}
	public Post setTitle(String title) {
		this.title = title;
		return this;
	}
	public String getNname() {
		return nname;
	}
	public Post setNname(String nname) {
		this.nname = nname;
		return this;
	}
	public String getContent() {
		return content;
	}
	public Post setContent(String content) {
		this.content = content;
		return this;
	}
	public Date getCreatedDate() {
		return createdDate;
	}
	public Post setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
		return this;
	}
	
}
