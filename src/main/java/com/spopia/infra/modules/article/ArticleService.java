package com.spopia.infra.modules.article;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.spopia.infra.modules.comment.Comment;
import com.spopia.infra.modules.comment.CommentVo;

public interface ArticleService {

	public List<Article> selectList(ArticleVo vo) throws Exception;
	public List<Article> selectList() throws Exception;
	public List<Article> selectList1() throws Exception;
	public int insert(Article dto) throws Exception;
	public int update(Article dto) throws Exception;
	public int uelete(Article dto) throws Exception;
    public int delete(ArticleVo vo) throws Exception;
	public Article selectOne(ArticleVo vo) throws Exception;
	public int selectOneCount(ArticleVo vo) throws Exception;

	/* mainlist */
	public List<Article> mainList(ArticleVo vo) throws Exception;
	
	/* article comment */
	public List<Comment> articleComment(CommentVo vo) throws Exception;
	public int articleCommentCount(CommentVo vo) throws Exception;
	
	//	article img
	public Article imgSelectOne(ArticleVo vo) throws Exception;
	public void uploadFiles(MultipartFile[] multipartFiles, Article dto, String tableName, int type) throws Exception;
	
    /* article select */
	public List<Article> abroad(Article dto) throws Exception;
	public List<Article> event(Article dto) throws Exception;
	public List<Article> league(Article dto) throws Exception;
}
