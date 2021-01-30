package spms.vo;

public class Page {
	int curPage;
	int lastPage;
	int startNum;
	int endNum;
	int movePage;
	int startRow;
	int totalCount;
	final double criteria=10.0;
	String search;
	String filter;
	String option;
	String order="bno"; //default 설정
	
	public double getCriteria() {
		return criteria;
	}
	public int getStartRow() {
		return startRow;
	}
	public Page setStartRow(int startRow) {
		this.startRow = startRow;
		return this;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public Page setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		return this;
	}
	public int getMovePage() {
		return movePage;
	}
	public Page setMovePage(int movePage) {
		this.movePage = movePage;
		return this;
	}
	public String getOrder() {
		return order;
	}
	public Page setOrder(String order) {
		this.order = order;
		return this;
	}
	public int getStartNum() {
		return startNum;
	}
	public Page setStartNum(int startNum) {
		this.startNum = startNum;
		return this;
	}
	public int getEndNum() {
		return endNum;
	}
	public Page setEndNum(int endNum) {
		this.endNum = endNum;
		return this;
	}
	public int getCurPage() {
		return curPage;
	}
	public Page setCurPage(int curPage) {
		this.curPage = curPage;
		return this;
	}
	public int getLastPage() {
		return lastPage;
	}
	public Page setLastPage(int lastPage) {
		this.lastPage = lastPage;
		return this;
	}
	public String getSearch() {
		return search;
	}
	public Page setSearch(String search) {
		this.search = search;
		return this;
	}
	public String getFilter() {
		return filter;
	}
	public Page setFilter(String filter) {
		this.filter = filter;
		return this;
	}
	public String getOption() {
		return option;
	}
	public Page setOption(String option) {
		this.option = option;
		return this;
	}
	
	
}
