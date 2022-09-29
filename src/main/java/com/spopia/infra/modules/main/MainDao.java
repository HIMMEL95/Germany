package com.spopia.infra.modules.main;

import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class MainDao {
	
	@Inject
	@Resource(name = "sqlSession")
	private SqlSession sqlSession;
	
	private static String namespace = "com.spopia.infra.modules.main.MainMapper";
	
	public List<Main> articleList(MainVo vo) {
		return sqlSession.selectList(namespace + ".articleList", "");
	}
	
	public List<Main> gameList(MainVo vo) {
		return sqlSession.selectList(namespace + ".gameList", "");
	}

	public Main articleSelectOne(MainVo vo) {
		return sqlSession.selectOne(namespace + ".articleSelectOne", vo);
	}

	public Main gameSelectOne(MainVo vo) {
		return sqlSession.selectOne(namespace + ".gameSelectOne", vo);
	}
	
}
