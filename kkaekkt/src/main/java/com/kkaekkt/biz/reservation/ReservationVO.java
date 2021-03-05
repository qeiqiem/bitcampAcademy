package com.kkaekkt.biz.reservation;

import java.sql.Date;
import java.util.List;

public class ReservationVO {
	private int rsvNum;
	private int mno;
	private int bno;
	private Date rsvDate;
	private Date dDate;
	private String state;
	private List<LaundryVO> laundryList;
	private int price;
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
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public Date getRsvDate() {
		return rsvDate;
	}
	public void setRsvDate(Date rsvDate) {
		this.rsvDate = rsvDate;
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
		this.laundryList = laundryList;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	@Override
	public String toString() {
		return "ReservationVO [rsvNum=" + rsvNum + ", mno=" + mno + ", bno=" + bno + ", rsvDate=" + rsvDate + ", dDate="
				+ dDate + ", state=" + state + ", laundryList=" + laundryList + ", price=" + price + "]";
	}
}
