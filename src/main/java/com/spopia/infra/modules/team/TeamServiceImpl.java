package com.spopia.infra.modules.team;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spopia.infra.modules.game.Game;

@Service
public class TeamServiceImpl implements TeamService {

    @Autowired
    TeamDao dao;
    
    /* select Test */
    @Override
    public List<Team> selectTest(Team dto) throws Exception {
        return dao.selectTest(dto);
    }
    
}
