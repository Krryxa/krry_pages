package com.krry.entity;

/**
 * 
 * Params
 * @author krry
 * @version 1.0.0
 *
 */
public class Params {

	private Integer pageSize = 5;
	private Integer pageNo = 0;
	

	public Integer getPageNo() {
		return pageNo;
	}

	public void setPageNo(Integer pageNo) {
		this.pageNo = pageNo;
	}
	
	public Integer getPageSize() {
		return pageSize;
	}

	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}

}
