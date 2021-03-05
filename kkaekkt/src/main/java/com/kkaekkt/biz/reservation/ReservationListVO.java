package com.kkaekkt.biz.reservation;

import java.util.List;

public class ReservationListVO {
	private final int PAGES_PER_BLOCK=5;//한 블럭당 들어갈 페이지 개수
	private final int POSTS_PER_PAGE=10;//한 페이지당 보여줄 Post 개수
	private int totalPostCount; //총 Post 개수
	private int totalLastPageNum; // if(totalPostCount==0) {0} else {Math.ceil((double) totalPostCount / POSTS_PER_PAGE)};
	private int currentPageNum=1;//현재 페이지 번호 (Default=1)
	private int blockLastPageNum;//한 블럭에서 마지막 페이지 번호 = if(totalLastPageNum - totalLastPageNum % PAGES_PER_BLOCK >= currentPageNum) {(int)(Math.ceil((float)currentPageNum / PAGES_PER_BLOCK)*PAGES_PER_BLOCK)};
	private int blockFirstPageNum;//한 블럭에서 첫번째 페이지 번호 = blockLastPageNum-PAGES_PER_BLOCK-1;
	private boolean isPrevExist=false;//이전 페이지가 존재하는가(Default=false)
	private boolean isNextExist;//다음 페이지가 존재하는가
	private String search;
	private String option;
	private List<ReservationVO> rsvList;
	
	public List<ReservationVO> getRsvList() {
		return rsvList;
	}

	public ReservationListVO setRsvList(List<ReservationVO> rsvList) {
		this.rsvList = rsvList;
		return this;
	}

	public int getTotalPostCount() {
		return totalPostCount;
	}

	public void setTotalPostCount(int totalPostCount) {
		this.totalPostCount = totalPostCount;
	}

	public int getTotalLastPageNum() {
		return totalLastPageNum;
	}

	public void setTotalLastPageNum(int totalLastPageNum) {
		this.totalLastPageNum = totalLastPageNum;
	}

	public int getCurrentPageNum() {
		return currentPageNum;
	}

	public void setCurrentPageNum(int currentPageNum) {
		this.currentPageNum = currentPageNum;
	}

	public int getBlockLastPageNum() {
		return blockLastPageNum;
	}

	public void setBlockLastPageNum(int blockLastPageNum) {
		this.blockLastPageNum = blockLastPageNum;
	}

	public int getBlockFirstPageNum() {
		return blockFirstPageNum;
	}

	public void setBlockFirstPageNum(int blockFirstPageNum) {
		this.blockFirstPageNum = blockFirstPageNum;
	}

	public boolean isPrevExist() {
		return isPrevExist;
	}

	public void setPrevExist(boolean isPrevExist) {
		this.isPrevExist = isPrevExist;
	}

	public boolean isNextExist() {
		return isNextExist;
	}

	public void setNextExist(boolean isNextExist) {
		this.isNextExist = isNextExist;
	}

	public String getSearch() {
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}

	public String getOption() {
		return option;
	}

	public void setOption(String option) {
		this.option = option;
	}

	public int getPAGES_PER_BLOCK() {
		return PAGES_PER_BLOCK;
	}

	public int getPOSTS_PER_PAGE() {
		return POSTS_PER_PAGE;
	}

	@Override
	public String toString() {
		return "ReservationListVO [PAGES_PER_BLOCK=" + PAGES_PER_BLOCK + ", POSTS_PER_PAGE=" + POSTS_PER_PAGE
				+ ", totalPostCount=" + totalPostCount + ", totalLastPageNum=" + totalLastPageNum + ", currentPageNum="
				+ currentPageNum + ", blockLastPageNum=" + blockLastPageNum + ", blockFirstPageNum=" + blockFirstPageNum
				+ ", isPrevExist=" + isPrevExist + ", isNextExist=" + isNextExist + ", search=" + search + ", option="
				+ option + ", rsvList=" + rsvList + "]";
	}
	
	


}
