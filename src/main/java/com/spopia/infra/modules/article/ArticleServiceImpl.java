package com.spopia.infra.modules.article;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ArticleServiceImpl  implements ArticleService{

	@Autowired
	private ArticleDao dao;

	@Override
	public List<Article> selectList() throws Exception {
		return dao.selectList();
	}
	
	
}
