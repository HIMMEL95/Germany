package com.spopia.infra.modules.member;

public class Member {
	
	// member Dto
	private String seq;
	private String name;
	private String id;
	private String email;
	private String pwd;
	private Integer gender;
	private String dob;
	private Integer radio_operator;
	private String phone;
	private String zip;
	private String address;
	private String address_detail;
	private String job;
	private String createdAt;
	private String modifiedAt;
	private Integer user_div;
	private Integer team;
	private Integer uDelNy;
	
	// teamUser Dto
	private String tuSeq;
	private Integer defaultNY;
	private Integer deleteNY;
	
	public String getTuSeq() {
		return tuSeq;
	}
	public void setTuSeq(String tuSeq) {
		this.tuSeq = tuSeq;
	}
	public Integer getDefaultNY() {
		return defaultNY;
	}
	public void setDefaultNY(Integer defaultNY) {
		this.defaultNY = defaultNY;
	}
	public Integer getDeleteNY() {
		return deleteNY;
	}
	public void setDeleteNY(Integer deleteNY) {
		this.deleteNY = deleteNY;
	}
	
	public Integer getuDelNy() {
		return uDelNy;
	}
	public void setuDelNy(Integer uDelNy) {
		this.uDelNy = uDelNy;
	}
	public Integer getTeam() {
		return team;
	}
	public void setTeam(Integer team) {
		this.team = team;
	}
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public Integer getGender() {
		return gender;
	}
	public void setGender(Integer gender) {
		this.gender = gender;
	}
	public String getDob() {
		return dob;
	}
	public void setDob(String dob) {
		this.dob = dob;
	}
	public Integer getRadio_operator() {
		return radio_operator;
	}
	public void setRadio_operator(Integer radio_operator) {
		this.radio_operator = radio_operator;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getZip() {
		return zip;
	}
	public void setZip(String zip) {
		this.zip = zip;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getAddress_detail() {
		return address_detail;
	}
	public void setAddress_detail(String address_detail) {
		this.address_detail = address_detail;
	}
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	public String getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(String createdAt) {
		this.createdAt = createdAt;
	}
	public String getModifiedAt() {
		return modifiedAt;
	}
	public void setModifiedAt(String modifiedAt) {
		this.modifiedAt = modifiedAt;
	}
	public Integer getUser_div() {
		return user_div;
	}
	public void setUser_div(Integer user_div) {
		this.user_div = user_div;
	}
}
