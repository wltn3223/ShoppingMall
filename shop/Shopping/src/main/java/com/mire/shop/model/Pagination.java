package com.mire.shop.model;

public class Pagination {
	private int page; // 현재 페이지
	private int range; // 현재 페이지 범위
	private int listCnt; // 전체 게시물 개수
	private int pageCnt; // 전체 페이지 범위 수
	private int listSize; // 한페이지당 보여질 리스트 수
	private int rangeSize; // 한 페이지에 보여질 페이지 갯수
	private int startPage; // 시작페이지 번호
	private int startList;
	private int endPage; // 끝페이지 번호
	private boolean prev; // 이전페이지
	private boolean next; // 다음 페이지

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getRange() {
		return range;
	}

	public void setRange(int range) {
		this.range = range;
	}

	public int getListCnt() {
		return listCnt;
	}

	public void setListCnt(int listCnt) {
		this.listCnt = listCnt;
	}

	public int getPageCnt() {
		return pageCnt;
	}

	public void setPageCnt(int pageCnt) {
		this.pageCnt = pageCnt;
	}

	public int getListSize() {
		return listSize;
	}

	public void setListSize(int listSize) {
		this.listSize = listSize;
	}

	public int getRangeSize() {
		return rangeSize;
	}

	public void setRangeSize(int rangeSize) {
		this.rangeSize = rangeSize;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public void pageInfo(int page, int range, int listCnt) {
		this.page = page;
		this.range = range;
		this.listCnt = listCnt;

		this.pageCnt = (int) Math.ceil(listCnt / listSize);

		this.startPage = (range - 1) * rangeSize + 1;

		this.endPage = range * rangeSize;

		this.startList = (page - 1) * listSize;

		this.prev = range == 1 ? false : true;

		this.next = endPage > pageCnt ? false : true;
		if (this.endPage > this.pageCnt) {
			this.endPage = this.pageCnt;
			this.next = false;
		}

	}

}
