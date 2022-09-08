package com.spopia.infra.modules.dashboard;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/")
public class DashboardController {

	@RequestMapping(value = "dashboard")
	public String dashboard() throws Exception {
		return "infra/dashboard/xdmin/dashboard";
	}
}
