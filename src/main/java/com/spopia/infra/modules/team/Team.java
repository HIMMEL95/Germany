package com.spopia.infra.modules.team;

public class Team {

    /* select test team */
    private String teamSeq;
    private Integer abroadNy;
    private Integer event;
    private Integer league;
    private String teamName;
    
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
}
