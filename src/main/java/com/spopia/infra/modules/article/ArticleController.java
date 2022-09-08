package com.spopia.infra.modules.article;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/article")
public class ArticleController {

	@Autowired
	ArticleServiceImpl service;
	
	@RequestMapping(value = "/articleView")
	public String articleView()throws Exception {
		return "infra/article/xdmin/articleView";
	}
	
	@RequestMapping(value = "/articleForm")
	public String articleForm() throws Exception {
		return "infra/article/xdmin/articleForm";
	}
	
	@RequestMapping(value = "/articleList")
	public String articleList() throws Exception {
		return "infra/article/xdmin/articleList";
	}
}
