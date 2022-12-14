package com.spopia.infra.modules.main;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

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
import com.spopia.infra.modules.member.MemberVo;

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
	public String sportMain(Model model, @ModelAttribute("aVo") ArticleVo aVo, @ModelAttribute("gVo") GameVo gVo, Member dto, @ModelAttribute("mVo") MemberVo mVo, HttpSession httpSession) throws Exception {
		
		List<Article> aList = aService.mainList(aVo);
		model.addAttribute("aList", aList);
		
		List<Game> gList = gService.mainList(gVo);
		model.addAttribute("gList", gList);
		
		try {
			String seq = httpSession.getAttribute("sessSeq").toString();
			mVo.setSeq(seq);
		} catch (Exception e) {
		}
		Member profile = mService.profileOne(mVo);
		model.addAttribute("profile", profile);
		
		System.out.println("seq : " + mVo.getSeq());
		
		return "infra/main/xdmin/sport_main";
	}

	@RequestMapping(value = "articleView")
	public String articleView(@ModelAttribute("aVo") ArticleVo aVo, @ModelAttribute("mVo") MemberVo mVo,  Model model, @ModelAttribute("cVo") CommentVo cVo, HttpSession httpSession) throws Exception {
		
		Article item = aService.selectOne(aVo);
		model.addAttribute("item", item);
		
		cVo.setParamsPaging(aService.articleCommentCount(cVo));
		List<Comment> comment = aService.articleComment(cVo);
		model.addAttribute("comment", comment);
		
		Member profile = mService.profileOne(mVo);
		model.addAttribute("profile", profile);
		
		return "infra/article/user/articleView";
	}
	
	@RequestMapping(value = "gameView")
	public String gameView(@ModelAttribute("gVo") GameVo gVo, Model model, @ModelAttribute("cVo") CommentVo cVo, @ModelAttribute("mVo") MemberVo mVo, HttpSession httpSession) throws Exception {

		Game item = gService.mainSelectOne(gVo);
		model.addAttribute("item", item);
		
		cVo.setParamsPaging(gService.gameCommentCount(cVo));
		List<Comment> comment = gService.gameComment(cVo);
		model.addAttribute("comment", comment);
		
		String seq = httpSession.getAttribute("sessSeq").toString();
		mVo.setSeq(seq);
		Member profile = mService.profileOne(mVo);
		model.addAttribute("profile", profile);
		
		return "infra/game/user/gameView";
	}
	
	@RequestMapping(value = "changePw")
	public String changePw(Member dto) throws Exception {
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
	
	@RequestMapping(value = "chat")
	public String chat() throws Exception {
	    return "infra/chat/chat";
	}
	
}
