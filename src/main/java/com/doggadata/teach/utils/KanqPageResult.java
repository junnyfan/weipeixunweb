package com.doggadata.teach.utils;

import java.util.List;

public class KanqPageResult {
	private long total;
	private int pageSize=10;
	private int currentPage=1;
	private int pageCount;
	private List<?> rows;
	
	public KanqPageResult(){
		this.pageSize = 10;
		this.currentPage = 1;
	}
	
	public KanqPageResult(int currentPage, int pageSize){
		this.currentPage = currentPage;
		this.pageSize = pageSize;
	}

	public long getTotal() {
		return total;
	}

	public void setTotal(long total) {
		this.total = total;
		if(this.total > 0 && this.pageSize > 0){
			this.pageCount = (int) Math.ceil(this.total / this.pageSize);
		}
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
		if(this.total > 0 && this.pageSize > 0){
			this.pageCount = (int) Math.ceil(this.total / this.pageSize);
		}
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getPageCount() {
		return pageCount;
	}

	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}

	public List<?> getRows() {
		return rows;
	}

	public void setRows(List<?> rows) {
		this.rows = rows;
	}
}
