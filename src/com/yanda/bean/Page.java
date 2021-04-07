package com.yanda.bean;

public class Page {
	
	

	int currentPage; //当前页
	
	
	int allPage;  //总页数
	
	
	int dataNum;  //商品数/总记录数
	
	
	Object data;  //一个一个的商品对象


	public int getCurrentPage() {
		return currentPage;
	}


	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}


	public int getAllPage() {
		return allPage;
	}


	public void setAllPage(int allPage) {
		this.allPage = allPage;
	}


	public int getDataNum() {
		return dataNum;
	}


	public void setDataNum(int dataNum) {
		this.dataNum = dataNum;
	}


	public Object getData() {
		return data;
	}


	public void setData(Object data) {
		this.data = data;
	}


	
	
	


}
