package com.spopia.infra.modules.login;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spopia.infra.common.util.UtilCookie;
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
    @RequestMapping(value = "findID")
    public Map<String, Object> findID(Member dto) throws Exception {
        Map<String, Object> returnMap = new HashMap<String, Object>();
        
        Member id = service.findId(dto);

        if (id != null) {
            returnMap.put("rt", "success");
            returnMap.put("id", id);
        } else {
            returnMap.put("rt", "fail");
        }
        
        return returnMap;
    }
    
    @ResponseBody
    @RequestMapping(value = "findPwd")
    public Map<String, Object> findPwd(Member dto) throws Exception {
        Map<String, Object> returnMap = new HashMap<String, Object >();
        
        int pwd = service.findPwd(dto);
        
        if (pwd == 1) {
            returnMap.put("rt", "success");
        } else {
            returnMap.put("rt", "fail");
        }
        
        return returnMap;
    }
    
    @ResponseBody
    @RequestMapping(value = "changePwd")
    public Map<String, Object> changePwd(Member dto) throws Exception {
        Map<String, Object> returnMap = new HashMap<String, Object>();
        
        int pwd = service.findPwd(dto);
        
        if (pwd == 1) {
            returnMap.put("rt", "success");
            service.changePwd(dto);
        } else {
            returnMap.put("rt", "fail");
        }
        
        return returnMap;
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
			httpSession.setAttribute("sessSns", result.getSns_type());
	
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
	
	
	
}
