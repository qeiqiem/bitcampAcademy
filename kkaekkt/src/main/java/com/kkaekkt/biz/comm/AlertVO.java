package com.kkaekkt.biz.comm;

public class AlertVO {
	private int sender;
	private int addressee;
	private String msg;
	private int typeNum;
	
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
	public int getTypeNum() {
		return typeNum;
	}
	public void setTypeNum(int typeNum) {
		this.typeNum = typeNum;
	}
	@Override
	public String toString() {
		return "AlertVO [sender=" + sender + ", addressee=" + addressee + ", msg=" + msg + ", typeNum=" + typeNum + "]";
	}		
}
