package com.spopia.infra.modules.game;

import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spopia.infra.modules.team.Team;

@Repository
public class GameDao {

	@Inject
	@Resource(name = "sqlSession")
	private SqlSession sqlSession;
	
	private static String namespace = "com.spopia.infra.modules.game.GameMapper";
	
	public List<Game> selectList() throws Exception {
		return sqlSession.selectList(namespace + ".selectList", "");
	}
	
	public List<Game> selectList(GameVo vo) throws Exception {
		return sqlSession.selectList(namespace + ".selectList", vo);
	}
	
	public List<Game> selectList1() {
		return sqlSession.selectList(namespace + ".selectList1", "");
	}
	
	public int selectOneCount(GameVo vo) {
		return sqlSession.selectOne(namespace + ".selectOneCount", vo);
	}
	
	public int insert(Game dto) {
		return sqlSession.insert(namespace + ".insert", dto);
	}
	
	public Game selectOne(GameVo vo) {
		return sqlSession.selectOne(namespace + ".selectOne", vo);
	}
	
	public int update(Game dto) {
		return sqlSession.update(namespace + ".update", dto);
	}
	
	public int uelete(Game dto) {
		return sqlSession.update(namespace + ".uelete", dto);
	}
	
	public int delete(GameVo vo) {
		return sqlSession.delete(namespace + ".delete", vo);
	}

	/* mainList */
	public List<Game> mainList(GameVo vo) {
		return sqlSession.selectList(namespace + ".mainList", vo);
	}
	
	
	/* select test */
    public List<Game> abroad(Game dto) {
        return sqlSession.selectList(namespace + ".abroad", dto);
    }
    
    public List<Game> event(Game dto) {
        return sqlSession.selectList(namespace + ".event", dto);
    }
    
    public List<Game> league(Game dto) {
        return sqlSession.selectList(namespace + ".league", dto);
    }
    
    public List<Game> teamName(Game dto) {
        return sqlSession.selectList(namespace + ".teamName", dto);
    }
}
