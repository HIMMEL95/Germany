package com.spopia.infra.modules.team;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TeamServiceImpl implements TeamService {

    @Autowired
    TeamDao dao;
    
    @Override
    public List<Team> selectList() throws Exception {
        return dao.selectList();
    }
    
    /* select Test */
    @Override
    public List<Team> abroad(Team dto) throws Exception {
        return dao.abroad(dto);
    }

    @Override
    public List<Team> event(Team dto) throws Exception {
        return dao.event(dto);
    }

    @Override
    public List<Team> league(Team dto) throws Exception {
        return dao.league(dto);
    }

    @Override
    public List<Team> teamName(Team dto) throws Exception {
        return dao.teamName(dto);
    }
    
    
}
