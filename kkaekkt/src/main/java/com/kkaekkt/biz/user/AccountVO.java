package com.kkaekkt.biz.user;

public class AccountVO {
	private String id;
	private String password;
	private String name;
	private String phone;
	private String address;
	private String email;
	private int mtype;
	
	public void setId(String id) {
		this.id = id;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public void setMtype(int mtype) {
		this.mtype = mtype;
	}
}
