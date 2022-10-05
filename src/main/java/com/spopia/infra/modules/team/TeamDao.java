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
    
    /* select test */
    public List<Team> selectTest(Team dto) {
        return sqlSession.selectList(namespace + ".team", dto);
    }
}
