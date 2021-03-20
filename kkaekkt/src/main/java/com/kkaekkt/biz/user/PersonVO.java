package com.kkaekkt.biz.user;

public class PersonVO extends AccountVO{
	private int mno;
	private int birth;
	private int mtype=1; //기본값 (작업전)
	public void setMno(int mno) {
		this.mno = mno;
	}
	public void setBirth(int birth) {
		this.birth = birth;
	}
	public void setMtype(int mtype) {
		this.mtype = mtype;
	}
	@Override
	public String toString() {
		return "PersonVO [mno=" + mno + ", birth=" + birth + ", mtype=" + mtype + "]";
	}


}
