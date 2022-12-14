package com.spopia.infra.modules.article;

import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spopia.infra.modules.comment.Comment;
import com.spopia.infra.modules.comment.CommentVo;

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
	
	public List<Article> selectList1() {
		return sqlSession.selectList(namespace + ".selectList1", "");
	}
	
	public int insert(Article dto) {
		return sqlSession.insert(namespace+".insert", dto);
	}
	
	public Article selectOne(ArticleVo vo) {
		return sqlSession.selectOne(namespace + ".selectOne", vo);
	}
	
	public int update(Article dto) {
		return sqlSession.update(namespace + ".update", dto);
	}
	
	public int uelete(Article dto) {
        return sqlSession.update(namespace + ".uelete", dto);
    }
    
    public int delete(ArticleVo vo) {
        return sqlSession.delete(namespace + ".delete", vo);
    }
	
	public int selectOneCount(ArticleVo vo) {
		return sqlSession.selectOne(namespace + ".selectOneCount", vo);
	}
	
	/* mainList */
	public List<Article> mainList(ArticleVo vo) {
		return sqlSession.selectList(namespace + ".mainList", vo);
	}
	
	/* article comment */
	public List<Comment> articleComment(CommentVo vo) {
		return sqlSession.selectList(namespace + ".articleComment", vo);
	}
	
	public int articleCommentCount(CommentVo vo) {
		return sqlSession.selectOne(namespace + ".articleCommentCount", vo);
	}
	
	//image Uploaded
	public int insertUploaded(Article dto) { return sqlSession.insert("Base" + ".insertUploaded", dto); }
	public int ueleteUploaded(Article dto) { return sqlSession.insert("Base" + ".ueleteUploaded", dto); }
  public int deleteUploaded(Article dto) { return sqlSession.insert("Base" + ".deleteUploaded", dto); }
    
    /* select article */
	public List<Article> abroad(Article dto) {
	    return sqlSession.selectList(namespace + ".abroad", dto);
	}
	
	public List<Article> event(Article dto) {
	    return sqlSession.selectList(namespace + ".event", dto);
	}

	public List<Article> league(Article dto) {
	    return sqlSession.selectList(namespace + ".league", dto);
	}
}
