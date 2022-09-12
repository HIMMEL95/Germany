package com.spopia.infra.modules.game;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/game/")
public class GameController {

	@Autowired
	GameServiceImpl service;
	
	@RequestMapping(value = "gameList")
	public String gameList(Model model, GameVo vo) throws Exception {
		List<Game> list = service.selectList(vo);
		model.addAttribute("list", list);
		return "infra/game/xdmin/gameList";
	}
	
	@RequestMapping(value = "gameForm")
	public String gameForm() throws Exception {
		return "infra/game/xdmin/gameForm";
	}
	
	@RequestMapping(value = "gameInst")
	public String gameInst(Game dto) throws Exception {
		int result = service.insert(dto);
		System.out.println("Controller result : " + result);
		return "redirect:/game/gameList";
	}
	
	@RequestMapping(value = "gameView")
	public String gameView(Model model, GameVo vo) throws Exception {
		Game item = service.selectOne(vo);
		model.addAttribute("item", item);
		
		List<Game> list = service.selectList();
		model.addAttribute("list", list);
		return "infra/game/xdmin/gameView";		
	}
	
	@RequestMapping(value = "gameModForm")
	public String gameModForm(Model model, GameVo vo) throws Exception {
		Game item = service.selectOne(vo);
		model.addAttribute("item", item);
		
		return "infra/game/xdmin/gameModForm";
	}
	
	@RequestMapping(value = "gameUpdt")
	public String gameUpdt(Game dto) throws Exception {
		int result = service.update(dto);
		System.out.println("Controller result : " + result);
		return "redirect:/game/gameList";
	}
}
