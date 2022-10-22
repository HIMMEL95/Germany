package com.spopia.infra.modules.member;

import java.util.List;

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

		Member naverItem = service.naverSelectOne(vo);
		
		System.out.println("item : " + naverItem.getId());
		
		if (naverItem.getId().equals("네이버로그인")) {
		    System.out.println("네이버 로그인 중");
		    Member item = service.naverSelectOne(vo);
		    model.addAttribute("item", item);
		} else {
		    System.out.println("일반 로그인 중");
		    Member item = service.selectOne(vo);
		    model.addAttribute("item", item);
		}

		return "infra/member/user/memberView";
	}
 
	@RequestMapping(value = "memberUMod")
	public String memberUMod(MemberVo vo, Model model) throws Exception {
		
		Member item = service.selectOne(vo);
		model.addAttribute("item", item);
		
		return "infra/member/user/memberUModForm";
	}
	
	@RequestMapping(value = "naverCallback")
	public String naverCallback() throws Exception {
		System.out.println("passing");
		return "infra/login/xdmin/naverCallback";
	}

	@RequestMapping(value = "naverLoginProc")
	public String naverLoginProc(Member dto, HttpSession httpSession) throws Exception {
	    System.out.println("naverLoginProc");
          
	    // id 값 있는지 체크 
	    Member naverLogin = service.loginCheck(dto);
          
	    if (naverLogin == null) {
	        System.out.println("여기는 : " + null);
	        service.naverInst(dto);
	        Member naver = service.loginCheck(dto);
	        System.out.println("seq : " + naver.getSeq());
  
	        httpSession.setMaxInactiveInterval(60 * Constants.SESSION_MINUTE); // 60second * 30 = 30minute
	        httpSession.setAttribute("sessSeq", naver.getSeq());
	        httpSession.setAttribute("sessId", naver.getId());
	        httpSession.setAttribute("sessName", naver.getName());
	        httpSession.setAttribute("sessEmail", naver.getEmail());
	        httpSession.setAttribute("sessUser", naver.getUser_div());
	    } else {
	        System.out.println("여기는 :  not " + null);
  
	        httpSession.setMaxInactiveInterval(60 * Constants.SESSION_MINUTE); // 60second * 30 = 30minute
	        httpSession.setAttribute("sessSeq", naverLogin.getSeq());
	        httpSession.setAttribute("sessId", naverLogin.getId());
	        httpSession.setAttribute("sessName", naverLogin.getName());
	        httpSession.setAttribute("sessEmail", naverLogin.getEmail());
	        httpSession.setAttribute("sessUser", naverLogin.getUser_div());
	    }
	    return "redirect:/sportMain";
	}
	
	@RequestMapping(value = "kakaoCallback")
	public String kakaoCallback() throws Exception {
	    return "infra/login/xdmin/kakaoCallback";
	}
	
	@RequestMapping(value = "kakaoLoginProc")
	public String kakaoLoginProc() throws Exception {
		return "redirect:/sportMain";
	}
	
}
