package com.spopia.infra.modules.comment;

import java.time.LocalDateTime;

public class Comment {
	private String seq;
	private String comment;
	private String createdAt;
	private Integer createdBy;
	private String modifiedAt;
	private Integer modifiedBy;
	private Integer game_seq;
	private Integer article_seq;
	private Integer gcDelNy;
	private Integer acDelNy;
	private String name;
	private String Id;
	private Integer gender;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getId() {
		return Id;
	}
	public void setId(String id) {
		Id = id;
	}
	public Integer getGender() {
		return gender;
	}
	public void setGender(Integer gender) {
		this.gender = gender;
	}
	public Integer getGcDelNy() {
		return gcDelNy;
	}
	public void setGcDelNy(Integer gcDelNy) {
		this.gcDelNy = gcDelNy;
	}
	public Integer getAcDelNy() {
		return acDelNy;
	}
	public void setAcDelNy(Integer acDelNy) {
		this.acDelNy = acDelNy;
	}
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public String getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(String createdAt) {
		this.createdAt = createdAt;
	}
	public Integer getCreatedBy() {
		return createdBy;
	}
	public void setCreatedBy(Integer createdBy) {
		this.createdBy = createdBy;
	}
	public String getModifiedAt() {
		return modifiedAt;
	}
	public void setModifiedAt(String modifiedAt) {
		this.modifiedAt = modifiedAt;
	}
	public Integer getModifiedBy() {
		return modifiedBy;
	}
	public void setModifiedBy(Integer modifiedBy) {
		this.modifiedBy = modifiedBy;
	}
	public Integer getGame_seq() {
		return game_seq;
	}
	public void setGame_seq(Integer game_seq) {
		this.game_seq = game_seq;
	}
	public Integer getArticle_seq() {
		return article_seq;
	}
	public void setArticle_seq(Integer article_seq) {
		this.article_seq = article_seq;
	}
}
