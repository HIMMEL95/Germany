package com.spopia.infra.modules.article;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spopia.infra.modules.game.Game;
import com.spopia.infra.modules.game.GameServiceImpl;
import com.spopia.infra.modules.game.GameVo;
import com.spopia.infra.modules.team.Team;
import com.spopia.infra.modules.team.TeamServiceImpl;

@Controller
@RequestMapping(value = "/article/")
public class ArticleController {

	@Autowired
	ArticleServiceImpl service;
	@Autowired
	GameServiceImpl gService;
	@Autowired
	TeamServiceImpl tService;
	
	public void setSearchAndPaging(ArticleVo vo) throws Exception {
		vo.setShDelNy(vo.getShDelNy() == null ? 0 : vo.getShDelNy());
		
		vo.setParamsPaging(service.selectOneCount(vo));
	}

	@RequestMapping(value = "articleList")
	public String articleList(Model model, @ModelAttribute("vo") ArticleVo vo) throws Exception {
		setSearchAndPaging(vo);
		
		List<Article> list = service.selectList(vo);
		model.addAttribute("list", list);
		return "infra/article/xdmin/articleList";
	}

	@RequestMapping(value = "articleForm")
	public String articleForm(@ModelAttribute("vo") ArticleVo vo, Model model, Team tDto, GameVo gVo) throws Exception {
		
		Article item = service.selectOne(vo);
		model.addAttribute("item", item);
		
		System.out.println("abroad");
		List<Team> abroad = tService.abroad(tDto);
		model.addAttribute("abroad", abroad);
		
		return "infra/article/xdmin/articleForm";
	}

	@RequestMapping(value = "articleInst")
	public String articleInst(Article dto, ArticleVo vo, RedirectAttributes redirectAttributes) throws Exception {
		service.insert(dto);
		
		vo.setaSeq(dto.getaSeq());
		redirectAttributes.addFlashAttribute("vo", vo);
		return "redirect:/article/articleForm";
	}
	
	@RequestMapping(value = "articleXdminView")
	public String articleView(Model model, ArticleVo vo) throws Exception {
		Article item = service.selectOne(vo);
		model.addAttribute("item", item);
		
		List<Article> list = service.selectList1();
		model.addAttribute("list", list);
		return "infra/article/xdmin/articleXdminView";
	}	
	
	@RequestMapping(value = "articleModForm")
	public String articleModForm(Model model, ArticleVo vo) throws Exception {
		Article item = service.selectOne(vo);
		model.addAttribute("item", item);
		
		return "infra/article/xdmin/articleModForm";
	}
	
	@RequestMapping(value = "articleUpdt")
	public String articleUpdt(Article dto, ArticleVo vo, RedirectAttributes redirectAttributes) throws Exception {
		service.update(dto);
		
		vo.setaSeq(dto.getaSeq());
		redirectAttributes.addFlashAttribute("vo", vo);
		return "redirect:/article/articleList";
	}
	
}
