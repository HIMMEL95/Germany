package com.spopia.infra.modules.team;

import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class TeamDao {

    @Inject
    @Resource(name = "sqlSession")
    private SqlSession sqlSession;
    
    private static String namespace = "com.spopia.infra.modules.team.TeamMapper";
    
    public List<Team> selectList() {
        return sqlSession.selectList(namespace + ".team", "");
    }

    /* select test */
    public List<Team> abroad(Team dto) {
        return sqlSession.selectList(namespace + ".abroad", dto);
    }
    
    public List<Team> event(Team dto) {
        return sqlSession.selectList(namespace + ".event", dto);
    }
    
    public List<Team> league(Team dto) {
        return sqlSession.selectList(namespace + ".league", dto);
    }
    
    public List<Team> teamName(Team dto) {
        return sqlSession.selectList(namespace + ".teamName", dto);
    }
    
    
    
}
