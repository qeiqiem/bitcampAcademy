package com.kkaekkt.biz.map;

public class CoinSingleListVO {

	//세탁기 사양
	int eno;
	int cnt ;
	int price ;
	String ename;
	
	//부가서비스 사양조회
	int etcno;
	int etcprice;
	String etcname;
	
	
	public int getEno() {
		return eno;
	}
	public void setEno(int eno) {
		this.eno = eno;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getEname() {
		return ename;
	}
	public void setEname(String ename) {
		this.ename = ename;
	}
	public int getEtcno() {
		return etcno;
	}
	public void setEtcno(int etcno) {
		this.etcno = etcno;
	}
	public int getEtcprice() {
		return etcprice;
	}
	public void setEtcprice(int etcprice) {
		this.etcprice = etcprice;
	}
	public String getEtcname() {
		return etcname;
	}
	public void setEtcname(String etcname) {
		this.etcname = etcname;
	}
	@Override
	public String toString() {
		return "CoinSingleListVO [eno=" + eno + ", cnt=" + cnt + ", price=" + price + ", ename=" + ename + ", etcno="
				+ etcno + ", etcprice=" + etcprice + ", etcname=" + etcname + "]";
	}
	
	
	
	
	
}
