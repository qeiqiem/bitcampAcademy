package com.kkaekkt.biz.comm;

import java.util.List;

public class CommListVO extends Criteria{
	private int order; // 정렬 : 1.등록 순  2.평점 순
	private int orderType; // 정렬유형 : 1=오름차순, 2=내림차순
	private String search; //검색어
	private int searchOption; // 1.이름   2.주문번호 조회 3.평점
	private List<CommVO> commList;
	
	public int getOrder() {
		return order;
	}
	public void setOrder(int order) {
		this.order = order;
	}
	public int getOrderType() {
		return orderType;
	}
	public void setOrderType(int orderType) {
		this.orderType = orderType;
	}
	public String getSearch() {
		return search;
	}
	public void setSearch(String search) {
		this.search = search;
	}
	public int getSearchOption() {
		return searchOption;
	}
	public void setSearchOption(int searchOption) {
		this.searchOption = searchOption;
	}
	public List<CommVO> getCommList() {
		return commList;
	}
	public void setCommList(List<CommVO> commList) {
		this.commList = commList;
	}
	@Override
	public String toString() {
		return "CommListVO [order=" + order + ", orderType=" + orderType + ", search=" + search + ", searchOption="
				+ searchOption + "]";
	}	
}
