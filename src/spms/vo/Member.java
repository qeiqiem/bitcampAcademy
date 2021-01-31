package spms.vo;

import java.util.Date;

public class Member {
	protected int mno;
	protected String mname;
	protected String id;
	protected String pwd;
	protected String rrn;
	protected String phone;
	protected String address;
	protected String nname;
	protected Date createdDate;
	
	public int getMno() {
		return mno;
	}
	public Member setMno(int mno) {
		this.mno = mno;
		return this;
		
	}
	public String getMname() {
		return mname;
	}
	public Member setMname(String mname) {
		this.mname = mname;
		return this;
	}
	public String getId() {
		return id;
	}
	public Member setId(String id) {
		this.id = id;
		return this;
	}
	public String getPwd() {
		return pwd;
	}
	public Member setPwd(String pwd) {
		this.pwd = pwd;
		return this;
	}
	public String getRrn() {
		return rrn;
	}
	public Member setRrn(String rrn) {
		this.rrn = rrn;
		return this;
	}
	public String getPhone() {
		return phone;
	}
	public Member setPhone(String phone) {
		this.phone = phone;
		return this;
	}
	public String getAddress() {
		return address;
	}
	public Member setAddress(String address) {
		this.address = address;
		return this;
	}
	public String getNname() {
		return nname;
	}
	public Member setNname(String nname) {
		this.nname = nname;
		return this;
	}
	public Date getCreatedDate() {
		return createdDate;
	}
	public Member setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
		return this;
	}
}
