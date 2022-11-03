package com.spopia.infra.modules;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class testController {
    
    @RequestMapping(value = "/test/publicCorona1List")
    public String publicCorona1List(Model model) throws Exception {
        
        System.out.println("asdfasdfasdf");
        
        String apiUrl = "http://apis.data.go.kr/1471000/MdlpPrdlstPrmisnInfoService03/getMdlpPrdlstPrmisnList02?serviceKey=LHSwFqTiNHfQEQw4PRhQhq4kY40LwyN9%2Fx4Q9NpOWQr8Dqqql2i630psVHxI4l7Ha37sT292A6M5SR1NCb41rQ%3D%3D&type=json";
        
        URL url = new URL(apiUrl);
        HttpURLConnection httpURLConnection = (HttpURLConnection) url.openConnection();
        httpURLConnection.setRequestMethod("GET");
        
        BufferedReader bufferedReader;
        if (httpURLConnection.getResponseCode() >= 200 && httpURLConnection.getResponseCode() <= 300) {
            bufferedReader = new BufferedReader(new InputStreamReader(httpURLConnection.getInputStream()));
        } else {
            bufferedReader = new BufferedReader(new InputStreamReader(httpURLConnection.getErrorStream()));
        }
        
        StringBuilder stringBuilder = new StringBuilder();
        String line;
        while ((line = bufferedReader.readLine()) != null) {
            System.out.println("line: " + line);
            stringBuilder.append(line);
        }

        bufferedReader.close();
        httpURLConnection.disconnect();

        System.out.println("stringBuilder.toString(): " + stringBuilder.toString());
        
//      json object + array string -> java map
        
        ObjectMapper objectMapper = new ObjectMapper();
        Map<String, Object> map = objectMapper.readValue(stringBuilder.toString(), Map.class);
        
        System.out.println("######## Map");
        for (String key : map.keySet()) {
            String value = String.valueOf(map.get(key));    // ok
            System.out.println("[key]:" + key + ", [value]:" + value);
        }
        
        Map<String, Object> header = new HashMap<String, Object>();
        header = (Map<String, Object>) map.get("header");
        
        System.out.println("######## Header");
        for (String key : header.keySet()) {
            String value = String.valueOf(header.get(key)); // ok
            System.out.println("[key]:" + key + ", [value]:" + value);
        }
        
//      String aaa = (String) header.get("resultCode");
        
//      System.out.println("header.get(\"resultCode\"): " + header.get("resultCode"));
//      System.out.println("header.get(\"resultMsg\"): " + header.get("resultMsg"));
        
        Map<String, Object> body = new HashMap<String, Object>();
        body = (Map<String, Object>) map.get("body");
        
        List<Test> items = new ArrayList<Test>();
        items = (List<Test>) body.get("items");
        
        System.out.println("items.size(): " + items.size());
        
//      for(Home item : items) {
//          System.out.println(item.getMM());
//      }
  
        model.addAllAttributes(header);
        model.addAllAttributes(body);
         
        return "test/publicCorona1List";
    }
}
