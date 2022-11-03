package com.spopia.infra.modules.article;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spopia.infra.modules.code.CodeServiceImpl;
import com.spopia.infra.modules.game.GameServiceImpl;
import com.spopia.infra.modules.member.Member;
import com.spopia.infra.modules.member.MemberVo;

@Controller
@RequestMapping(value = "/article/")
public class ArticleController {

	@Autowired
	ArticleServiceImpl service;
	@Autowired
	GameServiceImpl gService;

	public void setSearchAndPaging(ArticleVo vo) throws Exception {
		vo.setShDelNy(vo.getShDelNy() == null ? 0 : vo.getShDelNy());
		
		vo.setParamsPaging(service.selectOneCount(vo));
	}

	@RequestMapping(value = "articleList")
	public String articleList(Model model, @ModelAttribute("vo") ArticleVo vo) throws Exception {
		setSearchAndPaging(vo);
		
		List<Article> list = service.selectList(vo);
		model.addAttribute("list", list);
		return "infra/article/xdmin/articleList";
	}

	@RequestMapping(value = "articleForm")
	public String articleForm(@ModelAttribute("vo") ArticleVo vo, Model model, Article dto) throws Exception {
		
		Article item = service.selectOne(vo);
		model.addAttribute("item", item);
		
		System.out.println("abroad");
		List<Article> abroad = service.abroad(dto);
		model.addAttribute("abroad", abroad);
		
		return "infra/article/xdmin/articleForm";
	}

	@RequestMapping(value = "articleInst")
	public String articleInst(Article dto, ArticleVo vo, RedirectAttributes redirectAttributes) throws Exception {
		service.insert(dto);
		
		vo.setaSeq(dto.getaSeq());
		redirectAttributes.addFlashAttribute("vo", vo);
		return "redirect:/article/articleForm";
	}
	
	@RequestMapping(value = "articleXdminView")
	public String articleView(Model model, ArticleVo vo) throws Exception {
		Article item = service.selectOne(vo);
		model.addAttribute("item", item);
		
		List<Article> list = service.selectList1();
		model.addAttribute("list", list);
		return "infra/article/xdmin/articleXdminView";
	}	
	
	@RequestMapping(value = "articleModForm")
	public String articleModForm(Model model, ArticleVo vo) throws Exception {
		Article item = service.selectOne(vo);
		model.addAttribute("item", item);
		
		return "infra/article/xdmin/articleModForm";
	}
	
	@RequestMapping(value = "articleUpdt")
	public String articleUpdt(Article dto, ArticleVo vo, RedirectAttributes redirectAttributes) throws Exception {
	    System.out.println("test : " + dto.getaEvent());
		service.update(dto);
		
		vo.setaSeq(dto.getaSeq());
		redirectAttributes.addFlashAttribute("vo", vo);
		return "redirect:/article/articleList";
	}
	
	@RequestMapping(value = "articleUele")
    public String gameUele(Article dto) throws Exception {
        service.uelete(dto);
        return "redirect:/article/articleList";
    }
    
    @RequestMapping(value = "articleDele")
    public String gameDele(ArticleVo vo) throws Exception {
        service.delete(vo);
        return "redirect:/article/articleList";
    }
	
	@ResponseBody
	@RequestMapping(value = "abroad")
	public Map<String, Object> abroad(Article dto) throws Exception {
	    Map<String, Object> returnMap = new HashMap<String, Object>();
	    
	    List<Article> event = service.event(dto);
	    
	    if (event != null) {
	        returnMap.put("rt", "success");
	        returnMap.put("event", event);
	    } else {
	        returnMap.put("rt", "fail");
	    }
	    
	    return returnMap;
	}
	
	@ResponseBody
	@RequestMapping(value = "event")
	public Map<String, Object> event(Article dto) throws Exception {
	    Map<String, Object> returnMap = new HashMap<String, Object>();
	    
	    List<Article> league = service.league(dto);
	    
	    if (league != null ) {
	        returnMap.put("rt", "success");
	        returnMap.put("league", league);
	    } else {
	        returnMap.put("rt", "fail");
	    }
	    
	    return returnMap;
	}
	
	 /* excel Download s */
    public void setSearch(ArticleVo vo) throws Exception {
       vo.setShDelNy(vo.getShDelNy() == null ? 0 : vo.getShDelNy());
       vo.setShOption(vo.getShOption() == null ? 0 : vo.getShOption());
   }
   
   @RequestMapping("excelDownload")
   public void excelDownload(ArticleVo vo, HttpServletResponse httpServletResponse) throws Exception {
       
       setSearch(vo);
       vo.setParamsPaging(service.selectOneCount(vo));

       if (vo.getTotalRows() > 0) {
           List<Article> list = service.selectList(vo);
           
//           Workbook workbook = new HSSFWorkbook(); // for xls
           Workbook workbook = new XSSFWorkbook();
           Sheet sheet = workbook.createSheet("Sheet1");
           CellStyle cellStyle = workbook.createCellStyle();        
           Row row = null;
           Cell cell = null;
           int rowNum = 0;
           
//           each column width setting           
           sheet.setColumnWidth(0, 2100);
           sheet.setColumnWidth(1, 3100);

//           Header
           String[] tableHeader = {"Seq", "제목", "내용", "신문사", "기자", "해외여부", "종목", "리그", "등록일"};

           row = sheet.createRow(rowNum++);
           
           for(int i=0; i<tableHeader.length; i++) {
               cell = row.createCell(i);
               cellStyle.setAlignment(HorizontalAlignment.CENTER);
               cell.setCellStyle(cellStyle);
               cell.setCellValue(tableHeader[i]);
           }

//           Body
           for (int i=0; i<list.size(); i++) {
               row = sheet.createRow(rowNum++);
               
//               String type: null 전달 되어도 ok
//               int, date type: null 시 오류 발생 하므로 null check
//               String type 이지만 정수형 데이터가 전체인 seq 의 경우 캐스팅               
               
               cell = row.createCell(0);
               cellStyle.setAlignment(HorizontalAlignment.CENTER);
               cell.setCellStyle(cellStyle);
               cell.setCellValue(Integer.parseInt(list.get(i).getaSeq()));

               cell = row.createCell(1);
               cellStyle.setAlignment(HorizontalAlignment.CENTER);
               cell.setCellStyle(cellStyle);
               cell.setCellValue(list.get(i).getTitle());
               
               cell = row.createCell(2);
               cellStyle.setAlignment(HorizontalAlignment.CENTER);
               cell.setCellStyle(cellStyle);
               cell.setCellValue(list.get(i).getContent());

               cell = row.createCell(3);
               cellStyle.setAlignment(HorizontalAlignment.CENTER);
               cell.setCellStyle(cellStyle);
               cell.setCellValue(list.get(i).getNewspaper());

               cell = row.createCell(4);
               cellStyle.setAlignment(HorizontalAlignment.CENTER);
               cell.setCellStyle(cellStyle);
               cell.setCellValue(list.get(i).getReporter());

               cell = row.createCell(5);
               cellStyle.setAlignment(HorizontalAlignment.CENTER);
               cell.setCellStyle(cellStyle);
               cell.setCellValue(CodeServiceImpl.selectOneCachedCode(list.get(i).getaAbroadNy()));

               cell = row.createCell(6);
               cellStyle.setAlignment(HorizontalAlignment.CENTER);
               cell.setCellStyle(cellStyle);
               cell.setCellValue(CodeServiceImpl.selectOneCachedCode(list.get(i).getaEvent()));

               cell = row.createCell(7);
               cellStyle.setAlignment(HorizontalAlignment.CENTER);
               cell.setCellStyle(cellStyle);
               cell.setCellValue(CodeServiceImpl.selectOneCachedCode(list.get(i).getaLeague()));

               cell = row.createCell(8);
               cellStyle.setAlignment(HorizontalAlignment.CENTER);
               cell.setCellStyle(cellStyle);
               cell.setCellValue(list.get(i).getaCreatedAt());

           }

           httpServletResponse.setContentType("ms-vnd/excel");
//           httpServletResponse.setHeader("Content-Disposition", "attachment;filename=example.xls");    // for xls
           httpServletResponse.setHeader("Content-Disposition", "attachment;filename=article.xlsx");

           workbook.write(httpServletResponse.getOutputStream());
           workbook.close();
       }
   }
    /* excel Download e */
	
}
