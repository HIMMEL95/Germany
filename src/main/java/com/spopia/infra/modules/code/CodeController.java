package com.spopia.infra.modules.code;

import java.util.List;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spopia.infra.modules.codegroup.CodeGroup;
import com.spopia.infra.modules.codegroup.CodeGroupServiceImpl;

@Controller
@RequestMapping(value = "/code/")
public class CodeController {
	
	@Autowired
	CodeServiceImpl service;
	@Autowired
	CodeGroupServiceImpl cgService;
	
	public void setSearch(CodeVo vo) throws Exception {
        vo.setShDelNy(vo.getShDelNy() == null ? 0 : vo.getShDelNy());
        vo.setShOption(vo.getShOption() == null ? 0 : vo.getShOption());
    } 
	
	@RequestMapping(value = "codeList")
	public String codeList(Model model, @ModelAttribute("vo") CodeVo vo) throws Exception {
		
		setSearch(vo);

		List<Code> list = service.selectList(vo);
		model.addAttribute("list", list);
		return "infra/code/xdmin/codeList";
	}
	
	
	@RequestMapping(value = "codeAjaxList")
	public String codeAjaxList(@ModelAttribute("vo") CodeVo vo, Model model) throws Exception {
	    setSearch(vo);
	    return "infra/code/xdmin/codeAjaxList";
	}
	
	@RequestMapping(value = "codeAjaxLita")
	public String codeAjaxLita(@ModelAttribute("vo") CodeVo vo, Model model) throws Exception {
	    
	    System.out.println(service.selectOneCount(vo));
	    System.out.println(vo.getTotalRows());
	    vo.setParamsPaging(service.selectOneCount(vo));
	    
	    if (vo.getTotalRows() > 0) {
	        List<Code> list = service.selectList(vo);
	        model.addAttribute("list", list);
	    }
	    return "infra/code/xdmin/codeAjaxLita";
	}
	
	@RequestMapping(value = "codeForm")
	public String codeForm(Model model, @ModelAttribute("vo") CodeVo vo) throws Exception {	
		
		Code item = service.selectOne(vo);
		model.addAttribute("item", item);
		
		List<CodeGroup> list = cgService.selectList1();
		model.addAttribute("list", list);
		return "infra/code/xdmin/codeForm";
	}
	
	@RequestMapping(value = "codeInst")
	public String codeInst(Code dto, CodeVo vo, RedirectAttributes redirectAttributes) throws Exception {
		
		service.insert(dto);
		
		vo.setCcSeq(dto.getCcSeq());
		redirectAttributes.addFlashAttribute("vo", vo);
		return "redirect:/code/codeForm";
	}

	@RequestMapping(value = "codeView")
	public String codeView(@ModelAttribute("vo") CodeVo vo, Model model) throws Exception {
		Code item = service.selectOne(vo);
		model.addAttribute("item", item);
		
		List<CodeGroup> list1 = cgService.selectList1();
		model.addAttribute("list1", list1);
		return "infra/code/xdmin/codeForm";
	}
	
	@RequestMapping(value = "codeUpdt")
	public String codeUpdt(Code dto, CodeVo vo, RedirectAttributes redirectAttributes) throws Exception {
		service.update(dto);
		
		vo.setCcSeq(dto.getCcSeq());
		redirectAttributes.addFlashAttribute("vo", vo);
		return "redirect:/code/codeForm";
	}
	
	@RequestMapping(value = "codeUele")
	public String codeUele(Code dto) throws Exception {
		service.uelete(dto);
		return "redirect:/code/codeList";
	}
	
	@RequestMapping(value = "codeDele")
	public String codeDele(CodeVo vo) throws Exception {
		service.delete(vo);
		return "redirect:/code/codeList";
	}
	
	@RequestMapping(value = "codeMultiUele")
	public String codeMultiUele(CodeVo vo, Code dto, RedirectAttributes redirectAttributes) throws Exception {
		for (String checkboxSeq : vo.getCheckboxSeqArray()) {
			dto.setCcSeq(checkboxSeq);
			service.uelete(dto);
		}
		redirectAttributes.addFlashAttribute("vo", vo);
		return "redirect:/code/codeAjaxList";
	}

	@RequestMapping(value = "codeMultiDele")
	public String codeMultiDele(CodeVo vo, Code dto, RedirectAttributes redirectAttributes) throws Exception {
		for (String checkboxSeq : vo.getCheckboxSeqArray()) {
			vo.setCcSeq(checkboxSeq);
			service.delete(vo);
		}
		redirectAttributes.addFlashAttribute("vo", vo);
		return "redirect:/code/codeAjaxList";
	}

    /* excel Download s */
	@RequestMapping("excelDownload")
    public void excelDownload(CodeVo vo, HttpServletResponse httpServletResponse) throws Exception {
        
        setSearch(vo);
        vo.setParamsPaging(service.selectOneCount(vo));

        if (vo.getTotalRows() > 0) {
            List<Code> list = service.selectList(vo);
            
//          Workbook workbook = new HSSFWorkbook(); // for xls
            Workbook workbook = new XSSFWorkbook();
            Sheet sheet = workbook.createSheet("Sheet1");
            CellStyle cellStyle = workbook.createCellStyle();        
            Row row = null;
            Cell cell = null;
            int rowNum = 0;
            
//          each column width setting           
            sheet.setColumnWidth(0, 2100);
            sheet.setColumnWidth(1, 3100);

//          Header
            String[] tableHeader = {"Seq", "코드그룹코드", "코드그룹이름(한글)", "코드", "대체 코드", "코드 이름(한글)", "코드 이름(영문)", "사용", "순서", "등록일", "수정일"};

            row = sheet.createRow(rowNum++);
            
            for(int i=0; i<tableHeader.length; i++) {
                cell = row.createCell(i);
                cellStyle.setAlignment(HorizontalAlignment.CENTER);
                cell.setCellStyle(cellStyle);
                cell.setCellValue(tableHeader[i]);
            }

//          Body
            for (int i=0; i<list.size(); i++) {
                row = sheet.createRow(rowNum++);
                
//              String type: null 전달 되어도 ok
//              int, date type: null 시 오류 발생 하므로 null check
//              String type 이지만 정수형 데이터가 전체인 seq 의 경우 캐스팅               
                
                cell = row.createCell(0);
                cellStyle.setAlignment(HorizontalAlignment.CENTER);
                cell.setCellStyle(cellStyle);
                cell.setCellValue(Integer.parseInt(list.get(i).getCcgSeq()));

                cell = row.createCell(1);
                cellStyle.setAlignment(HorizontalAlignment.CENTER);
                cell.setCellStyle(cellStyle);
                cell.setCellValue(Integer.parseInt(list.get(i).getCcgSeq()));
                
                cell = row.createCell(2);
                cellStyle.setAlignment(HorizontalAlignment.CENTER);
                cell.setCellStyle(cellStyle);
                cell.setCellValue(list.get(i).getIfcgName());

                cell = row.createCell(3);
                cellStyle.setAlignment(HorizontalAlignment.CENTER);
                cell.setCellStyle(cellStyle);
                cell.setCellValue(Integer.parseInt(list.get(i).getCcSeq()));

                cell = row.createCell(4);
                cellStyle.setAlignment(HorizontalAlignment.CENTER);
                cell.setCellStyle(cellStyle);
                cell.setCellValue(list.get(i).getIfccAnother());

                cell = row.createCell(5);
                cellStyle.setAlignment(HorizontalAlignment.CENTER);
                cell.setCellStyle(cellStyle);
                cell.setCellValue(list.get(i).getIfccName());

                cell = row.createCell(6);
                cellStyle.setAlignment(HorizontalAlignment.CENTER);
                cell.setCellStyle(cellStyle);
                cell.setCellValue(list.get(i).getIfccNameEng());

                cell = row.createCell(7);
                cellStyle.setAlignment(HorizontalAlignment.CENTER);
                cell.setCellStyle(cellStyle);
                cell.setCellValue(list.get(i).getIfccUseNy());

                cell = row.createCell(8);
                cellStyle.setAlignment(HorizontalAlignment.CENTER);
                cell.setCellStyle(cellStyle);
                cell.setCellValue(list.get(i).getIfccOrder());

                cell = row.createCell(9);
                cellStyle.setAlignment(HorizontalAlignment.CENTER);
                cell.setCellStyle(cellStyle);
                cell.setCellValue(list.get(i).getCreatedAt());

                cell = row.createCell(10);
                cellStyle.setAlignment(HorizontalAlignment.CENTER);
                cell.setCellStyle(cellStyle);
                cell.setCellValue(list.get(i).getModifiedAt());
            }

            httpServletResponse.setContentType("ms-vnd/excel");
//          httpServletResponse.setHeader("Content-Disposition", "attachment;filename=example.xls");    // for xls
            httpServletResponse.setHeader("Content-Disposition", "attachment;filename=code.xlsx");

            workbook.write(httpServletResponse.getOutputStream());
            workbook.close();
        }
    }
	/* excel Download e */
}
