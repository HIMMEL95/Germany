package com.spopia.infra.modules.article;

import java.util.List;

import com.spopia.infra.modules.comment.Comment;
import com.spopia.infra.modules.comment.CommentVo;

public interface ArticleService {

	public List<Article> selectList(ArticleVo vo) throws Exception;
	public List<Article> selectList() throws Exception;
	public List<Article> selectList1() throws Exception;
	public int insert(Article dto) throws Exception;
	public int update(Article dto) throws Exception;
	public Article selectOne(ArticleVo vo) throws Exception;
	public int selectOneCount(ArticleVo vo) throws Exception;

	/* mainlist */
	public List<Article> mainList(ArticleVo vo) throws Exception;
	
	/* article comment */
	public List<Comment> articleComment(CommentVo vo) throws Exception;
	public int articleCommentCount(CommentVo vo) throws Exception;
}
