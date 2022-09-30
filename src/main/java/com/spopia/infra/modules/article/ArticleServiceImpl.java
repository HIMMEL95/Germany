package com.spopia.infra.modules.article;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spopia.infra.modules.comment.Comment;
import com.spopia.infra.modules.comment.CommentVo;

@Service
public class ArticleServiceImpl  implements ArticleService{

	@Autowired
	ArticleDao dao;

	@Override
	public List<Article> selectList(ArticleVo vo) throws Exception {
		return dao.selectList(vo);
	}

	@Override
	public List<Article> selectList() throws Exception {
		return dao.selectList();
	}

	@Override
	public List<Article> selectList1() throws Exception {
		return dao.selectList1();
	}
	
	@Override
	public int insert(Article dto) throws Exception {
		return dao.insert(dto);
	}

	@Override
	public int update(Article dto) throws Exception {
		return dao.update(dto);
	}

	@Override
	public Article selectOne(ArticleVo vo) throws Exception {
		return dao.selectOne(vo);
	}
	
	@Override
	public int selectOneCount(ArticleVo vo) throws Exception {
		return dao.selectOneCount(vo);
	}

	/* mainlist */
	@Override
	public List<Article> mainList(ArticleVo vo) throws Exception {
		return dao.mainList(vo);
	}

	/* article comment */
	@Override
	public List<Comment> articleComment(CommentVo vo) throws Exception {
		return dao.articleComment(vo);
	}

	@Override
	public int articleCommentCount(CommentVo vo) throws Exception {
		return dao.articleCommentCount(vo);
	}
}
