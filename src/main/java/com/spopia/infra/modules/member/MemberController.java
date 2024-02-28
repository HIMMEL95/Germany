package com.spopia.infra.modules.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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

import com.spopia.infra.common.constants.Constants;
import com.spopia.infra.modules.code.CodeServiceImpl;

import net.nurigo.sdk.NurigoApp;
import net.nurigo.sdk.message.exception.NurigoMessageNotReceivedException;
import net.nurigo.sdk.message.model.Message;
import net.nurigo.sdk.message.service.DefaultMessageService;

@Controller
@RequestMapping(value = "/member/")
public class MemberController {
	
	@Autowired
	MemberServiceImpl service;
	
	public void setSearchAndPaging(MemberVo vo) throws Exception {
		vo.setShDelNy(vo.getShDelNy() == null ? 0 : vo.getShDelNy());
		
		vo.setParamsPaging(service.selectOneCount(vo));
	}
	
	@RequestMapping(value = "memberList")
	public String memberList(Model model, @ModelAttribute("vo") MemberVo vo) throws Exception {
		
		setSearchAndPaging(vo);
		
		List<Member> list = service.selectList(vo);
		model.addAttribute("list", list);
		
		return "infra/member/xdmin/memberList";
	}
	
	@RequestMapping(value = "memberXdminView")
	public String memberView(Model model, @ModelAttribute("vo") MemberVo vo) throws Exception {
		Member item = service.selectOne(vo);
		model.addAttribute("item", item);
		/*
		 * List<Member> list = service.selectList(); model.addAttribute("list", list);
		 */
		return "infra/member/xdmin/memberXdminView";
	}
	
	@RequestMapping(value = "memberModForm")
    public String memberModFrom(Model model, @ModelAttribute("vo") MemberVo vo) throws Exception {
        Member item = service.selectOne(vo); 
        model.addAttribute("item", item);
        return "infra/member/xdmin/memberModForm";
    }
	
	@RequestMapping(value = "memberXUpdt")
    public String memberXUpdt(Member dto, MemberVo vo, RedirectAttributes redirectAttributes) throws Exception {
        service.userXUpdt(dto);
        
        vo.setSeq(dto.getSeq());
        redirectAttributes.addFlashAttribute("vo", vo);

        return "redirect:/member/memberModForm";
    }
	
	@RequestMapping(value = "memberUpdt")
	public String memberUpdt(Member dto, MemberVo vo, RedirectAttributes redirectAttributes) throws Exception {
		/* service.userUpdt(dto); */
		
		Member user = service.snsSelectOne(vo);
		
		System.out.println(user.getId().equals("네이버로그인"));
		
		if (user.getId().equals("네이버로그인") || user.getId().equals("카카오로그인")) {
			service.update(dto);
		} else {
			service.update(dto);
		}
		
		vo.setSeq(dto.getSeq());
		redirectAttributes.addFlashAttribute("vo", vo);
		
		return "redirect:/member/memberUMod";
	}
	
	@RequestMapping(value = "memberUView")
	public String memberUView(@ModelAttribute("vo") MemberVo vo, Model model) throws Exception {

		Member snsItem = service.snsSelectOne(vo);
		
		if (snsItem.getId().equals("네이버로그인")) {
		    System.out.println("네이버 로그인 중");
		    Member item = service.snsSelectOne(vo);
		    model.addAttribute("item", item);
		} else if (snsItem.getId().equals("카카오로그인")) {
			System.out.println("카카오 로그인 중");
			Member item = service.snsSelectOne(vo);
			model.addAttribute("item", item);			
		}	else {
		    System.out.println("일반 로그인 중");
		    Member item = service.selectOne(vo);
		    model.addAttribute("item", item);
		}

		return "infra/member/user/memberView";
	}
 
	@RequestMapping(value = "memberUMod")
	public String memberUMod(@ModelAttribute("vo") MemberVo vo, Model model) throws Exception {
	  
		Member snsItem = service.snsSelectOne(vo);
		
	    if (snsItem.getId().equals("카카오로그인") || snsItem.getId().equals("네이버로그인")) {
	        System.out.println("sns Login");
	        model.addAttribute("item", snsItem);
	    } else {
	        System.out.println("normal Login");
	        Member item = service.selectOne(vo);
	        model.addAttribute("item", item);
	    }
		
		return "infra/member/user/memberUModForm";
	}
	
	@RequestMapping(value = "memberQuit")
	public String memberQuit() throws Exception {
	    return "infra/member/user/memberQuit";
	}
	
	@RequestMapping(value = "quit")
	public String quit(Member dto, HttpSession httpSession) throws Exception {
	    service.memberUele(dto);
	    httpSession.invalidate();
	    return "redirect:/";
	}
	
	@ResponseBody
	@RequestMapping(value = "load")
	public Map<String, Object> load() throws Exception {
	    Map<String, Object> returnMap = new HashMap<String, Object>();
	    
	    returnMap.put("rt", "success");
	    
	    return returnMap;
	}
	
	@ResponseBody
	@RequestMapping(value = "naverLoginProc")
	public Map<String, Object> naverLoginProc(Member dto, HttpSession httpSession) throws Exception {
	    System.out.println("naverLoginProc");
	    Map<String, Object> returnMap = new HashMap<String, Object>();
	    
	    // id 값 있는지 체크 
	    Member naverLogin = service.snsLoginCheck(dto);
	    
	    System.out.println("id : "+dto.getId());
	    
	    if (naverLogin == null) {
	        System.out.println("여기는 : " + null);
	        service.naver(dto);
	        
	        httpSession.setMaxInactiveInterval(60 * Constants.SESSION_MINUTE); // 60second * 30 = 30minute
	        session(dto, httpSession);
	        returnMap.put("rt", "success");
	    } else {
	        System.out.println("여기는 :  not " + null);
	        
	        httpSession.setMaxInactiveInterval(60 * Constants.SESSION_MINUTE); // 60second * 30 = 30minute
	        session(naverLogin, httpSession);
	        returnMap.put("rt", "success");
	    }
	    return returnMap;
	}
	
	@ResponseBody
	@RequestMapping(value = "kakaoLoginProc")
	public Map<String, Object> kakaoLoginProc(Member dto, HttpSession httpSession) throws Exception {
	    Map<String, Object> returnMap = new HashMap<String, Object>();
	    
		Member kakaoLogin = service.snsLoginCheck(dto);
		
		if (kakaoLogin == null) {
			service.kakao(dto);
			
			httpSession.setMaxInactiveInterval(60 * Constants.SESSION_MINUTE);
			// session(dto.getSeq(), dto.getId(), dto.getName(), dto.getEmail(), dto.getUser_div(), dto.getSnsImg(), dto.getSns_type(), httpSession);
            session(dto, httpSession); 
			returnMap.put("rt", "success");
		} else {
			httpSession.setMaxInactiveInterval(60 * Constants.SESSION_MINUTE);
			
			// session(kakaoLogin.getSeq(), kakaoLogin.getId(), kakaoLogin.getName(), kakaoLogin.getEmail(), kakaoLogin.getUser_div(), kakaoLogin.getSnsImg(), kakaoLogin.getSns_type(), httpSession);
			session(kakaoLogin, httpSession);
			returnMap.put("rt", "success");
		}
		return returnMap;
	}
	
	 public void session(Member dto, HttpSession httpSession) {
	     httpSession.setAttribute("sessSeq", dto.getSeq());    
	     httpSession.setAttribute("sessId", dto.getId());
	     httpSession.setAttribute("sessName", dto.getName());
	     httpSession.setAttribute("sessEmail", dto.getEmail());
	     httpSession.setAttribute("sessUser", dto.getUser_div());
	     httpSession.setAttribute("sessImg", dto.getSnsImg());
	     httpSession.setAttribute("sessSns", dto.getSns_type());
	     System.out.println("test : " + dto.getSns_type());
	 }
	 
	 @ResponseBody
	 @RequestMapping(value = "checkSms")
	 public Map<String, Object> checkSms(Member dto) throws Exception {
		 System.out.println("폰 번호 : " + dto.getPhone());
		 Map<String, Object> returnMap = new HashMap<String, Object>();
		 
		 String rndNo = "";
		 
		 for (int i=0; i<4; i++) {
			 rndNo += (int)(Math.random()*10 -1) + 1;
			 System.out.println("난수 : "+ rndNo);
		 }
		 
	 	DefaultMessageService messageService =  NurigoApp.INSTANCE.initialize("", "", "https://api.solapi.com"); 
		// Message 패키지가 중복될 경우 net.nurigo.sdk.message.model.Message로 치환하여 주세요
		Message message = new Message();
		message.setFrom("01092709756");
		message.setTo(dto.getPhone());
		message.setText("안녕하세요. SPOPIA 인증번호는 ["+ rndNo +"] 입니다. ");
		
		try {
		  // send 메소드로 ArrayList<Message> 객체를 넣어도 동작합니다!
		  messageService.send(message);
		} catch (NurigoMessageNotReceivedException exception) {
		  // 발송에 실패한 메시지 목록을 확인할 수 있습니다!
		  System.out.println(exception.getFailedMessageList());
		  System.out.println(exception.getMessage()); 
		} catch (Exception exception) {
		  System.out.println(exception.getMessage());
		}
		
		returnMap.put("code", rndNo);
		
		return returnMap;
		 
	 }
	 
     /* excel Download s */
	 public void setSearch(MemberVo vo) throws Exception {
        vo.setShDelNy(vo.getShDelNy() == null ? 0 : vo.getShDelNy());
        vo.setShOption(vo.getShOption() == null ? 0 : vo.getShOption());
    }
    
    @RequestMapping("excelDownload")
    public void excelDownload(MemberVo vo, HttpServletResponse httpServletResponse) throws Exception {
        
        setSearch(vo);
        vo.setParamsPaging(service.selectOneCount(vo));

        if (vo.getTotalRows() > 0) {
            List<Member> list = service.selectList(vo);
            
//	          Workbook workbook = new HSSFWorkbook(); // for xls
            Workbook workbook = new XSSFWorkbook();
            Sheet sheet = workbook.createSheet("Sheet1");
            CellStyle cellStyle = workbook.createCellStyle();        
            Row row = null;
            Cell cell = null;
            int rowNum = 0;
            
//	          each column width setting           
            sheet.setColumnWidth(0, 2100);
            sheet.setColumnWidth(1, 3100);

//	          Header
            String[] tableHeader = {"Seq", "등급", "이름", "성별", "아이디", "이메일", "생년월일", "전화번호", "우편번호", "주소", "상세주소", "추가주소", "등록일"};

            row = sheet.createRow(rowNum++);
            
            for(int i=0; i<tableHeader.length; i++) {
                cell = row.createCell(i);
                cellStyle.setAlignment(HorizontalAlignment.CENTER);
                cell.setCellStyle(cellStyle);
                cell.setCellValue(tableHeader[i]);
            }

//	          Body
            for (int i=0; i<list.size(); i++) {
                row = sheet.createRow(rowNum++);
                
//	              String type: null 전달 되어도 ok
//	              int, date type: null 시 오류 발생 하므로 null check
//	              String type 이지만 정수형 데이터가 전체인 seq 의 경우 캐스팅               
                
                cell = row.createCell(0);
                cellStyle.setAlignment(HorizontalAlignment.CENTER);
                cell.setCellStyle(cellStyle);
                cell.setCellValue(Integer.parseInt(list.get(i).getSeq()));

                cell = row.createCell(1);
                cellStyle.setAlignment(HorizontalAlignment.CENTER);
                cell.setCellStyle(cellStyle);
                cell.setCellValue(CodeServiceImpl.selectOneCachedCode(list.get(i).getUser_div()));
                
                cell = row.createCell(2);
                cellStyle.setAlignment(HorizontalAlignment.CENTER);
                cell.setCellStyle(cellStyle);
                cell.setCellValue(list.get(i).getName());

                cell = row.createCell(3);
                cellStyle.setAlignment(HorizontalAlignment.CENTER);
                cell.setCellStyle(cellStyle);
                cell.setCellValue(CodeServiceImpl.selectOneCachedCode(list.get(i).getGender()));

                cell = row.createCell(4);
                cellStyle.setAlignment(HorizontalAlignment.CENTER);
                cell.setCellStyle(cellStyle);
                cell.setCellValue(list.get(i).getId());

                cell = row.createCell(5);
                cellStyle.setAlignment(HorizontalAlignment.CENTER);
                cell.setCellStyle(cellStyle);
                cell.setCellValue(list.get(i).getEmail());

                cell = row.createCell(6);
                cellStyle.setAlignment(HorizontalAlignment.CENTER);
                cell.setCellStyle(cellStyle);
                cell.setCellValue(list.get(i).getDob());

                cell = row.createCell(7);
                cellStyle.setAlignment(HorizontalAlignment.CENTER);
                cell.setCellStyle(cellStyle);
                cell.setCellValue(list.get(i).getPhone());

                cell = row.createCell(8);
                cellStyle.setAlignment(HorizontalAlignment.CENTER);
                cell.setCellStyle(cellStyle);
                cell.setCellValue(list.get(i).getZip());

                cell = row.createCell(9);
                cellStyle.setAlignment(HorizontalAlignment.CENTER);
                cell.setCellStyle(cellStyle);
                cell.setCellValue(list.get(i).getAddress());

                cell = row.createCell(10);
                cellStyle.setAlignment(HorizontalAlignment.CENTER);
                cell.setCellStyle(cellStyle);
                cell.setCellValue(list.get(i).getAddress_detail());

                cell = row.createCell(11);
                cellStyle.setAlignment(HorizontalAlignment.CENTER);
                cell.setCellStyle(cellStyle);
                cell.setCellValue(list.get(i).getExtraAddress());

                cell = row.createCell(12);
                cellStyle.setAlignment(HorizontalAlignment.CENTER);
                cell.setCellStyle(cellStyle);
                cell.setCellValue(list.get(i).getCreatedAt());
            }

            httpServletResponse.setContentType("ms-vnd/excel");
//	          httpServletResponse.setHeader("Content-Disposition", "attachment;filename=example.xls");    // for xls
            httpServletResponse.setHeader("Content-Disposition", "attachment;filename=member.xlsx");

            workbook.write(httpServletResponse.getOutputStream());
            workbook.close();
        }
    }
	 /* excel Download e */
}
