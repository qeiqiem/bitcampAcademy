package com.kkaekkt.biz.user;

public class PaymentVO {
	private int pno;
	private String payment;
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}
	public String getPayment() {
		return payment;
	}
	public void setPayment(String payment) {
		this.payment = payment;
	}
	@Override
	public String toString() {
		return "PaymentVO [pno=" + pno + ", payment=" + payment + "]";
	}
	
}
