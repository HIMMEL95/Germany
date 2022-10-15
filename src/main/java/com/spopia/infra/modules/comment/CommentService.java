package com.spopia.infra.modules.comment;

import java.util.List;

public interface CommentService {

	public List<Comment> selectList() throws Exception;
	public List<Comment> selectList(CommentVo vo) throws Exception;
	
	public int selectOneCount(CommentVo vo) throws Exception; 
	
	public List<Comment> selectList1(CommentVo vo) throws Exception;
	
	public int selectOneCount1(CommentVo vo) throws Exception;
	
//	article comment s 
	public int articleInsert(Comment dto) throws Exception;
	public int articleCommentUelete(Comment dto) throws Exception;
	public int articleCommentDelete(Comment dto) throws Exception;
//	article comment e
	
//	game comment s
	public int gameInsert(Comment dto) throws Exception;
	public int gameCommentUelete(Comment dto) throws Exception;
	public int gameCommentDelete(Comment dto) throws Exception;
//	game comment e
	
}
