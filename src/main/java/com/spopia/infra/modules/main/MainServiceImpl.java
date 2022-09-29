package com.spopia.infra.modules.main;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

@Service
public class MainServiceImpl implements MainService{
	
	@Autowired
	MainDao dao;

	public void mainList(Model model, MainVo vo) throws Exception {
		List<Main> aList = dao.articleList(vo);
		model.addAttribute("aList", aList);
		
		List<Main> gList = dao.gameList(vo);
		model.addAttribute("gList", gList);
	}

	@Override
	public List<Main> articleList(MainVo vo) throws Exception {
		return dao.articleList(vo);
	}

	@Override
	public List<Main> gamList(MainVo vo) throws Exception {
		return dao.gameList(vo);
	}

	@Override
	public Main articleSelectOne(MainVo vo) throws Exception {
		return dao.articleSelectOne(vo);
	}

	@Override
	public Main gameSelectOne(MainVo vo) throws Exception {
		return dao.gameSelectOne(vo);
	}
	
}
