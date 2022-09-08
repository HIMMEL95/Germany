package com.spopia.infra.modules.game;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/game/")
public class GameController {

	@Autowired
	GameServiceImpl service;
	
	@RequestMapping(value = "gameList")
	public String gameList() throws Exception {
		return "infra/game/xdmin/gameList";
	}
}
