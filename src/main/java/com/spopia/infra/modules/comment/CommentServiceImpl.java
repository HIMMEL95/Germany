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
}
