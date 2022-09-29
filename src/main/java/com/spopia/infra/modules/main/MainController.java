package com.spopia.infra.modules.main;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spopia.infra.modules.article.Article;
import com.spopia.infra.modules.article.ArticleVo;

@Controller
public class MainController {
	
	@Autowired
	MainServiceImpl service;
	
	@RequestMapping(value = "/")
	public String main() throws Exception {
		return "infra/main/xdmin/main_page";
	}
	
	@RequestMapping(value = "sportMain")
	public String sportMain(Model model, MainVo vo) throws Exception {
		service.mainList(model, vo);
		return "infra/main/xdmin/sport_main";
	}

	@RequestMapping(value = "articleView")
	public String articleView(MainVo vo, Model model) throws Exception {
		
		Main item = service.articleSelectOne(vo);
		model.addAttribute("item", item);
		return "infra/article/user/articleView";
	}
	
	@RequestMapping(value = "gameView")
	public String gameView(MainVo vo, Model model, Main dto) throws Exception {

		Main item = service.gameSelectOne(vo);
		model.addAttribute("item", item);
		return "infra/game/user/gameView";
	}
}
