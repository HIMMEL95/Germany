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
	
	public List<Main> articleList(MainVo vo) throws Exception {
		return sqlSession.selectList(namespace + ".articleList", "");
	}
	
	public List<Main> gameList(MainVo vo) throws Exception {
		return sqlSession.selectList(namespace + ".gameList", "");
	}

}
