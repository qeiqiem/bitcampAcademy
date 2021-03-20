package com.kkaekkt.biz.user;

import java.util.List;

import com.kkaekkt.biz.comm.CommVO;
import com.kkaekkt.biz.comm.EquipmentVO;
import com.kkaekkt.biz.comm.EtcVO;
import com.kkaekkt.biz.comm.LaundryVO;
import com.kkaekkt.biz.comm.ScheduleVO;

@SuppressWarnings("serial")
public class BusinessVO extends AccountVO{
	private int bno;
	private int mno;
	private String bname;
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
	private int eCount; //평가 개수
	private int commCount; //댓글 개수
	
	public void setBno(int bno) {
		this.bno = bno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public void setBname(String bname) {
		this.bname = bname;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public void setBizType(int bizType) {
		this.bizType = bizType;
	}
	public void setBankNum(int bankNum) {
		this.bankNum = bankNum;
	}
	public void setBankAccountNum(String bankAccountNum) {
		this.bankAccountNum = bankAccountNum;
	}
	public void setScheduleList(List<ScheduleVO> scheduleList) {
		this.scheduleList = scheduleList;
	}
	public void setEquipmentList(List<EquipmentVO> equipmentList) {
		this.equipmentList = equipmentList;
	}
	public void setLaundryList(List<LaundryVO> laundryList) {
		this.laundryList = laundryList;
	}
	public void setEtcList(List<EtcVO> etcList) {
		this.etcList = etcList;
	}
	public void setCommList(List<CommVO> commList) {
		this.commList = commList;
	}
	public void setEquipment(String equipment) {
		this.equipment = equipment;
	}
	public void setLaundry(String laundry) {
		this.laundry = laundry;
	}
	public void setSchedule(String schedule) {
		this.schedule = schedule;
	}
	public void setEtc(String etc) {
		this.etc = etc;
	}
	public void setEval(double eval) {
		this.eval = eval;
	}
	public void seteCount(int eCount) {
		this.eCount = eCount;
	}
	public void setCommCount(int commCount) {
		this.commCount = commCount;
	}
	
	@Override
	public String toString() {
		return "BusinessVO [bno=" + bno + ", mno=" + mno + ", bname=" + bname + ", comment=" + comment + ", bizType="
				+ bizType + ", bankNum=" + bankNum + ", bankAccountNum=" + bankAccountNum + ", scheduleList="
				+ scheduleList + ", equipmentList=" + equipmentList + ", laundryList=" + laundryList + ", etcList="
				+ etcList + ", commList=" + commList + ", equipment=" + equipment + ", laundry=" + laundry
				+ ", schedule=" + schedule + ", etc=" + etc + ", eval=" + eval + ", eCount=" + eCount + ", commCount="
				+ commCount + "]";
	}

	
}
