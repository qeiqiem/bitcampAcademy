package com.kkaekkt.biz.comm;

import java.sql.Date;

public class LaundryVO {
	private Date rsvDate;
	private int rsvNum;
	private String mname;
	private int dDay;
	private String laundry;
	private int count; 
	private String state;
	private int price;
	public String getLaundry() {
		return laundry;
	}
	public void setLaundry(String laundry) {
		this.laundry = laundry;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getState() {
		return state;
	}
	public Date getRsvDate() {
		return rsvDate;
	}
	public void setRsvDate(Date rsvDate) {
		this.rsvDate = rsvDate;
	}
	public int getRsvNum() {
		return rsvNum;
	}
	public void setRsvNum(int rsvNum) {
		this.rsvNum = rsvNum;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public int getdDay() {
		return dDay;
	}
	public void setdDay(int dDay) {
		this.dDay = dDay;
	}
	public void setState(String state) {
		this.state = state;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	@Override
	public String toString() {
		return "LaundryVO [rsvDate=" + rsvDate + ", rsvNum=" + rsvNum + ", mname=" + mname + ", dDay=" + dDay
				+ ", laundry=" + laundry + ", count=" + count + ", state=" + state + ", price=" + price + "]";
	}
	
}
