package com.spopia.infra.modules.code;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spopia.infra.modules.codegroup.CodeGroup;
import com.spopia.infra.modules.codegroup.CodeGroupServiceImpl;
import com.spopia.infra.modules.codegroup.CodeGroupVo;

@Controller
@RequestMapping(value = "/code/")
public class CodeController {
	
	@Autowired
	CodeServiceImpl service;
	@Autowired
	CodeGroupServiceImpl cgService;
	
	public void setSearchAndPaging(CodeVo vo) throws Exception {
		vo.setShDelNy(vo.getShDelNy() == null ? 0 : vo.getShDelNy() );
		
		vo.setParamsPaging(service.selectOneCount(vo));
	}
	
	@RequestMapping(value = "codeList")
	public String codeList(Model model, @ModelAttribute("vo") CodeVo vo) throws Exception {
		
		System.out.println("vo.getShOption() : " + vo.getShOption());
		System.out.println("vo.getShValue() : " + vo.getShValue());
		
		setSearchAndPaging(vo);

		List<Code> list = service.selectList(vo);
		model.addAttribute("list", list);
		
		return "infra/code/xdmin/codeList";
	}
	
	@RequestMapping(value = "codeForm")
	public String codeForm(Model model, @ModelAttribute("vo") CodeGroupVo vo) throws Exception {	
		
		List<CodeGroup> list = cgService.selectList1();
		model.addAttribute("list", list);
		return "infra/code/xdmin/codeForm";
	}
	
	@RequestMapping(value = "codeInst")
	public String codeInst(Code dto) throws Exception {
		int result = service.insert(dto);
		System.out.println("controller result: "+ result);
		return "redirect:/code/codeList";
	}

	@RequestMapping(value = "codeView")
	public String codeView(@ModelAttribute("vo") CodeVo vo, Model model) throws Exception {
		Code item = service.selectOne(vo);
		model.addAttribute("item", item);
		
		List<CodeGroup> list1 = cgService.selectList();
		model.addAttribute("list1", list1);
		return "infra/code/xdmin/codeForm";
	}
	
	@RequestMapping(value = "codeUpdt")
	public String codeUpdt(Code dto) throws Exception {
		service.update(dto);
		return "redirect:/code/codeList";
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
