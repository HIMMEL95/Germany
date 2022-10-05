package com.spopia.infra.modules.team;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class TeamController {
    
    @Autowired
    TeamServiceImpl service;
    
    @RequestMapping(value = "testPage")
    public String testPage() throws Exception {
        return "infra/member/user/test";
    }
    
    @ResponseBody
    @RequestMapping(value = "test")
    public Map<String, Object> test(Team dto) throws Exception {
        Map<String, Object> returnMap = new HashMap<String, Object>();
                
        List<Team> result = service.selectTest(dto);
        
        if (result != null) {
            returnMap.put("rt", result);
        } else {
            returnMap.put("rt", "fail");
        }
        
        return returnMap;
    }
 

}
