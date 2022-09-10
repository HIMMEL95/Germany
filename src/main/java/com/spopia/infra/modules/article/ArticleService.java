package com.spopia.infra.modules.article;

import java.util.List;

public interface ArticleService {

	public List<Article> selectList(ArticleVo vo) throws Exception;
	public List<Article> selectList() throws Exception;
	public int insert(Article dto) throws Exception;
}
