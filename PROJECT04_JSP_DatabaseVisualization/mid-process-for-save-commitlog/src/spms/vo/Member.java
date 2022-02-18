package spms.vo;

import java.util.Date;

public class Member {
	protected int mno;
	protected String mname;
	protected String id;
	protected String pwd;
	protected String rrn1;
	protected String rrn2;
	protected String phone1;
	protected String phone2;
	protected String phone3;
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
	public String getRrn1() {
		return rrn1;
	}
	public Member setRrn1(String rrn1) {
		this.rrn1 = rrn1;
		return this;
	}
	public String getRrn2() {
		return rrn2;
	}
	public Member setRrn2(String rrn2) {
		this.rrn2 = rrn2;
		return this;
	}
	public String getPhone1() {
		return phone1;
	}
	public Member setPhone1(String phone1) {
		this.phone1 = phone1;
		return this;
	}
	public String getPhone2() {
		return phone2;
	}
	public Member setPhone2(String phone2) {
		this.phone2 = phone2;
		return this;
	}
	public String getPhone3() {
		return phone3;
	}
	public Member setPhone3(String phone3) {
		this.phone3 = phone3;
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
