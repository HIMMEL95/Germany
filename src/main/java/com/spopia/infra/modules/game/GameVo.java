package com.spopia.infra.modules.game;

import com.spopia.infra.common.base.BaseVo;

public class GameVo extends BaseVo{
	
	private String shOption;
	private String shValue;
	private Integer shDelNy;
	private Integer shDate;
	private String startDate;
	private String endDate;	
	private String gSeq;
	private String selectVal;
	
	public String getSelectVal() {
		return selectVal;
	}
	public void setSelectVal(String selectVal) {
		this.selectVal = selectVal;
	}
	
	public String getShOption() {
		return shOption;
	}
	public void setShOption(String shOption) {
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
	public Integer getShDate() {
		return shDate;
	}
	public void setShDate(Integer shDate) {
		this.shDate = shDate;
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
	public String getgSeq() {
		return gSeq;
	}
	public void setgSeq(String gSeq) {
		this.gSeq = gSeq;
	}
	
}
