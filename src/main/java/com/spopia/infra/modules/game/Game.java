package com.spopia.infra.modules.game;

import com.spopia.infra.common.base.BaseVo;

public class Game extends BaseVo{

	private String gSeq;
	private Integer gAbroadNy;
	private Integer gEvent;
	private String gLeague;
	private Integer team_home;
	private Integer team_away;
	private Integer score_home;
	private Integer score_away;
	private String player_home;
	private String player_away;
	private Integer stadium;
	private String gameDate;
	private String gameDuration;
	private String gCreatedAt;
	private String gModifiedAt;
	private Integer gcDelNy;
	
	// comment
	private String id;
	private String comment;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	
	
	/* select test team */
  private String teamSeq;
  private Integer abroadNy;
  private Integer event;
  private Integer league;
  private String teamName;
  private int level;
  
  public int getLevel() {
      return level;
  }
  public void setLevel(int level) {
      this.level = level;
  }
  public String getTeamSeq() {
      return teamSeq;
  }
  public void setTeamSeq(String teamSeq) {
      this.teamSeq = teamSeq;
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
  public String getTeamName() {
      return teamName;
  }
  public void setTeamName(String teamName) {
      this.teamName = teamName;
  }

  
  public String getgSeq() {
		return gSeq;
	}
	public void setgSeq(String gSeq) {
		this.gSeq = gSeq;
	}
	public Integer getgAbroadNy() {
		return gAbroadNy;
	}
	public void setgAbroadNy(Integer gAbroadNy) {
		this.gAbroadNy = gAbroadNy;
	}
	public Integer getgEvent() {
		return gEvent;
	}
	public void setgEvent(Integer gEvent) {
		this.gEvent = gEvent;
	}
	public String getgLeague() {
		return gLeague;
	}
	public void setgLeague(String gLeague) {
		this.gLeague = gLeague;
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
	public String getGameDate() {
		return gameDate;
	}
	public void setGameDate(String gameDate) {
		this.gameDate = gameDate;
	}
	public String getGameDuration() {
		return gameDuration;
	}
	public void setGameDuration(String gameDuration) {
		this.gameDuration = gameDuration;
	}
	public String getgCreatedAt() {
		return gCreatedAt;
	}
	public void setgCreatedAt(String gCreatedAt) {
		this.gCreatedAt = gCreatedAt;
	}
	public String getgModifiedAt() {
		return gModifiedAt;
	}
	public void setgModifiedAt(String gModifiedAt) {
		this.gModifiedAt = gModifiedAt;
	}
	public Integer getGcDelNy() {
		return gcDelNy;
	}
	public void setGcDelNy(Integer gcDelNy) {
		this.gcDelNy = gcDelNy;
	}
}
