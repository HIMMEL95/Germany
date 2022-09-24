package com.spopia.infra.modules.login;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mysql.cj.Session;
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
		service.insert(dto);
		return "infra/login/xdmin/userLogin";
	}

	@ResponseBody
	@RequestMapping(value = "idCheck")
	public Map<String, Object> idCheck(Member dto) throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		int result = service.idCheck(dto);
		
		if (result > 0) {
			returnMap.put("rt", "fail");
		} else {
			returnMap.put("rt", "success");
		}
		return returnMap;
	}
	
	@ResponseBody
	@RequestMapping(value = "loginCheck")
	public Map<String, Object> loginCheck(Member dto, HttpServletRequest request) throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		HttpSession session = request.getSession();
		
		Member result = service.loginCheck(dto);
		
		System.out.println("result : " + result);
		
		return returnMap;
	}
}
