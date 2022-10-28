package com.spopia.infra.modules.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spopia.infra.common.constants.Constants;

@Controller
@RequestMapping(value = "/member/")
public class MemberController {
	
	@Autowired
	MemberServiceImpl service;
	
	public void setSearchAndPaging(MemberVo vo) throws Exception {
		vo.setShDelNy(vo.getShDelNy() == null ? 0 : vo.getShDelNy());
		
		vo.setParamsPaging(service.selectOneCount(vo));
	}
	
	@RequestMapping(value = "memberList")
	public String memberList(Model model, @ModelAttribute("vo") MemberVo vo) throws Exception {
		
		setSearchAndPaging(vo);
		
		List<Member> list = service.selectList(vo);
		model.addAttribute("list", list);
		
		return "infra/member/xdmin/memberList";
	}
	
	@RequestMapping(value = "memberXdminView")
	public String memberView(Model model, @ModelAttribute("vo") MemberVo vo) throws Exception {
		Member item = service.selectOne(vo);
		model.addAttribute("item", item);
		/*
		 * List<Member> list = service.selectList(); model.addAttribute("list", list);
		 */
		return "infra/member/xdmin/memberXdminView";
	}
	
	@RequestMapping(value = "memberModForm")
	public String memberModFrom(Model model, @ModelAttribute("vo") MemberVo vo) throws Exception {
		Member item = service.selectOne(vo); 
		model.addAttribute("item", item);
		return "infra/member/xdmin/memberModForm";
	}
	
	@RequestMapping(value = "memberUpdt")
	public String memberUpdt(Member dto, MemberVo vo, RedirectAttributes redirectAttributes) throws Exception {
		/* service.userUpdt(dto); */
		service.update(dto);
		
		vo.setSeq(dto.getSeq());
		redirectAttributes.addFlashAttribute("vo", vo);
		
		return "redirect:/member/memberModForm";
	}
	
	@RequestMapping(value = "memberUView")
	public String memberUView(@ModelAttribute("vo") MemberVo vo, Model model) throws Exception {

		Member snsItem = service.snsSelectOne(vo);
		
		System.out.println("item : " + snsItem.getId());
		
		if (snsItem.getId().equals("네이버로그인")) {
		    System.out.println("네이버 로그인 중");
		    Member item = service.snsSelectOne(vo);
		    model.addAttribute("item", item);
		} else if (snsItem.getId().equals("카카오로그인")) {
				System.out.println("카카오 로그인 중");
				Member item = service.snsSelectOne(vo);
				model.addAttribute("item", item);			
		}	else {
		    System.out.println("일반 로그인 중");
		    Member item = service.selectOne(vo);
		    model.addAttribute("item", item);
		}

		return "infra/member/user/memberView";
	}
 
	@RequestMapping(value = "memberUMod")
	public String memberUMod(MemberVo vo, Model model) throws Exception {
		
		Member item = service.snsSelectOne(vo);
		model.addAttribute("item", item);
//		System.out.println("test : " + item.getTeam());
//		
//		if (item.getTeam() == null) {
//		    Member snsItem = service.snsSelectOne(vo);
//		    model.addAttribute("item", snsItem);
//		} else {
//		    model.addAttribute("item", item);
//		}
		
		return "infra/member/user/memberUModForm";
	}
	

	@RequestMapping(value = "naverCallback")
	    public String naverCallback() throws Exception {
	    System.out.println("passing");
	    return "infra/login/xdmin/naverCallback";
    }
     

    /*
     * @ResponseBody
     * 
     * @RequestMapping(value = "naverCallback")
     * public Map<String, Object> naverCallback() throws Exception {
     * Map<String, Object> returnMap = new HashMap<String, Object>();
     * 
     * returnMap.put("rt", "success");
     * return returnMap;
     * }
     */

	@RequestMapping(value = "naverLoginProc")
	public String naverLoginProc(Member dto, HttpSession httpSession) throws Exception {
	    System.out.println("naverLoginProc");
          
	    // id 값 있는지 체크 
	    Member naverLogin = service.snsLoginCheck(dto);
          
	    if (naverLogin == null) {
	        System.out.println("여기는 : " + null);
	        service.naverInst(dto);
	        
	        Member naver = service.snsLoginCheck(dto);
  
	        httpSession.setMaxInactiveInterval(60 * Constants.SESSION_MINUTE); // 60second * 30 = 30minute
	        session(naver.getSeq(), naver.getId(), naver.getName(), naver.getEmail(), naver.getUser_div(), naver.getSnsImg(), httpSession);
	    } else {
	        System.out.println("여기는 :  not " + null);
  
	        httpSession.setMaxInactiveInterval(60 * Constants.SESSION_MINUTE); // 60second * 30 = 30minute
	        session(naverLogin.getSeq(), naverLogin.getId(), naverLogin.getName(), naverLogin.getEmail(), naverLogin.getUser_div(), naverLogin.getSnsImg(), httpSession);
	    }
	    return "redirect:/sportMain";
	}
	
	@ResponseBody
	@RequestMapping(value = "kakaoLoginProc")
	public Map<String, Object> kakaoLoginProc(Member dto, HttpSession httpSession) throws Exception {
	    Map<String, Object> returnMap = new HashMap<String, Object>();
	    
		Member kakaoLogin = service.snsLoginCheck(dto);
		
		if (kakaoLogin == null) {
			service.kakaoInst(dto);
			
			httpSession.setMaxInactiveInterval(60 * Constants.SESSION_MINUTE);
			session(dto.getSeq(), dto.getId(), dto.getName(), dto.getEmail(), dto.getUser_div(), dto.getSnsImg(), httpSession);
			returnMap.put("rt", "success");
		} else {
			httpSession.setMaxInactiveInterval(60 * Constants.SESSION_MINUTE);
			
			session(kakaoLogin.getSeq(), kakaoLogin.getId(), kakaoLogin.getName(), kakaoLogin.getEmail(), kakaoLogin.getUser_div(), kakaoLogin.getSnsImg(), httpSession);
			returnMap.put("rt", "success");
		}
		return returnMap;
	}
	
	 public void session(String seq, String id, String name, String email, Integer user, String img, HttpSession httpSession) {
		 httpSession.setAttribute("sessSeq", seq);
		 httpSession.setAttribute("sessId", id);
		 httpSession.setAttribute("sessName", name);
		 httpSession.setAttribute("sessEmail", email);
		 httpSession.setAttribute("sessUser", user);
		 httpSession.setAttribute("sessImg", img);
	 }
	
}
