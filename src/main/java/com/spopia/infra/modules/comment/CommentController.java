package com.spopia.infra.modules.comment;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/comment/")
public class CommentController {
	
	@Autowired
	CommentServiceImpl service;
	
	@RequestMapping(value = "commentList")
	public String comment(Model model, CommentVo vo) throws Exception {
		
		List<Comment> list = service.selectList(vo);
		model.addAttribute("list", list);
		return "infra/comment/xdmin/commentList";
	}
}
