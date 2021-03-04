package com.kkaekkt.biz.reservation;

public class LaundryVO {
	private int lno;
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
	public void setState(String state) {
		this.state = state;
	}
	
	public int getLno() {
		return lno;
	}
	public void setLno(int lno) {
		this.lno = lno;
	}
	
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	@Override
	public String toString() {
		return "LaundryVO [lno=" + lno + ", laundry=" + laundry + ", count=" + count + ", state=" + state + ", price="
				+ price + "]";
	}
}
