package com.kkaekkt.biz.user;

public class PersonVO {
	private int mno;
	private String id;
	private String password;
	private String name;
	private String phone;
	private int birth;
	private String address;
	private String email;
	private int state=1; //기본값 (작업전)
	
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public int getBirth() {
		return birth;
	}
	public void setBirth(int birth) {
		this.birth = birth;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	@Override
	public String toString() {
		return "PersonVO [mno=" + mno + ", id=" + id + ", password=" + password + ", name=" + name + ", phone=" + phone
				+ ", birth=" + birth + ", address=" + address + ", email=" + email + ", state=" + state + "]";
	}

	
}
