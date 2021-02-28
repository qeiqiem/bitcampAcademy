package com.kkaekkt.bit.user;

import java.util.Arrays;
import java.util.Map;

public class BusinessVO {
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
	private int typeNum; //1. 일반 세탁소, 2. 코인 세탁소
	private int bankNum;
	private int accountNum;
	//private int paymentTypeNum; //결제수단 번호 지금은 카드밖에 없어서 의미가 없는 항목 (테이블도 마찬가지)
	private int[] equipmentNum; //설비번호
	private int[] count; //설비의 개수
	private int[] price; //설비의 이용가격
	private Map<Integer, Integer> laundry; //품목번호가 key, 품목세탁금액이 value
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
	public int getTypeNum() {
		return typeNum;
	}
	public void setTypeNum(int typeNum) {
		this.typeNum = typeNum;
	}
	public int getBankNum() {
		return bankNum;
	}
	public void setBankNum(int bankNum) {
		this.bankNum = bankNum;
	}
	public int getAccountNum() {
		return accountNum;
	}
	public void setAccountNum(int accountNum) {
		this.accountNum = accountNum;
	}
//	public int getPaymentTypeNum() {
//		return paymentTypeNum;
//	}
//	public void setPaymentTypeNum(int paymentTypeNum) {
//		this.paymentTypeNum = paymentTypeNum;
//	}
	public int[] getEquipmentNum() {
		return equipmentNum;
	}
	public void setEquipmentNum(int[] equipmentNum) {
		this.equipmentNum = equipmentNum;
	}
	public int[] getCount() {
		return count;
	}
	public void setCount(int[] count) {
		this.count = count;
	}
	public int[] getPrice() {
		return price;
	}
	public void setPrice(int[] price) {
		this.price = price;
	}
	public Map<Integer, Integer> getLaundry() {
		return laundry;
	}
	public void setLaundry(Map<Integer, Integer> laundry) {
		this.laundry = laundry;
	}
	@Override
	public String toString() {
		return "BusinessVO [bno=" + bno + ", mno=" + mno + ", id=" + id + ", password=" + password + ", bname=" + bname
				+ ", address=" + address + ", phone=" + phone + ", email=" + email + ", comment=" + comment + ", time="
				+ time + ", typeNum=" + typeNum + ", bankNum=" + bankNum + ", accountNum=" + accountNum
				+ ", equipmentNum=" + Arrays.toString(equipmentNum) + ", count="
				+ Arrays.toString(count) + ", price=" + Arrays.toString(price) + ", laundry=" + laundry + "]";
	}
	
	
}
