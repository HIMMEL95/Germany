package com.spopia.infra.modules.team;

import java.util.List;

import com.spopia.infra.modules.game.Game;

public interface TeamService {

    /* select test */
    public List<Team> selectTest(Team dto) throws Exception;
    
}
