package com.spopia.infra.modules.comment;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/")
public class CommentController {
	
	@RequestMapping(value = "comment")
	public String comment() throws Exception {
		return "infra/comment/xdmin/comment";
	}
}
