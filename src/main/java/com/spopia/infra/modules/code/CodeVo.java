package com.spopia.infra.modules.code;

import com.spopia.infra.common.constants.Constants;

public class CodeVo {
	
	private Integer shOption;
	private String shValue;
	private Integer shDelNy;
	private String ccSeq;
	private String startDate;
	private String endDate;
	private String shDate;
	public Integer getShOption() {
		return shOption;
	}
	public void setShOption(Integer shOption) {
		this.shOption = shOption;
	}
	public String getShValue() {
		return shValue;
	}
	public void setShValue(String shValue) {
		this.shValue = shValue;
	}
	public Integer getShDelNy() {
		return shDelNy;
	}
	public void setShDelNy(Integer shDelNy) {
		this.shDelNy = shDelNy;
	}
	public String getCcSeq() {
		return ccSeq;
	}
	public void setCcSeq(String ccSeq) {
		this.ccSeq = ccSeq;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getShDate() {
		return shDate;
	}
	public void setShDate(String shDate) {
		this.shDate = shDate;
	}
	
	private int thisPage = 1;
	private int rowNumToShow = Constants.ROW_NUM_TO_SHOW;
	private int pageNumToShow = Constants.PAGE_NUM_TO_SHOW;
	
	private int totalRows;
	private int totalPages;
	private int startPage;
	private int endPage;

	private int startRnumForMysql = 0;
	
	public void setParamsPaging(int totalRows) {
		setTotalRows(totalRows);
		
		if (getTotalRows() == 0) {
			setTotalPages(1);
		} else {
			setTotalPages(getTotalRows() / getRowNumToShow()); 
		}
		
		if (getTotalRows() % getRowNumToShow() > 0) {
			setTotalPages(getTotalPages() + 1);
		}
		
		if (getTotalPages() < getThisPage()) {
			setThisPage(getTotalPages());
		}
		
		setStartPage(((getThisPage() - 1) / getPageNumToShow()) * getPageNumToShow() + 1);
		setEndPage(getStartPage() + getPageNumToShow() - 1);
		
		if (getEndPage() > getTotalPages()) {
			setEndPage(getTotalPages());
		}
		
		if (thisPage == 1) {
			setStartRnumForMysql(0);
		} else {
			setStartRnumForMysql((getRowNumToShow() * (getThisPage()-1)));
		}
	}
	
	public int getThisPage() {
		return thisPage;
	}
	public void setThisPage(int thisPage) {
		this.thisPage = thisPage;
	}
	public int getRowNumToShow() {
		return rowNumToShow;
	}
	public void setRowNumToShow(int rowNumToShow) {
		this.rowNumToShow = rowNumToShow;
	}
	public int getPageNumToShow() {
		return pageNumToShow;
	}
	public void setPageNumToShow(int pageNumToShow) {
		this.pageNumToShow = pageNumToShow;
	}
	public int getTotalRows() {
		return totalRows;
	}
	public void setTotalRows(int totalRows) {
		this.totalRows = totalRows;
	}
	public int getTotalPages() {
		return totalPages;
	}
	public void setTotalPages(int totalPages) {
		this.totalPages = totalPages;
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
	public int getStartRnumForMysql() {
		return startRnumForMysql;
	}
	public void setStartRnumForMysql(int startRnumForMysql) {
		this.startRnumForMysql = startRnumForMysql;
	}
	
	
}
