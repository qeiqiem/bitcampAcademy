package com.kkaekkt.biz.user;

import java.util.List;

import com.kkaekkt.biz.comm.Criteria;

public class BusinessListVO extends Criteria{
	private int mno;//회원번호
	private List<BusinessVO> bsList; // 업체리스트
	
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public List<BusinessVO> getBsList() {
		return bsList;
	}
	public void setBsList(List<BusinessVO> bsList) {
		this.bsList = bsList;
	}	
}
