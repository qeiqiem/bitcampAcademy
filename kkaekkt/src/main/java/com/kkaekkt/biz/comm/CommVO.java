package com.kkaekkt.biz.comm;

public class CommVO {
	private int rsvNum; //댓글이 달린 주문번호
	private int mno;//회원번호
	private int bno; //사업자 번호
	private int depth; //0.댓글 1.대댓글
	private int eval;//평가
	private String content; 
	
	public int getEval() {
		return eval;
	}
	public void setEval(int eval) {
		this.eval = eval;
	}
	public int getRsvNum() {
		return rsvNum;
	}
	public void setRsvNum(int rsvNum) {
		this.rsvNum = rsvNum;
	}
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}

	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public int getDepth() {
		return depth;
	}
	public void setDepth(int depth) {
		this.depth = depth;
	}
	
}
