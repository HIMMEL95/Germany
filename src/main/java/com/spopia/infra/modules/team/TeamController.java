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
    public String testPage(Model model, Team dto) throws Exception {
        
        List<Team> list = service.abroad(dto);
        model.addAttribute("list", list);
        return "infra/member/user/test";
    }
    
    /*
     * @ResponseBody
     * 
     * @RequestMapping(value = "abroad")
     * public Map<String, Object> abroad(Team dto, Model model) throws Exception {
     * Map<String, Object> returnMap = new HashMap<String, Object>();
     * 
     * System.out.println("etestt");
     * 
     * List<Team> event = service.event(dto);
     * 
     * if (event != null) {
     * returnMap.put("rt", "success");
     * returnMap.put("event", event);
     * } else {
     * returnMap.put("rt", "fail");
     * }
     * 
     * return returnMap;
     * }
     * 
     * @ResponseBody
     * 
     * @RequestMapping(value = "event")
     * public Map<String, Object> event(Team dto, Model model) throws Exception {
     * Map<String, Object> returnMap = new HashMap<String, Object>();
     * 
     * List<Team> league = service.league(dto);
     * 
     * if (league != null) {
     * returnMap.put("rt", "success");
     * returnMap.put("league", league);
     * } else {
     * returnMap.put("rt", "fail");
     * }
     * 
     * return returnMap;
     * }
     * 
     * @ResponseBody
     * 
     * @RequestMapping(value = "league")
     * public Map<String, Object> league(Team dto, Model model) throws Exception {
     * Map<String, Object> returnMap = new HashMap<String, Object>();
     * 
     * List<Team> teamName = service.teamName(dto);
     * 
     * if (teamName != null) {
     * returnMap.put("rt", "success");
     * returnMap.put("teamName", teamName);
     * } else {
     * returnMap.put("rt", "fail");
     * }
     * 
     * return returnMap;
     * }
     */

 

}
