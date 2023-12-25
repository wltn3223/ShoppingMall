package com.mire.shop.model;

public class PagingCriteria {
    
	private int pageNum=1;	//������ ��ȣ
	private int amount=30;	//�������� ������ ����

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	@Override
	public String toString() {
		return "PagingCriteria [pageNum=" + pageNum + ", amount=" + amount + "]";
	}
}