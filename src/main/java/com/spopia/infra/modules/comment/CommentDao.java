package com.spopia.infra.modules.comment;

import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class CommentDao {

	@Inject
	@Resource(name = "sqlSession")
	private SqlSession sqlSession;
	
	private static String namespace = "com.spopia.infra.modules.comment.CommentMapper";
	
	public List<Comment> selectList() {
		return sqlSession.selectList(namespace + ".selectList", "");
	}
	
	public List<Comment> selectList(CommentVo vo) {
		return sqlSession.selectList(namespace + ".selectList", vo);
	}

	public int selectOneCount(CommentVo vo) { 
		return sqlSession.selectOne(namespace + ".selectOneCount", vo); 
	}
	
	public List<Comment> selectList1(CommentVo vo) {
		return sqlSession.selectList(namespace + ".selectList1", vo);
	}
	 
	public int selectOneCount1(CommentVo vo) {
		return sqlSession.selectOne(namespace + ".selectOneCount1", vo);
	}
	
}
