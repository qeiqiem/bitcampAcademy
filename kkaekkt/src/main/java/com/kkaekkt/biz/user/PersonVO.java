package com.kkaekkt.biz.user;

public class PersonVO extends AccountVO {
//	private int mno;
	private String mname;
	private int birth;
	private int state=1; //기본값 (작업전)
//	private String phone;
//	private String address;
	//private String email;
//	private String id;
//	private String password;

	
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public int getBirth() {
		return birth;
	}
	public void setBirth(int birth) {
		this.birth = birth;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
@Override
public String toString() {
	return "PersonVO [mname=" + mname + ", birth=" + birth + ", state=" + state + "]";
}
	
	
	
}
