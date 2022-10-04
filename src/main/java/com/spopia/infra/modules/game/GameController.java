package com.spopia.infra.modules.game;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping(value = "/game/")
public class GameController {

	@Autowired
	GameServiceImpl service;
	
	public void setSearchAndPaging(GameVo vo) throws Exception {
		vo.setShDelNy(vo.getShDelNy() == null ? 0 : vo.getShDelNy());
		
		vo.setParamsPaging(service.selectOneCount(vo));
	}
	
	@RequestMapping(value = "gameList")
	public String gameList(Model model, @ModelAttribute("vo") GameVo vo) throws Exception {
		
		setSearchAndPaging(vo);
		
		List<Game> list = service.selectList(vo);
		model.addAttribute("list", list);
		return "infra/game/xdmin/gameList";
	}
	
	@RequestMapping(value = "gameForm")
	public String gameForm(Model model, @ModelAttribute("vo") GameVo vo) throws Exception {
		
		Game item = service.selectOne(vo);
		model.addAttribute("item", item);
		return "infra/game/xdmin/gameForm";
	}
	
	@RequestMapping(value = "gameInst")
	public String gameInst(Game dto, GameVo vo, RedirectAttributes redirectAttributes) throws Exception {
		service.insert(dto);

		vo.setgSeq(dto.getgSeq());
		redirectAttributes.addFlashAttribute("vo", vo);
		return "redirect:/game/gameForm";
	}
	
	@RequestMapping(value = "gameView")
	public String gameView(Model model, @ModelAttribute("vo") GameVo vo) throws Exception {
		Game item = service.selectOne(vo);
		model.addAttribute("item", item);

		return "infra/game/xdmin/gameForm";		
	}
	
	@RequestMapping(value = "gameUpdt")
	public String gameModForm(Game dto, GameVo vo, RedirectAttributes redirectAttributes) throws Exception {
		service.update(dto);

		vo.setgSeq(dto.getgSeq());
		redirectAttributes.addFlashAttribute("vo", vo);
		return "redirect:/game/gameForm";
	}
	
	@RequestMapping(value = "gameUele")
	public String gameUele(Game dto) throws Exception {
		service.uelete(dto);
		return "redirect:/game/gameList";
	}
	
	@RequestMapping(value = "gameDele")
	public String gameDele(GameVo vo) throws Exception {
		service.delete(vo);
		return "redirect:/game/gameList";
	}
	
}
