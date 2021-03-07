package com.kkaekkt.biz.reservation;

import java.sql.Date;
import java.util.List;

public class ReservationVO {
	private int rsvNum;
	private int mno;
	private String bname;
	private Date rsvDate;
	private String phone;
	private Date dDate;
	private String state;
	private List<LaundryVO> laundryList;
	private int totalPrice;
	private int count;
	public int getRsvNum() {
		return rsvNum;
	}
	public void setRsvNum(int rsvNum) {
		this.rsvNum = rsvNum;
	}
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public String getBname() {
		return bname;
	}
	public void setBname(String bname) {
		this.bname = bname;
	}
	public Date getRsvDate() {
		return rsvDate;
	}
	public void setRsvDate(Date rsvDate) {
		this.rsvDate = rsvDate;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public Date getdDate() {
		return dDate;
	}
	public void setdDate(Date dDate) {
		this.dDate = dDate;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public List<LaundryVO> getLaundryList() {
		return laundryList;
	}
	public void setLaundryList(List<LaundryVO> laundryList) {
		this.totalPrice=0;
		this.laundryList = laundryList;
		this.count=laundryList.size()-1;
		for(LaundryVO lv : laundryList) {
			totalPrice+=lv.getPrice();
		};
	}
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	public int getCount() {
		return count;
	}
	@Override
	public String toString() {
		return "ReservationVO [rsvNum=" + rsvNum + ", mno=" + mno + ", bname=" + bname + ", rsvDate=" + rsvDate
				+ ", phone=" + phone + ", dDate=" + dDate + ", state=" + state + ", laundryList=" + laundryList
				+ ", totalPrice=" + totalPrice + "]";
	}
	
}
