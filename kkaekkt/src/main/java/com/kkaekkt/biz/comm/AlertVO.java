package com.kkaekkt.biz.comm;

public class AlertVO {
	private int sender;
	private String senderName;
	private int addressee;
	private String msg;
	private int typenum;
	private String typename;
	private String date;
	
	public void setMname(String mname) {
		this.senderName=mname;
	}
	public void setBname(String bname) {
		this.senderName=bname;
	}
	public String getSenderName() {
		return senderName;
	}
	public void setSenderName(String senderName) {
		this.senderName = senderName;
	}
	public int getTypenum() {
		return typenum;
	}
	public void setTypenum(int typenum) {
		this.typenum = typenum;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getTypename() {
		return typename;
	}
	public void setTypename(String typename) {
		this.typename = typename;
	}
	public int getSender() {
		return sender;
	}
	public void setSender(int sender) {
		this.sender = sender;
	}
	public int getAddressee() {
		return addressee;
	}
	public void setAddressee(int addressee) {
		this.addressee = addressee;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public int gettypenum() {
		return typenum;
	}
	public void settypenum(int typenum) {
		this.typenum = typenum;
	}
	@Override
	public String toString() {
		return "AlertVO [sender=" + sender + ", addressee=" + addressee + ", msg=" + msg + ", typenum=" + typenum + "]";
	}		
}
