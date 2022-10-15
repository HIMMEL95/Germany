package com.spopia.infra.modules.main;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spopia.infra.modules.article.Article;
import com.spopia.infra.modules.article.ArticleServiceImpl;
import com.spopia.infra.modules.article.ArticleVo;
import com.spopia.infra.modules.comment.Comment;
import com.spopia.infra.modules.comment.CommentServiceImpl;
import com.spopia.infra.modules.comment.CommentVo;
import com.spopia.infra.modules.game.Game;
import com.spopia.infra.modules.game.GameServiceImpl;
import com.spopia.infra.modules.game.GameVo;
import com.spopia.infra.modules.member.Member;
import com.spopia.infra.modules.member.MemberServiceImpl;

@Controller
public class MainController {

	@Autowired
	ArticleServiceImpl aService;
	@Autowired
	GameServiceImpl gService;
	@Autowired
	MemberServiceImpl mService;
	@Autowired
	CommentServiceImpl cService;
	
	@RequestMapping(value = "/")
	public String main() throws Exception {
		return "infra/main/xdmin/main_page";
	}
	
	@RequestMapping(value = "sportMain")
	public String sportMain(Model model, @ModelAttribute("aVo") ArticleVo aVo, @ModelAttribute("gVo") GameVo gVo, Article aDto) throws Exception {
		
		List<Article> aList = aService.mainList(aVo);
		model.addAttribute("aList", aList);
		
		List<Game> gList = gService.mainList(gVo);
		model.addAttribute("gList", gList);
		
		return "infra/main/xdmin/sport_main";
	}

	@RequestMapping(value = "articleView")
	public String articleView(@ModelAttribute("aVo") ArticleVo aVo, Model model, @ModelAttribute("cVo") CommentVo cVo) throws Exception {
		
		Article item = aService.selectOne(aVo);
		model.addAttribute("item", item);
		
		cVo.setParamsPaging(aService.articleCommentCount(cVo));
		List<Comment> comment = aService.articleComment(cVo);
		model.addAttribute("comment", comment);
		
		return "infra/article/user/articleView";
	}
	
	@RequestMapping(value = "gameView")
	public String gameView(@ModelAttribute("gVo") GameVo gVo, Model model, @ModelAttribute("cVo") CommentVo cVo) throws Exception {

		Game item = gService.mainSelectOne(gVo);
		model.addAttribute("item", item);
		
		cVo.setParamsPaging(gService.gameCommentCount(cVo));
		List<Comment> comment = gService.gameComment(cVo);
		model.addAttribute("comment", comment);
		
		return "infra/game/user/gameView";
	}
	
	@RequestMapping(value = "changePw")
	public String changePw(Member dto) throws Exception {
		return "infra/member/user/changePwd";
	}
	
	@RequestMapping(value = "pwdUpdt")
	public String pwdUpdt(Member dto) throws Exception {
	    mService.pwdUpdt(dto);
	   return "infra/member/user/changePwd";
	}
	
	@ResponseBody
	@RequestMapping(value = "articleInsert") 
	public Map<String, Object> articleInsert(Comment cDto, @ModelAttribute("vo") ArticleVo vo) throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		cService.articleInsert(cDto);
		returnMap.put("rt", "success");
		
		return returnMap;
	}
	
	@ResponseBody
	@RequestMapping(value = "articleCommentUelete")
	public Map<String, Object> articleCommentUelete(Comment dto) throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		cService.articleCommentUelete(dto);
		returnMap.put("rt", "success");
		
		return returnMap;
	}
	
	@ResponseBody
	@RequestMapping(value = "articleRefresh")
	public Map<String, Object> articleRefresh() throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("rt", "success");
		
		return returnMap;
	}
	
	@ResponseBody
	@RequestMapping(value = "gameInsert") 
	public Map<String, Object> gameInsert(Comment cDto, @ModelAttribute("vo") GameVo vo) throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		cService.gameInsert(cDto);
		returnMap.put("rt", "success");
		
		return returnMap;
	}
	
	@ResponseBody
	@RequestMapping(value = "gameCommentUelete")
	public Map<String, Object> gameCommentUelete(Comment dto) throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		cService.gameCommentUelete(dto);
		returnMap.put("rt", "success");
		
		return returnMap;
	}
	
	@ResponseBody
	@RequestMapping(value = "gameRefresh")
	public Map<String, Object> gameRefresh() throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("rt", "success");
		
		return returnMap;
	}
	
}
