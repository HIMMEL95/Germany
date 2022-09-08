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
	public String articleView() {
		return "infra/article/xdmin/article_view";
	}
}
