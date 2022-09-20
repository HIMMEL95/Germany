package com.spopia.infra.modules.article;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
		return dao.selectOneCoutn(vo);
	}
}
