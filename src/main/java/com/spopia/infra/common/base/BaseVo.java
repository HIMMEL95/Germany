package com.spopia.infra.common.base;

import com.spopia.infra.common.constants.Constants;

public class BaseVo {
	private int thisPage = 1;
	private int rowNumToShow = Constants.ROW_NUM_TO_SHOW;
	private int pageNumToShow = Constants.PAGE_NUM_TO_SHOW;
	
	private int totalRows;
	private int totalPages;
	private int startPage;
	private int endPage;
	
	private int startRnumForOracle = 1;                            // 쿼리 시작 row
    private int endRnumForOracle;                               // 쿼리 끝 row
    private Integer RNUM;

	private int startRnumForMysql = 0;
	
	// list
	private String[] checkboxSeqArray;

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
		
		setEndRnumForOracle((getRowNumToShow() * getThisPage()));
        setStartRnumForOracle((getEndRnumForOracle() - getRowNumToShow()) + 1);
        if (getStartRnumForOracle() < 1) setStartRnumForOracle(1);
		
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

	public String[] getCheckboxSeqArray() {
		return checkboxSeqArray;
	}

	public void setCheckboxSeqArray(String[] checkboxSeqArray) {
		this.checkboxSeqArray = checkboxSeqArray;
	}
	
	//oracle s
	public int getStartRnumForOracle() {
	    return startRnumForOracle;
	}
	
	public void setStartRnumForOracle(int startRnumForOracle) {
	    this.startRnumForOracle = startRnumForOracle;
	}
	
	public int getEndRnumForOracle() {
	    return endRnumForOracle;
	}
	
	public void setEndRnumForOracle(int endRnumForOracle) {
	    this.endRnumForOracle = endRnumForOracle;
	}
	
	public Integer getRNUM() {
	    return RNUM;
	}
	
	public void setRNUM(Integer rNUM) {
	    RNUM = rNUM;
	}
	//oracle e
}
