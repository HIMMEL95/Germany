package com.spopia.infra.modules.game;

import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class GameDao {

	@Inject
	@Resource(name = "sqlSession")
	private SqlSession sqlSession;
	
	private static String namespace = "com.spopia.infra.modules.game.GameMapper";
	
	public List<Game> selectList() throws Exception {
		return sqlSession.selectList(namespace + ".selectList", "");
	}
}
