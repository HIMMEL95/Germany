package com.spopia.infra.modules.member;

import com.spopia.infra.common.base.BaseVo;

public class MemberVo extends BaseVo{
	
	private Integer shOption;
	private String shValue;
	private Integer shDelNy;
	private Integer shDate;
	private String startDate;
	private String endDate;	
	private String seq;
	private String mSeq;
	
	public String getmSeq() {
		return mSeq;
	}
	public void setmSeq(String mSeq) {
		this.mSeq = mSeq;
	}
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
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
}
