package com.spopia.infra.modules.article;

import java.util.List;

public interface ArticleService {

	public List<Article> selectList(ArticleVo vo) throws Exception;
	public List<Article> selectList() throws Exception;
	public int insert(Article dto) throws Exception;
	public int update(Article dto) throws Exception;
	public Article selectOne(ArticleVo vo) throws Exception;
}
