package com.spopia.infra.modules.game;

import java.sql.Date;
import java.sql.Time;
import java.time.LocalDateTime;

public class Game {

	private String seq;
	private Integer abroadNy;
	private Integer event;
	private Integer league;
	private Integer team_home;
	private Integer team_away;
	private Integer score_home;
	private Integer score_away;
	private String player_home;
	private String player_away;
	private Integer stadium;
	private Date gameDate;
	private Time gameDuration;
	private LocalDateTime createdAt;
	private Integer createdBy;
	private LocalDateTime modifiedAt;
	private Integer modifiedBy;
	private Integer gDelNy;
	public Integer getgDelNy() {
		return gDelNy;
	}
	public void setgDelNy(Integer gDelNy) {
		this.gDelNy = gDelNy;
	}
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
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
	public Integer getTeam_home() {
		return team_home;
	}
	public void setTeam_home(Integer team_home) {
		this.team_home = team_home;
	}
	public Integer getTeam_away() {
		return team_away;
	}
	public void setTeam_away(Integer team_away) {
		this.team_away = team_away;
	}
	public Integer getScore_home() {
		return score_home;
	}
	public void setScore_home(Integer score_home) {
		this.score_home = score_home;
	}
	public Integer getScore_away() {
		return score_away;
	}
	public void setScore_away(Integer score_away) {
		this.score_away = score_away;
	}
	public String getPlayer_home() {
		return player_home;
	}
	public void setPlayer_home(String player_home) {
		this.player_home = player_home;
	}
	public String getPlayer_away() {
		return player_away;
	}
	public void setPlayer_away(String player_away) {
		this.player_away = player_away;
	}
	public Integer getStadium() {
		return stadium;
	}
	public void setStadium(Integer stadium) {
		this.stadium = stadium;
	}
	public Date getGameDate() {
		return gameDate;
	}
	public void setGameDate(Date gameDate) {
		this.gameDate = gameDate;
	}
	public Time getGameDuration() {
		return gameDuration;
	}
	public void setGameDuration(Time gameDuration) {
		this.gameDuration = gameDuration;
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
}
