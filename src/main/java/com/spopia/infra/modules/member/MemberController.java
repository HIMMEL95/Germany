package com.spopia.infra.modules.member;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
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

		Member item = service.selectOne(vo);
		
	   model.addAttribute("item", item);

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
          Member naver = service.loginCheck(dto);
          
          if (naver == null) {
              
              System.out.println("여기는 : " + null);
              
              service.naverInst(dto);
              
              httpSession.setMaxInactiveInterval(60 * Constants.SESSION_MINUTE); // 60second * 30 = 30minute
              httpSession.setAttribute("sessSeq", naver.getSeq());
              httpSession.setAttribute("sessId", "네이버 로그인");
              httpSession.setAttribute("sessName", naver.getName());
              httpSession.setAttribute("sessEmail", naver.getEmail());
          } else {
              
              System.out.println("여기는 :  not " + null);
              
              httpSession.setMaxInactiveInterval(60 * Constants.SESSION_MINUTE); // 60second * 30 = 30minute
              httpSession.setAttribute("sessSeq", naver.getSeq());
              httpSession.setAttribute("sessId", "네이버 로그인");
              httpSession.setAttribute("sessName", naver.getName());
              httpSession.setAttribute("sessEmail", naver.getEmail());
          }
          
          // 있으면 로그인 세션 등록
          
          // 없으면 가입시키고 세션 등록
          
          return "redirect:/sportMain";
      }
    
}
