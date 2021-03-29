package com.kkaekkt.biz.map;

public class MapListVO {
	
	//laundryinfo-------------------------
	int bno;
	String bname;
	String phone;
	String address;
	int content;
	String rdate;
	int grade;
	
	
	
	
	public String getBname() {
		return bname;
	}
	public void setBname(String bname) {
		this.bname = bname;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public int getContent() {
		return content;
	}
	public void setContent(int content) {
		this.content = content;
	}
	public String getRdate() {
		return rdate;
	}
	public void setRdate(String rdate) {
		this.rdate = rdate;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	
	
	@Override
	public String toString() {
		return "MapListVO [bname=" + bname + ", phone=" + phone + ", address=" + address + ", content=" + content
				+ ", rdate=" + rdate + ", grade=" + grade + "]";
	}

		
	
	
	
}
