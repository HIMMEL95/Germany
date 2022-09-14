package com.spopia.infra.modules.codegroup;

import java.util.List;

import org.apache.logging.log4j.core.appender.rewrite.MapRewritePolicy.Mode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping(value = "/codeGroup/")
public class CodeGroupController {
	
	@Autowired
	CodeGroupServiceImpl service;

	@RequestMapping(value = "codeGroupList")
	public String codeGroupList(Model model, @ModelAttribute("vo") CodeGroupVo vo) throws Exception {

		System.out.println("vo.getShOption : " + vo.getShOption());
		System.out.println("vo.getShValue : " + vo.getShValue());
		
		List<CodeGroup> list = service.selectList(vo);
		model.addAttribute("list", list);
		
		return "infra/codegroup/xdmin/codeGroupList";
	}
	
	@RequestMapping(value = "codeGroupForm")
	public String codeGroupForm() throws Exception {
		return "infra/codegroup/xdmin/codeGroupForm";
	}

	
	@RequestMapping(value = "codeGroupInst")
	public String codeGroupInst(CodeGroup dto) throws Exception {
		int result = service.insert(dto);
		System.out.println("controller result: "+ result);
		return "redirect:/codeGroup/codeGroupList";
	}
	
	@RequestMapping(value = "codeGroupView")
	public String CodeGroupView(@ModelAttribute("vo") CodeGroupVo vo, Model model) throws Exception {
		CodeGroup item = service.selectOne(vo);
		model.addAttribute("item", item);
		return "infra/codegroup/xdmin/codeGroupForm";
	}
	
	@RequestMapping(value = "codeGroupUpdt")
	public String codeGroupUpdt(CodeGroup dto) throws Exception {
		int result = service.update(dto);
		System.out.println("Controller Result : " + result);
		return "redirect:/codeGroup/codeGroupList";
	}
	
	@RequestMapping(value = "codeGroupUele")
	public String codeGroupUele(CodeGroup dto) throws Exception {
		int result = service.uelete(dto);
		System.out.println("Controller Result : " + result);
		return "redirect:/codeGroup/codeGroupList";
	}
	
	@RequestMapping(value = "codeGroupDele")
	public String codeGroupDele(CodeGroupVo vo) throws Exception {
		int result = service.delete(vo);
		System.out.println("Controller Result : " + result);
		return "redirect:/codeGroup/codeGroupList";
	}
	
	/* pagination 관련 */
	@RequestMapping(value = "getList", method = RequestMethod.GET)
	public String getList(Model model
			, @RequestParam(required = false, defaultValue = "1") int page
			, @RequestParam(required = false, defaultValue = "1") int range
			) throws Exception {
		
		/* 전체 게시글 개수 */
		int listCnt = service.getCnt();
		
		/* Pagination 객체생성 */
		Pagination pagination = new Pagination();
		pagination.pageInfo(page, range, listCnt);
		
		model.addAttribute("pagination", pagination);
		model.addAttribute("getList", service.getList(pagination));
		return "redirect:/codeGroup/codeGroupList";
		
	}
}

