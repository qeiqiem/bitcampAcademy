package com.kkaekkt.biz.map;

import java.util.List;

public class MapListVO {
	
	//세탁 리스트를 위한 
	int bno;
	String bname;
	String phone;
	String address;
	int content;
	String rdate;
	int grade;	
	
	//예약을 위한 유저 정보
	int mno;
	int totalPrice;
	int rbno;
	List<ResPayVO> resList;
	
	public List<ResPayVO> getResList() {
		return resList;
	}
	public void setResList(List<ResPayVO> resList) {
		this.resList = resList;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	public int getRbno() {
		return rbno;
	}
	public void setRbno(int rbno) {
		this.rbno = rbno;
	}
	public String getBname() {
		return bname;
	}
	public void setBname(String bname) {
		this.bname = bname;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public int getContent() {
		return content;
	}
	public void setContent(int content) {
		this.content = content;
	}
	public String getRdate() {
		return rdate;
	}
	public void setRdate(String rdate) {
		this.rdate = rdate;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	
	@Override
	public String toString() {
		return "MapListVO [bno=" + bno + ", bname=" + bname + ", phone=" + phone + ", address=" + address + ", content="
				+ content + ", rdate=" + rdate + ", grade=" + grade + ", mno=" + mno + ", totalPrice=" + totalPrice
				+ ", rbno=" + rbno + ", resList=" + resList + "]";
	}
	
	
	
		
	
	
	
}
