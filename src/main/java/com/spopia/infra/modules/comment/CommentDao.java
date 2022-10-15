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
	
	// article comment s
	public int articleInsert(Comment dto) {
		return sqlSession.insert(namespace + ".articleInsert", dto);
	}
	
	public int articleCommentUelete(Comment dto) {
		return sqlSession.update(namespace + ".articleCommentUelete", dto);
	}
	
	public int articleCommentDelete(Comment dto) {
		return sqlSession.delete(namespace + ".articleCommentDelete", dto);
	}
	// article comment e

	// game comment s
	public int gameInsert(Comment dto) {
		return sqlSession.insert(namespace + ".gameInsert", dto);
	}
	
	public int gameCommentUelete(Comment dto) {
		return sqlSession.update(namespace + ".gameCommentUelete", dto);
	}
	
	public int gameCommentDelete(Comment dto) {
		return sqlSession.delete(namespace + ".gameCommentDelete", dto);
	}
	// game comment e
	
}
