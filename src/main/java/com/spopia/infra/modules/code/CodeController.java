package com.spopia.infra.modules.code;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spopia.infra.modules.codegroup.CodeGroup;
import com.spopia.infra.modules.codegroup.CodeGroupServiceImpl;

@Controller
@RequestMapping(value = "/code/")
public class CodeController {
	
	@Autowired
	CodeServiceImpl service;
	@Autowired
	CodeGroupServiceImpl cgService;
	
	public void setSearchAndPaging(CodeVo vo) throws Exception {
		vo.setShDelNy(vo.getShDelNy() == null ? 0 : vo.getShDelNy());
		
		vo.setParamsPaging(service.selectOneCount(vo));
	}
	
	@RequestMapping(value = "codeList")
	public String codeList(Model model, @ModelAttribute("vo") CodeVo vo) throws Exception {
		
		setSearchAndPaging(vo);

		List<Code> list = service.selectList(vo);
		model.addAttribute("list", list);
		return "infra/code/xdmin/codeList";
	}
	
	@RequestMapping(value = "codeForm")
	public String codeForm(Model model, @ModelAttribute("vo") CodeVo vo) throws Exception {	
		
		Code item = service.selectOne(vo);
		model.addAttribute("item", item);
		
		List<CodeGroup> list = cgService.selectList1();
		model.addAttribute("list", list);
		return "infra/code/xdmin/codeForm";
	}
	
	@RequestMapping(value = "codeInst")
	public String codeInst(Code dto, CodeVo vo, RedirectAttributes redirectAttributes) throws Exception {
		
		service.insert(dto);
		
		vo.setCcSeq(dto.getCcSeq());
		redirectAttributes.addFlashAttribute("vo", vo);
		return "redirect:/code/codeForm";
	}

	@RequestMapping(value = "codeView")
	public String codeView(@ModelAttribute("vo") CodeVo vo, Model model) throws Exception {
		Code item = service.selectOne(vo);
		model.addAttribute("item", item);
		
		List<CodeGroup> list1 = cgService.selectList1();
		model.addAttribute("list1", list1);
		return "infra/code/xdmin/codeForm";
	}
	
	@RequestMapping(value = "codeUpdt")
	public String codeUpdt(Code dto, CodeVo vo, RedirectAttributes redirectAttributes) throws Exception {
		service.update(dto);
		
		vo.setCcSeq(dto.getCcSeq());
		redirectAttributes.addFlashAttribute("vo", vo);
		return "redirect:/code/codeForm";
	}
	
	@RequestMapping(value = "codeUele")
	public String codeUele(Code dto) throws Exception {
		service.uelete(dto);
		return "redirect:/code/codeList";
	}
	
	@RequestMapping(value = "codeDele")
	public String codeDele(CodeVo vo) throws Exception {
		service.delete(vo);
		return "redirect:/code/codeList";
	}
}
