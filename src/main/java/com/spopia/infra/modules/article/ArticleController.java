package com.spopia.infra.modules.article;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/article/")
public class ArticleController {

	@Autowired
	ArticleServiceImpl service;
	
	@RequestMapping(value = "articleXdminView")
	public String articleView(Model model)throws Exception {
		List<Article> list = service.selectList();
		model.addAttribute("list", list);
		return "infra/article/xdmin/articleXdminView";
	}
	
	@RequestMapping(value = "articleForm")
	public String articleForm() throws Exception {
		return "infra/article/xdmin/articleForm";
	}
	
	@RequestMapping(value = "articleList")
	public String articleList(Model model, ArticleVo vo) throws Exception {
		
		List<Article> list = service.selectList(vo);
		model.addAttribute("list", list);
		return "infra/article/xdmin/articleList";
	}
	
	@RequestMapping(value = "articleInst")
	public String articleInst(Article dto) throws Exception {
		int result = service.insert(dto);
		System.out.println("Controller result : " + result);
		return "redirect:/article/articleList";
	}
}
