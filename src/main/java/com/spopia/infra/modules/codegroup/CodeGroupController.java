package com.spopia.infra.modules.codegroup;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping(value = "/codeGroup/")
public class CodeGroupController {
	
	@Autowired
	CodeGroupServiceImpl service;
	
	public void setSearchAndPaging(CodeGroupVo vo) throws Exception {
		/* vo.setShDate(vo.getShDate() == null ? 1 : vo.getShDate()); */
		vo.setShDelNy(vo.getShDelNy() == null  ? 0 : vo.getShDelNy());
		
		vo.setParamsPaging(service.selectOneCount(vo));
	}


	@RequestMapping(value = "codeGroupList")
	public String codeGroupList(Model model, @ModelAttribute("vo") CodeGroupVo vo) throws Exception {
		
		setSearchAndPaging(vo);
		
		List<CodeGroup> list = service.selectList(vo);
		model.addAttribute("list", list);
		return "infra/codegroup/xdmin/codeGroupList";
	}
	
	@RequestMapping(value = "codeGroupForm")
	public String codeGroupForm(@ModelAttribute("vo") CodeGroupVo vo, Model model, CodeGroup dto) throws Exception {
		
		CodeGroup item = service.selectOne(vo);
		model.addAttribute("item", item);
		return "infra/codegroup/xdmin/codeGroupForm";
	}

	@RequestMapping(value = "codeGroupInst")
	public String codeGroupInst(CodeGroup dto, CodeGroupVo vo, RedirectAttributes redirectAttributes) throws Exception {
		
		System.out.println("dto : " + dto.getCcgSeq());
		service.insert(dto);
		System.out.println("dto : " + dto.getCcgSeq());

		vo.setCcgSeq(dto.getCcgSeq());
		
		redirectAttributes.addFlashAttribute("vo", vo);
		return "redirect:/codeGroup/codeGroupForm";
	}
	
	@RequestMapping(value = "codeGroupView")
	public String CodeGroupView(@ModelAttribute("vo") CodeGroupVo vo, Model model) throws Exception {
		CodeGroup item = service.selectOne(vo);
		model.addAttribute("item", item);
		return "infra/codegroup/xdmin/codeGroupForm";
	}
	
	@RequestMapping(value = "codeGroupUpdt")
	public String codeGroupUpdt(CodeGroup dto, CodeGroupVo vo, RedirectAttributes redirectAttributes) throws Exception {
		service.update(dto);
		
		vo.setCcgSeq(dto.getCcgSeq());
		redirectAttributes.addFlashAttribute("vo", vo);
		return "redirect:/codeGroup/codeGroupForm";
	}
	
	@RequestMapping(value = "codeGroupUele")
	public String codeGroupUele(CodeGroup dto) throws Exception {
		service.uelete(dto);
		return "redirect:/codeGroup/codeGroupList";
	}
	
	@RequestMapping(value = "codeGroupDele")
	public String codeGroupDele(CodeGroupVo vo) throws Exception {
		service.delete(vo);
		return "redirect:/codeGroup/codeGroupList";
	}
	
}

