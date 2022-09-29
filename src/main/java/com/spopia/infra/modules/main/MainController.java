package com.spopia.infra.modules.main;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
	
	@Autowired
	MainServiceImpl service;
	
	@RequestMapping(value = "/")
	public String main() throws Exception {
		return "infra/main/xdmin/main_page";
	}
	
	@RequestMapping(value = "sportMain")
	public String sportMain(Model model, MainVo vo) throws Exception {
		service.mainList(model, vo);
		return "infra/main/xdmin/sport_main";
	}

}
