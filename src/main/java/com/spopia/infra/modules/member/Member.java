package com.spopia.infra.modules.member;

import org.springframework.web.multipart.MultipartFile;

import com.spopia.infra.common.base.Base;

public class Member extends Base {
	
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
	private String extraAddress;
    private String job;
	private String createdAt;
	private String modifiedAt;
	private Integer user_div;
	private Integer team;
	private Integer uDelNy;
	private String newPassword;
	private Integer sns_type;
	private Integer abroadNy;
	private Integer event;
	private Integer league;
	private String token;
	private String team_seq;
	
    // teamUser Dto
	private String tuSeq;
	private Integer defaultNY;
	private Integer deleteNY;
	
	//image upload
	private MultipartFile[] profileImage;
	private Integer[] process;
	private String[] pathFile;
	private String[] fileSeq;
	private String snsImg;
	private String snsId;
	private String sns_id;
	
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
	public String getExtraAddress() {
		return extraAddress;
	}
	public void setExtraAddress(String extraAddress) {
		this.extraAddress = extraAddress;
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
	public Integer getTeam() {
		return team;
	}
	public void setTeam(Integer team) {
		this.team = team;
	}
	public Integer getuDelNy() {
		return uDelNy;
	}
	public void setuDelNy(Integer uDelNy) {
		this.uDelNy = uDelNy;
	}
	public String getNewPassword() {
		return newPassword;
	}
	public void setNewPassword(String newPassword) {
		this.newPassword = newPassword;
	}
	public Integer getSns_type() {
		return sns_type;
	}
	public void setSns_type(Integer sns_type) {
		this.sns_type = sns_type;
	}
	public Integer getAbroadNy() {
		return abroadNy;
	}
	public void setAbroadNy(Integer abroadNy) {
		this.abroadNy = abroadNy;
	}
	public Integer getEvent() {
		return event;
	}
	public void setEvent(Integer event) {
		this.event = event;
	}
	public Integer getLeague() {
		return league;
	}
	public void setLeague(Integer league) {
		this.league = league;
	}
	public String getToken() {
		return token;
	}
	public void setToken(String token) {
		this.token = token;
	}
	public String getTeam_seq() {
		return team_seq;
	}
	public void setTeam_seq(String team_seq) {
		this.team_seq = team_seq;
	}
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
	public MultipartFile[] getProfileImage() {
		return profileImage;
	}
	public void setProfileImage(MultipartFile[] profileImage) {
		this.profileImage = profileImage;
	}
	public Integer[] getProcess() {
		return process;
	}
	public void setProcess(Integer[] process) {
		this.process = process;
	}
	public String[] getPathFile() {
		return pathFile;
	}
	public void setPathFile(String[] pathFile) {
		this.pathFile = pathFile;
	}
	public String[] getFileSeq() {
		return fileSeq;
	}
	public void setFileSeq(String[] fileSeq) {
		this.fileSeq = fileSeq;
	}
	public String getSnsImg() {
		return snsImg;
	}
	public void setSnsImg(String snsImg) {
		this.snsImg = snsImg;
	}
	public String getSnsId() {
		return snsId;
	}
	public void setSnsId(String snsId) {
		this.snsId = snsId;
	}
	public String getSns_id() {
		return sns_id;
	}
	public void setSns_id(String sns_id) {
		this.sns_id = sns_id;
	}
}
