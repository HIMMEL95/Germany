package com.spopia.infra.modules.team;

import java.util.List;

public interface TeamService {

    public List<Team> selectList() throws Exception;
    /* select test */
    public List<Team> abroad(Team dto) throws Exception;
    public List<Team> event(Team dto) throws Exception;
    public List<Team> league(Team dto) throws Exception;
    public List<Team> teamName(Team dto) throws Exception;
}
