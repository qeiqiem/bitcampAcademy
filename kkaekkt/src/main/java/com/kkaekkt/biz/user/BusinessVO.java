package com.kkaekkt.biz.user;

import java.util.List;

import com.kkaekkt.biz.comm.CommVO;
import com.kkaekkt.biz.comm.EquipmentVO;
import com.kkaekkt.biz.comm.EtcVO;
import com.kkaekkt.biz.comm.LaundryVO;
import com.kkaekkt.biz.comm.ScheduleVO;

@SuppressWarnings("serial")
public class BusinessVO{
	private int bno;
	private int mno;
	private String id;
	private String password;
	private String bname;
	private String address;
	private String phone;
	private String email;
	private String comment;
	private int bizType; //1. 일반 세탁소, 2. 코인 세탁소
	private int bankNum;
	private String bankAccountNum;
	private List<ScheduleVO> scheduleList;
	private List<EquipmentVO> equipmentList;
	private List<LaundryVO> laundryList;
	private List<EtcVO> etcList;
	private List<CommVO> commList;
	private String equipment;
	private String laundry;
	private String schedule;
	private String etc; //부가서비스
	private double eval; //평가
	private int commCount; //댓글 개수
	
	public int getCommCount() {
		return commCount;
	}
	public void setCommCount(int commCount) {
		this.commCount = commCount;
	}
	public List<CommVO> getCommList() {
		return commList;
	}
	public void setCommList(List<CommVO> commList) {
		this.commList = commList;
	}
	public double getEval() {
		return eval;
	}
	public void setEval(double eval) {
		this.eval = eval;
	}
	public List<EtcVO> getEtcList() {
		return etcList;
	}
	public void setEtcList(List<EtcVO> etcList) {
		this.etcList = etcList;
	}
	public String getEtc() {
		return etc;
	}
	public void setEtc(String etc) {
		this.etc = etc;
	}
	public String getLaundry() {
		return laundry;
	}
	public void setLaundry(String laundry) {
		this.laundry = laundry;
	}
	public int getBankNum() {
		return bankNum;
	}
	public void setBankNum(int bankNum) {
		this.bankNum = bankNum;
	}
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
	public int getBizType() {
		return bizType;
	}
	public void setBizType(int bizType) {
		this.bizType = bizType;
	}

	public String getBankAccountNum() {
		return bankAccountNum;
	}
	public void setBankAccountNum(String bankAccountNum) {
		this.bankAccountNum = bankAccountNum;
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
	public List<ScheduleVO> getScheduleList() {
		return scheduleList;
	}
	public void setScheduleList(List<ScheduleVO> scheduleList) {
		this.scheduleList = scheduleList;
	}
	public String getSchedule() {
		return schedule;
	}
	public void setSchedule(String schedule) {
		this.schedule = schedule;
	}
	@Override
	public String toString() {
		return "BusinessVO [bno=" + bno + ", mno=" + mno + ", id=" + id + ", password=" + password + ", bname=" + bname
				+ ", address=" + address + ", phone=" + phone + ", email=" + email + ", comment=" + comment
				+ ", bizType=" + bizType + ", bankNum=" + bankNum + ", bankAccountNum=" + bankAccountNum
				+ ", scheduleList=" + scheduleList + ", equipmentList=" + equipmentList + ", laundryList=" + laundryList
				+ ", equipment=" + equipment + ", laundry=" + laundry + ", schedule=" + schedule + "]";
	}

	
}
