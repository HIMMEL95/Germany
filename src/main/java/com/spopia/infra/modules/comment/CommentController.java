package com.spopia.infra.modules.comment;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/comment/")
public class CommentController {
	
	@Autowired
	CommentServiceImpl service;
	
	  public void setSearchAndPaging(CommentVo vo) throws Exception {
		  vo.setShDelNy(vo.getShDelNy() == null ? 0 : vo.getShDelNy());
	  
		  vo.setParamsPaging(service.selectOneCount(vo)); 
	  }

	@RequestMapping(value = "commentList")
	public String comment(Model model, @ModelAttribute("vo") CommentVo vo) throws Exception {
		
		setSearchAndPaging(vo); 
		
		List<Comment> list = service.selectList(vo);
		model.addAttribute("list", list);
		return "infra/comment/xdmin/commentList";
	}
}
