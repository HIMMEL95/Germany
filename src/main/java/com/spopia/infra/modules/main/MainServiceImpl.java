package com.spopia.infra.modules.main;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

@Service
public class MainServiceImpl {
	
	@Autowired
	MainDao dao;

	public void mainList(Model model) throws Exception {
		List<Main> aList = dao.articleList();
		model.addAttribute("aList", aList);
		
		List<Main> gList = dao.gameList();
		model.addAttribute("gList", gList);
	}
}
