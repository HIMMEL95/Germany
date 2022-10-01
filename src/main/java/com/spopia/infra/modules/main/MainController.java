package com.spopia.infra.modules.main;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spopia.infra.modules.article.Article;
import com.spopia.infra.modules.article.ArticleServiceImpl;
import com.spopia.infra.modules.article.ArticleVo;
import com.spopia.infra.modules.comment.Comment;
import com.spopia.infra.modules.comment.CommentVo;
import com.spopia.infra.modules.game.Game;
import com.spopia.infra.modules.game.GameServiceImpl;
import com.spopia.infra.modules.game.GameVo;

@Controller
public class MainController {

	@Autowired
	ArticleServiceImpl aService;
	@Autowired
	GameServiceImpl gService;
	
	@RequestMapping(value = "/")
	public String main() throws Exception {
		return "infra/main/xdmin/main_page";
	}
	
	@RequestMapping(value = "sportMain")
	public String sportMain(Model model, ArticleVo aVo, GameVo gVo) throws Exception {
		
		List<Article> aList = aService.mainList(aVo);
		model.addAttribute("aList", aList);
		
		List<Game> gList = gService.mainList(gVo);
		model.addAttribute("gList", gList);
		return "infra/main/xdmin/sport_main";
	}

	@RequestMapping(value = "articleView")
	public String articleView(ArticleVo aVo, Model model, CommentVo cVo) throws Exception {
		
		Article item = aService.selectOne(aVo);
		model.addAttribute("item", item);
		
		aService.articleCommentCount(cVo);
		List<Comment> comment = aService.articleComment(cVo);
		model.addAttribute("comment", comment);
		
		
		return "infra/article/user/articleView";
	}
	
	@RequestMapping(value = "gameView")
	public String gameView(GameVo gVo, Model model) throws Exception {

		Game item = gService.selectOne(gVo);
		model.addAttribute("item", item);
		return "infra/game/user/gameView";
	}
	
	@RequestMapping(value = "naver")
	public String naver() throws Exception {
		return "infra/main/xdmin/naver";
	}
	
	@RequestMapping(value = "changePw")
	public String changePw() throws Exception {
		return "infra/member/user/changePwd";
	}
}
