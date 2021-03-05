package com.kkaekkt.biz.user;

import java.io.Serializable;
import java.util.List;

import com.kkaekkt.biz.reservation.LaundryVO;

@SuppressWarnings("serial")
public class BusinessVO implements Serializable {
	private int bno;
	private int mno;
	private String id;
	private String password;
	private String bname;
	private String address;
	private String phone;
	private String email;
	private String comment;
	private String time; //ex. 월 09~20시
	private int bizType; //1. 일반 세탁소, 2. 코인 세탁소
	private int bankAccountNum;
	private List<PaymentVO> paymentList;
	private List<EquipmentVO> equipmentList;
	private List<LaundryVO> laundryList;
	private String equipment;
	
	public String getEquipment() {
		return equipment;
	}
	public void setEquipment(String equipment) {
		this.equipment = equipment;
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
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getBname() {
		return bname;
	}
	public void setBname(String bname) {
		this.bname = bname;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public int getBizType() {
		return bizType;
	}
	public void setBizType(int bizType) {
		this.bizType = bizType;
	}
	public int getBankAccountNum() {
		return bankAccountNum;
	}
	public void setBankAccountNum(int bankAccountNum) {
		this.bankAccountNum = bankAccountNum;
	}
	public List<PaymentVO> getPaymentList() {
		return paymentList;
	}
	public void setPaymentList(List<PaymentVO> paymentList) {
		this.paymentList = paymentList;
	}
	public List<EquipmentVO> getEquipmentList() {
		return equipmentList;
	}
	public void setEquipmentList(List<EquipmentVO> equipmentList) {
		this.equipmentList = equipmentList;
	}
	public List<LaundryVO> getLaundryList() {
		return laundryList;
	}
	public void setLaundryList(List<LaundryVO> laundryList) {
		this.laundryList = laundryList;
	}
	@Override
	public String toString() {
		return "BusinessVO [bno=" + bno + ", mno=" + mno + ", id=" + id + ", password=" + password + ", bname=" + bname
				+ ", address=" + address + ", phone=" + phone + ", email=" + email + ", comment=" + comment + ", time="
				+ time + ", bizType=" + bizType + ", bankAccountNum=" + bankAccountNum + ", paymentList=" + paymentList
				+ ", equipmentList=" + equipmentList + ", laundryList=" + laundryList + ", equipment=" + equipment
				+ "]";
	}

	
	
}
