package com.kkaekkt.biz.user;

public class PersonVO extends AccountVO{
	private int mno;
	private int birth;
	private int mtype=1; //기본값 (작업전)
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public int getBirth() {
		return birth;
	}
	public void setBirth(int birth) {
		this.birth = birth;
	}
	public int getMtype() {
		return mtype;
	}
	public void setMtype(int mtype) {
		this.mtype = mtype;
	}

}
