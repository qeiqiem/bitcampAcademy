package com.kkaekkt.biz.reservation;

import java.sql.Date;
import java.util.List;

import com.kkaekkt.biz.comm.CommVO;
import com.kkaekkt.biz.comm.LaundryVO;

public class ReservationVO {
	private int rsvNum; // 예약번호
	private int bno;
	private String mname; // 회원명
	private String bname; // 업체명
	private Date rsvDate; // 예약일자
	private String phone; // 전화번호
	private Date dDate; // 마감일자
	private int dDay; //마감까지 남은 일자
	private String state; // 상태명
	private int like; // 0.좋아요X 1.좋아요O
	private int timeOut; //0.취소불가 1.취소가능
	private int totalPrice; // 총 금액
	private int count; // ex. 일반의류 외 count 개
	private List<LaundryVO> laundryList; // 품목리스트
	private List<CommVO> commList; //리뷰 리스트
	
	public List<CommVO> getCommList() {
		return commList;
	}
	public void setCommList(List<CommVO> commList) {
		this.commList = commList;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public int getLike() {
		return like;
	}
	public void setLike(int like) {
		this.like = like;
	}
	public int getTimeOut() {
		return timeOut;
	}
	public void setTimeOut(int timeOut) {
		this.timeOut = timeOut;
	}
	public int getdDay() {
		return dDay;
	}
	public void setdDay(int dDay) {
		this.dDay = dDay;
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
}
