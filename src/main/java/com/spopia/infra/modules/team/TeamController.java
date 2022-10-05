package com.spopia.infra.modules.team;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class TeamController {
    
    @Autowired
    TeamServiceImpl service;
    
    @RequestMapping(value = "testPage")
    public String testPage(Model model) throws Exception {
        List<Team> list = service.selectList();
        model.addAttribute("list", list);
        return "infra/member/user/test";
    }
    
    @ResponseBody
    @RequestMapping(value = "abroad")
    public Map<String, Object> abroad(Team dto, Model model) throws Exception {
        Map<String, Object> returnMap = new HashMap<String, Object>();
        
        List<Team> list = service.selectList();
                
        List<Team> result = service.abroad(dto);
        
        if (result != null) {
            returnMap.put("rt", result);
        } else {
            returnMap.put("rt", "fail");
            returnMap.put("list", list);
        }
        
        return returnMap;
    }
    
    @ResponseBody
    @RequestMapping(value = "event")
    public Map<String, Object> event(Team dto, Model model) throws Exception {
        Map<String, Object> returnMap = new HashMap<String, Object>();
        
        List<Team> list = service.selectList();
        
        List<Team> result = service.abroad(dto);
        
        if (result != null) {
            returnMap.put("rt", result);
        } else {
            returnMap.put("rt", "fail");
            returnMap.put("list", list);
        }
        
        return returnMap;
    }
    
    @ResponseBody
    @RequestMapping(value = "league")
    public Map<String, Object> league(Team dto, Model model) throws Exception {
        Map<String, Object> returnMap = new HashMap<String, Object>();
        
        List<Team> list = service.selectList();
        
        List<Team> result = service.abroad(dto);
        
        if (result != null) {
            returnMap.put("rt", result);
        } else {
            returnMap.put("rt", "fail");
            returnMap.put("list", list);
        }
        
        return returnMap;
    }
    
    @ResponseBody
    @RequestMapping(value = "teamName")
    public Map<String, Object> teamName(Team dto, Model model) throws Exception {
        Map<String, Object> returnMap = new HashMap<String, Object>();
        
        List<Team> list = service.selectList();
        
        List<Team> result = service.abroad(dto);
        
        if (result != null) {
            returnMap.put("rt", result);
        } else {
            returnMap.put("rt", "fail");
            returnMap.put("list", list);
        }
        
        return returnMap;
    }
 

}
