package com.spopia.infra.modules.article;

import java.util.List;

public interface ArticleService {

	public List<Article> selectList() throws Exception;
}
