package com.spopia.infra.modules.login;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spopia.infra.common.constants.Constants;
import com.spopia.infra.common.util.UtilSecurity;
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
	
	@RequestMapping(value = "findId")
	public String findId() throws Exception {
		return "infra/login/xdmin/findId";
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
	public Map<String, Object> loginCheck(Member dto, HttpSession httpSession) throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		dto.setPwd(UtilSecurity.encryptSha256(dto.getPwd()));
		Member result = service.loginCheck(dto);
		
		if (result != null) {
			
			httpSession.setMaxInactiveInterval(60 * Constants.SESSION_MINUTE); // 60second * 30 = 30minute
			httpSession.setAttribute("sessSeq", result.getSeq());
			httpSession.setAttribute("sessId", result.getId());
			httpSession.setAttribute("sessName", result.getName());
			httpSession.setAttribute("sessEmail", result.getEmail());
			httpSession.setAttribute("sessUser", result.getUser_div());
	
			returnMap.put("rt", "success");
		} else {
			returnMap.put("rt", "fail");
		}
		return returnMap;
	}

	@ResponseBody
	@RequestMapping(value = "xdminLoginCheck")
	public Map<String, Object> xdminLoginCheck(Member dto, HttpSession httpSession) throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		dto.setPwd(UtilSecurity.encryptSha256(dto.getPwd()));
		Member result = service.xdminLoginCheck(dto);
		
		if (result != null) {
			
			httpSession.setMaxInactiveInterval(60 * Constants.SESSION_MINUTE); // 60second * 30 = 30minute
			httpSession.setAttribute("sessSeq", result.getSeq());
			httpSession.setAttribute("sessId", result.getId());
			httpSession.setAttribute("sessName", result.getName());
			httpSession.setAttribute("sessEmail", result.getEmail());
			httpSession.setAttribute("sessUser", result.getUser_div());
			
			returnMap.put("rt", "success");
		} else {
			returnMap.put("rt", "fail");
		}
		return returnMap;
	}
	
	@ResponseBody
	@RequestMapping(value = "logoutProc")
	public Map<String, Object> logoutProc(HttpSession httpSession) throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		httpSession.invalidate();
		returnMap.put("rt", "success");
		return returnMap;
	}
	
	@RequestMapping(value = "kakaoLogin")
	public String kakaoLogin() throws Exception {
		return "/sportMain";
	}

	@RequestMapping(value = "naverLogin")
	public Map<String, Object> naverLogin(Member dto, HttpSession httpSession) throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		dto.setPwd(UtilSecurity.encryptSha256(dto.getPwd()));
		Member result = service.xdminLoginCheck(dto);
		
		return returnMap;
	}
}
