package com.spopia.infra.modules.login;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spopia.infra.modules.member.Member;
import com.spopia.infra.modules.member.MemberServiceImpl;
import com.spopia.infra.modules.member.MemberVo;

@Controller
public class LoginController {
	
	@Autowired
	MemberServiceImpl service;

	@RequestMapping(value = "userLogin")
	public String userLogin() throws Exception {
		return "infra/login/xdmin/userLogin";
	}
	
	@RequestMapping(value = "xdminLogin")
	public String xdminLogin() throws Exception {
		return "infra/login/xdmin/xdminLogin";
	}
	
	@RequestMapping(value = "signUp")
	public String signUp(Member dto) throws Exception {
		return "infra/login/xdmin/signUp";
	}
	
	@RequestMapping(value = "signUpInst") 
	public String signUpInst(Member dto, MemberVo vo) throws Exception {
		service.userInst(dto);
		return "infra/login/xdmin/userLogin";
	}

	@RequestMapping(value = "idCheck")
	@ResponseBody
	public String idCheck(@RequestParam("id") String id) throws Exception {
		String cnt = service.idCheck(id);
		System.out.println("cnt 1 : " + cnt);
		return cnt;
	}
}
