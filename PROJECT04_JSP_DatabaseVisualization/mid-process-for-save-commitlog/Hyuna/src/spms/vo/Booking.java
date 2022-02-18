package spms.vo;

import java.sql.Date;

public class Booking {
	protected int bno, mno, nop, mark, comm;
	protected String header, title, nname, content, text, loc;
	protected Date cre_date, rdate;
	protected byte picture;
	
	public byte getPicture() {
		return picture;
	}
	public Booking setPicture(byte picture) {
		this.picture = picture;
		return this;
	}
	public int getComm() {
		return comm;
	}
	public Booking setComm(int comm) {
		this.comm = comm;
		return this;
	}
	public String getContent() {
		return content;
	}
	public Booking setContent(String content) {
		this.content = content;
		return this;
	}
	public int getBno() {
		return bno;
	}
	public Booking setBno(int bno) {
		this.bno = bno;
		return this;
	}
	public int getMno() {
		return mno;
	}
	public Booking setMno(int mno) {
		this.mno = mno;
		return this;
	}
	public int getNop() {
		return nop;
	}
	public Booking setNop(int nop) {
		this.nop = nop;
		return this;
	}
	public int getMark() {
		return mark;
	}
	public Booking setMark(int mark) {
		this.mark = mark;
		return this;
	}
	public String getHeader() {
		return header;
	}
	public Booking setHeader(String header) {
		this.header = header;
		return this;
	}
	public String getTitle() {
		return title;
	}
	public Booking setTitle(String title) {
		this.title = title;
		return this;
	}
	public String getNname() {
		return nname;
	}
	public Booking setNname(String nname) {
		this.nname = nname;
		return this;
	}
	public String getText() {
		return text;
	}
	public Booking setText(String text) {
		this.text = text;
		return this;
	}
	public String getLoc() {
		return loc;
	}
	public Booking setLoc(String loc) {
		this.loc = loc;
		return this;
	}
	public Date getCre_date() {
		return cre_date;
	}
	public Booking setCre_date(Date cre_date) {
		this.cre_date = cre_date;
		return this;
	}
	public Date getRdate() {
		return rdate;
	}
	public Booking setRdate(Date rdate) {
		this.rdate = rdate;
		return this;
	}
	
}
