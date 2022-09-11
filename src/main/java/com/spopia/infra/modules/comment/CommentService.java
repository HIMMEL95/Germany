package com.spopia.infra.modules.comment;

import java.util.List;

public interface CommentService {

	public List<Comment> selectList() throws Exception;
	public List<Comment> selectList(CommentVo vo) throws Exception;
}
