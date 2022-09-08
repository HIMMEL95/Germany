package com.spopia.infra.modules.comment;

import java.time.LocalDateTime;

public class Comment {
	private String seq;
	private String comment;
	private LocalDateTime createdAt;
	private Integer createdBy;
	private LocalDateTime modifiedAt;
	private Integer modifiedBy;
	private Integer game_seq;
	private Integer article_seq;
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
	public LocalDateTime getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(LocalDateTime createdAt) {
		this.createdAt = createdAt;
	}
	public Integer getCreatedBy() {
		return createdBy;
	}
	public void setCreatedBy(Integer createdBy) {
		this.createdBy = createdBy;
	}
	public LocalDateTime getModifiedAt() {
		return modifiedAt;
	}
	public void setModifiedAt(LocalDateTime modifiedAt) {
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
