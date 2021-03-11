package com.kkaekkt.biz.reservation;

import java.util.List;

public class ReservationListVO {
	private final int PAGES_PER_BLOCK=5;//한 블럭당 들어갈 페이지 개수
	private final int POSTS_PER_PAGE=5;//한 페이지당 보여줄 Post 개수
	private int totalPostCount; //총 Post 개수
	private int totalLastPageNum; // if(totalPostCount==0) {0} else {Math.ceil((double) totalPostCount / POSTS_PER_PAGE)};
	private int currentPageNum;//현재 페이지 번호 (Default=1)
	private int blockLastPageNum;//한 블럭에서 마지막 페이지 번호 = if(totalLastPageNum - totalLastPageNum % PAGES_PER_BLOCK >= currentPageNum) {(int)(Math.ceil((float)currentPageNum / PAGES_PER_BLOCK)*PAGES_PER_BLOCK)};
	private int blockFirstPageNum;//한 블럭에서 첫번째 페이지 번호 = blockLastPageNum-(PAGES_PER_BLOCK0-1);
	private int rowStartNum;
	private boolean isPrevExist=false;//이전 페이지가 존재하는가(Default=false)
	private boolean isNextExist;//다음 페이지가 존재하는가
	private boolean isPrevBlockExist=false;//이전 블럭이 존재하는가(Default=false)
	private boolean isNextBlockExist;
	private int no;
	private int state;
	private int dDay;
	private int laundryType;
	private String search;
	private int searchOption;
	private List<ReservationVO> rsvList;

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	public int getdDay() {
		return dDay;
	}

	public void setdDay(int dDay) {
		this.dDay = dDay;
	}

	public int getLaundryType() {
		return laundryType;
	}

	public void setLaundryType(int laundryType) {
		this.laundryType = laundryType;
	}

	public int getSearchOption() {
		return searchOption;
	}

	public void setSearchOption(int searchOption) {
		this.searchOption = searchOption;
	}

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

	public ReservationListVO setTotalPostCount(int totalPostCount) {
		this.totalPostCount = totalPostCount;
		if(totalPostCount==0) {
			totalLastPageNum=0;
		} else {
			totalLastPageNum=(int) Math.ceil((double) totalPostCount / POSTS_PER_PAGE);
		}
		return this;
	}

	public int getCurrentPageNum() {
		return currentPageNum;
	}

	public ReservationListVO setCurrentPageNum(int currentPageNum) {
		this.currentPageNum = currentPageNum;
		rowStartNum=(currentPageNum-1)*POSTS_PER_PAGE;
		return this;
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
	
	public int getPAGES_PER_BLOCK() {
		return PAGES_PER_BLOCK;
	}

	public int getPOSTS_PER_PAGE() {
		return POSTS_PER_PAGE;
	}
	
	public void booleanSet() {
		if((totalLastPageNum - totalLastPageNum % PAGES_PER_BLOCK) >= currentPageNum) {
			blockLastPageNum=(int)(Math.ceil((float)currentPageNum / PAGES_PER_BLOCK)*PAGES_PER_BLOCK);
			blockFirstPageNum=blockLastPageNum-(PAGES_PER_BLOCK-1);
		} else {
			blockLastPageNum=totalLastPageNum;
			blockFirstPageNum = (int) (Math.ceil((float)currentPageNum / PAGES_PER_BLOCK) * PAGES_PER_BLOCK)-(PAGES_PER_BLOCK - 1);
		}
		if(currentPageNum==totalLastPageNum) {
			isNextExist=false;
			isNextBlockExist=false;
		} else if(blockLastPageNum<totalLastPageNum) {
			isNextExist=true;
			isNextBlockExist=true;
		} else {
			isNextExist=true;
			isNextBlockExist=false;
		}
		if(currentPageNum!=1) {
			isPrevExist=true;
			if(blockFirstPageNum!=1) {
				isPrevBlockExist=true;
			} else {
				isPrevBlockExist=false;
			}
		}else {
			isPrevExist=false;
			isPrevBlockExist=false;
		}
	}

	@Override
	public String toString() {
		return "ReservationListVO [PAGES_PER_BLOCK=" + PAGES_PER_BLOCK + ", POSTS_PER_PAGE=" + POSTS_PER_PAGE
				+ ", totalPostCount=" + totalPostCount + ", totalLastPageNum=" + totalLastPageNum + ", currentPageNum="
				+ currentPageNum + ", blockLastPageNum=" + blockLastPageNum + ", blockFirstPageNum=" + blockFirstPageNum
				+ ", isPrevExist=" + isPrevExist + ", isNextExist=" + isNextExist + ", isPrevBlockExist="
				+ isPrevBlockExist + ", isNextBlockExist=" + isNextBlockExist + ", no=" + no + ", state=" + state
				+ ", dDay=" + dDay + ", laundryType=" + laundryType + ", search=" + search + ", searchOption="
				+ searchOption + ", rsvList=" + rsvList + "]";
	}
	
}
