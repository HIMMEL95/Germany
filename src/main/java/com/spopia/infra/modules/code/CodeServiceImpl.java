package com.spopia.infra.modules.code;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.spopia.infra.common.util.UtilUpload;
import com.spopia.infra.common.util.UtilDateTime;
import com.spopia.infra.common.util.UtilRegMod;

@Service
public class CodeServiceImpl implements CodeService{

	@Autowired
	CodeDao dao;

	@Override
	public List<Code> selectList(CodeVo vo) throws Exception {
		return dao.selectList(vo);
	}
	
	@Override
	public List<Code> selectList() throws Exception {
		return dao.selectList();
	}

	@Override
	public int insert(Code dto) throws Exception {
	    
	    try {
	        
	        setRegMod(dto);
	        
	        dao.insert(dto);
	        
	        int j = 0;
            for(MultipartFile multipartFile : dto.getIfmmUploadedImage() ) {
                    
                if(!multipartFile.isEmpty()) {
                
                    String pathModule = this.getClass().getSimpleName().toString().toLowerCase().replace("serviceimpl", "");        
                    UtilUpload.upload(multipartFile, pathModule, dto);
                    
                    dto.setTableName("infrMemberUploaded");
                    dto.setType(2);
                    dto.setDefaultNy(j == 0 ? 1 : 0);
                    dto.setSort(j + 1);
                    dto.setPseq(dto.getCcSeq());
    
                    dao.insertUploaded(dto);
                    j++;
                }
            }

            j = 0;
            for(MultipartFile multipartFile : dto.getIfmmUploadedFile() ) {
                
                if(!multipartFile.isEmpty()) {              
                
                    String pathModule = this.getClass().getSimpleName().toString().toLowerCase().replace("serviceimpl", "");        
                    UtilUpload.upload(multipartFile, pathModule, dto);
                    
                    dto.setTableName("infrMemberUploaded");
                    dto.setType(3);
                    dto.setDefaultNy(j == 0 ? 1 : 0);
                    dto.setSort(j + 1);
                    dto.setPseq(dto.getCcSeq());
                    
                    dao.insertUploaded(dto);
                    j++;
                }
            }
	        
            
        } catch (Exception e) {
            throw new Exception();
        }
		return dao.insert(dto);
	}

	@Override
	public Code selectOne(CodeVo vo) throws Exception {
		return dao.selectOne(vo);
	}

	@Override
	public int update(Code dto) throws Exception {
		return dao.update(dto);
	}

	@Override
	public int uelete(Code dto) throws Exception {
		return dao.uelete(dto);
	}

	@Override
	public int delete(CodeVo vo) throws Exception {
		return dao.delete(vo);
	}

	@Override
	public int selectOneCount(CodeVo vo) throws Exception {
		return dao.selectOneCount(vo);
	}
	
	@PostConstruct
	public void selectListCachedCodeArrayList() throws Exception {
		List<Code> codeListFromDb = (ArrayList<Code>) dao.selectListCachedCodeArrayList();
//		codeListFromDb = (ArrayList<Code>) dao.selectListCachedCodeArrayList();
		Code.cachedCodeArrayList.clear(); 
		Code.cachedCodeArrayList.addAll(codeListFromDb);
		System.out.println("cachedCodeArrayList: " + Code.cachedCodeArrayList.size() + " chached !");
	}
	
	public static List<Code> selectListCachedCode(String ccgSeq) throws Exception {
		List<Code> rt = new ArrayList<Code>();
		for (Code codeRow : Code.cachedCodeArrayList) {
			if (codeRow.getCcgSeq().equals(ccgSeq)) {
				rt.add(codeRow);
			} else {
				// by pass
			}
		}
		return rt;
	}
	
	public static String selectOneCachedCode(int code) throws Exception {
		String rt = "";
		for(Code codeRow : Code.cachedCodeArrayList) {
			if (codeRow.getCcSeq().equals(Integer.toString(code))) {
				rt = codeRow.getIfccName();
			} else {
				// by pass
			}
		}
		return rt;
	}
	
	/*
	 * public static void clear() throws Exception {
	 * Code.cachedCodeArrayList.clear(); }
	 */
	 
	public void setRegMod(Code dto) throws Exception {
        HttpServletRequest httpServletRequest = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
        
        dto.setRegIp(UtilRegMod.getClientIp(httpServletRequest));
        dto.setRegSeq(UtilRegMod.getSessionSeq(httpServletRequest));
        dto.setRegDeviceCd(UtilRegMod.getDevice());
        dto.setRegDateTime(UtilDateTime.nowDate());
        
        dto.setModIp(UtilRegMod.getClientIp(httpServletRequest));
        dto.setModSeq(UtilRegMod.getSessionSeq(httpServletRequest));
        dto.setModDeviceCd(UtilRegMod.getDevice());
        dto.setModDateTime(UtilDateTime.nowDate());
    }
}