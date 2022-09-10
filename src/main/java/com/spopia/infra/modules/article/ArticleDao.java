package com.spopia.infra.modules.article;

import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class ArticleDao {
	
	@Inject
	@Resource(name = "sqlSession")
	private SqlSession sqlSession;
	
	private static String namespace = "com.spopia.infra.modules.article.ArticleMapper";
	
	public List<Article> selectList(ArticleVo vo) {
		return sqlSession.selectList(namespace + ".selectList", vo);
	}
	
	public List<Article> selectList() {
		return sqlSession.selectList(namespace + ".selectList", "");
	}
	
	public int insert(Article dto) {
		return sqlSession.insert(namespace+".insert", dto);
	}

}
