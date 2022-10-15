package com.spopia.infra.modules.comment;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CommentServiceImpl implements CommentService {

	@Autowired
	private CommentDao dao;
	
	@Override
	public List<Comment> selectList() throws Exception {
		return dao.selectList();
	}

	@Override
	public List<Comment> selectList(CommentVo vo) throws Exception {
		return dao.selectList(vo);
	}
	
	@Override
	public int selectOneCount(CommentVo vo) throws Exception { 
		return dao.selectOneCount(vo); 
	}

	@Override
	public List<Comment> selectList1(CommentVo vo) throws Exception {
		return dao.selectList1(vo);
	}

	@Override
	public int selectOneCount1(CommentVo vo) throws Exception {
		return dao.selectOneCount1(vo);
	}

	@Override
	public int articleInsert(Comment dto) throws Exception {
		return dao.articleInsert(dto);
	}

	@Override
	public int articleCommentUelete(Comment dto) throws Exception {
		return dao.articleCommentUelete(dto);
	}

	@Override
	public int articleCommentDelete(Comment dto) throws Exception {
		return dao.articleCommentDelete(dto);
	}

	@Override
	public int gameInsert(Comment dto) throws Exception {
		return dao.gameInsert(dto);
	}

	@Override
	public int gameCommentUelete(Comment dto) throws Exception {
		return dao.gameCommentUelete(dto);
	}

	@Override
	public int gameCommentDelete(Comment dto) throws Exception {
		return dao.gameCommentDelete(dto);
	}

	
}
