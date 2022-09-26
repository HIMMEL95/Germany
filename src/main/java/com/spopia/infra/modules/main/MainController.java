package com.spopia.infra.modules.main;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spopia.infra.modules.member.MemberServiceImpl;
import com.spopia.infra.modules.member.MemberVo;

@Controller
public class MainController {
	
	@Autowired
	MemberServiceImpl service;
	
	@RequestMapping(value = "/")
	public String main() throws Exception {
		return "infra/main/xdmin/main_page";
	}
	
	@RequestMapping(value = "sportMain")
	public String sportMain( @ModelAttribute("vo") MemberVo vo) throws Exception {

		return "infra/main/xdmin/sport_main";
	}

}
