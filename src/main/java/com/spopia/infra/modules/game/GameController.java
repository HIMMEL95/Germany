package com.spopia.infra.modules.game;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	public String gameList(Model model, @ModelAttribute("vo") GameVo vo, Game dto) throws Exception {
		
		setSearchAndPaging(vo);
		
		List<Game> list = service.selectList(vo);
		model.addAttribute("list", list);
		
		return "infra/game/xdmin/gameList";
	}
	
	@RequestMapping(value = "gameForm")
	public String gameForm(Model model, @ModelAttribute("vo") GameVo vo, Game dto) throws Exception {
		
		Game item = service.selectOne(vo);
		model.addAttribute("item", item);
		
		List<Game> gameList = service.gameList(dto);
		model.addAttribute("gameList", gameList);
		
		List<Game> abroad = service.abroad(dto);
		model.addAttribute("abroad", abroad);

		List<Game> event = service.event(dto);
		model.addAttribute("event", event);
		
		List<Game> league = service.league(dto);
		model.addAttribute("league", league);

		List<Game> team = service.teamName(dto);
		model.addAttribute("team", team);
		
		return "infra/game/xdmin/gameForm";
	}
	
	@RequestMapping(value = "gameInst")
	public String gameInst(Game dto, GameVo vo, Model model, RedirectAttributes redirectAttributes) throws Exception {
		service.insert(dto);

		vo.setgSeq(dto.getgSeq());
		redirectAttributes.addFlashAttribute("vo", vo);
		return "redirect:/game/gameForm";
	}
	
    /*
     * @RequestMapping(value = "gameView")
     * public String gameView(Model model, @ModelAttribute("vo") GameVo vo) throws
     * Exception {
     * Game item = service.selectOne(vo);
     * model.addAttribute("item", item);
     * 
     * return "infra/game/xdmin/gameForm";
     * }
     */
	
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
	
	@ResponseBody
    @RequestMapping(value = "abroad")
    public Map<String, Object> abroad(Game dto, Model model) throws Exception {
        Map<String, Object> returnMap = new HashMap<String, Object>();
       
        System.out.println("etestt");
        
        List<Game> event = service.event(dto);
        
        if (event != null) {
            returnMap.put("rt", "success");
            returnMap.put("event", event);
        } else {
            returnMap.put("rt", "fail");
        }
        
        return returnMap;
    }
    
    @ResponseBody
    @RequestMapping(value = "event")
    public Map<String, Object> event(Game dto, Model model) throws Exception {
        Map<String, Object> returnMap = new HashMap<String, Object>();

        List<Game> league = service.league(dto);
        
        if (league != null) {
            returnMap.put("rt", "success");
            returnMap.put("league", league);
        } else {
            returnMap.put("rt", "fail");
        }
        
        return returnMap;
    }
    
    @ResponseBody
    @RequestMapping(value = "league")
    public Map<String, Object> league(Game dto, Model model) throws Exception {
        Map<String, Object> returnMap = new HashMap<String, Object>();
        
        List<Game> teamName = service.teamName(dto);
        
        if (teamName != null) {
            returnMap.put("rt", "success");
            returnMap.put("teamName", teamName);
        } else {
            returnMap.put("rt", "fail");
        }
        
        return returnMap;
    }
	
}
