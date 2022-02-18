package spms.vo;

import java.sql.Date;

public class Comm {
	protected int bno;
	protected int mno;
	protected String table;
	protected String nname;
	protected String content;
	protected Date createdDate;
	public String getTable() {
		return table;
	}
	public Comm setTable(String table) {
		this.table = table;
		return this;
	}
	public int getBno() {
		return bno;
	}
	public Comm setBno(int bno) {
		this.bno = bno;
		return this;
	}
	public int getMno() {
		return mno;
	}
	public Comm setMno(int mno) {
		this.mno = mno;
		return this;
	}
	public String getNname() {
		return nname;
	}
	public Comm setNname(String nname) {
		this.nname = nname;
		return this;
	}
	public String getContent() {
		return content;
	}
	public Comm setContent(String content) {
		this.content = content;
		return this;
	}
	public Date getCreatedDate() {
		return createdDate;
	}
	public Comm setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
		return this;
	}
}
