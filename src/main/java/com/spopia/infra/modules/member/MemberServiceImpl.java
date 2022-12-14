package com.spopia.infra.modules.member;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.spopia.infra.common.constants.Constants;
import com.spopia.infra.common.util.UtilDateTime;
import com.spopia.infra.common.util.UtilRegMod;
import com.spopia.infra.common.util.UtilSecurity;
import com.spopia.infra.modules.article.Article;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	MemberDao dao;

	/* member 관련 */
	@Override
	public List<Member> selectList1() throws Exception {
		return dao.selectList1();
	}

	@Override
	public int selectOneCount(MemberVo vo) throws Exception {
		return dao.selectOneCount(vo);
	}

	@Override
	public List<Member> selectList(MemberVo vo) throws Exception {
		return dao.selectList(vo);
	}

	@Override
	public List<Member> selectList() throws Exception {
		return dao.selectList();
	}
	
	@Override
	public Member selectOne(MemberVo vo) throws Exception {
		return dao.selectOne(vo);
	}

	@Override
	public Member profileOne(MemberVo vo) throws Exception {
		return dao.profileOne(vo);
	}

	@Override
	public Member snsSelectOne(MemberVo vo) throws Exception {
	    return dao.snsSelectOne(vo);
	}

	@Override
	public int userUpdt(Member dto) throws Exception {
		return dao.userUpdt(dto);
	}
	
	@Override
	public int userXUpdt(Member dto) throws Exception {
	    return dao.userXUpdt(dto);
	}
	
	@Override
	public int userInst(Member dto) throws Exception {
		try {
			dto.setPwd(UtilSecurity.encryptSha256(dto.getPwd()));
			dao.userInst(dto);
			uploadFiles(dto.getProfileImage(), dto, "userUploaded", 0);
			return 1;
		} catch (Exception e) {
			throw new Exception();
		}
	}
	
	@Override
    public int memberUele(Member dto) throws Exception {
        return dao.memberUele(dto);
    }

    /* team 관련 */
	@Override
	public int teamInst(Member dto) throws Exception {
		return dao.teamInst(dto);
	}
	
	@Override
	public int teamUpdt(Member dto) throws Exception {
		return dao.teamUpdt(dto);
	}

	public void update(Member dto) throws Exception {
		userUpdt(dto);
		teamUpdt(dto);
	}
	
	public void insert(Member dto) throws Exception {
		userInst(dto);
		teamInst(dto);
	}

	/* id 중복관련 */
	@Override
	public int idCheck(Member dto) throws Exception {
		int cnt = dao.idCheck(dto);
		return cnt;
	}

//	login 관련 
	@Override
	public Member loginCheck(Member dto) throws Exception {
		return dao.loginCheck(dto);
	}

	@Override
	public Member snsLoginCheck(Member dto) throws Exception {
	    return dao.snsLoginCheck(dto);
	}

	@Override
	public Member xdminLoginCheck(Member dto) throws Exception {
		return dao.xdminLoginCheck(dto);
	}

    //find id & pwd
    @Override
    public Member findId(Member dto) throws Exception {
        
        Member id = dao.findId(dto);
        System.out.println("id : " + id.getId());
        
        String myId = id.getId().substring(0, id.getId().length()-3);
        int starLength = id.getId().length()- myId.length();
        
        for (int i=0; i<starLength; i++) {
            myId += "*";
        }
        
        dto.setId(myId);
        
        return dto;
    }

    @Override
    public int findPwd(Member dto) throws Exception {
        return dao.findPwd(dto);
    }

    @Override
    public int changePwd(Member dto) throws Exception {
        dto.setPwd(UtilSecurity.encryptSha256(dto.getPwd()));
        return dao.changePwd(dto);
    }
    
    // naver insert
    @Override
    public int naverInst(Member dto) throws Exception {
		return dao.naverInst(dto);
    }
    
    // kakao insert
    @Override
    public int kakaoInst(Member dto) throws Exception {
		return dao.kakaoInst(dto);
    }
    
    public void kakao(Member dto) throws Exception {
        kakaoInst(dto);
        teamInst(dto);
    }

    public void naver(Member dto) throws Exception {
        naverInst(dto);
        teamInst(dto);
    }

//    image Upload
	@Override
	public void uploadFiles(MultipartFile[] multipartFiles, Member dto, String tableName, int type) throws Exception {
    	for(int j=0; j < multipartFiles.length; j++) {
              
              if(!multipartFiles[j].isEmpty()) {
              
                  String className = dto.getClass().getSimpleName().toString().toLowerCase();   
                  System.out.println("className : "+ className);
                  String fileName = multipartFiles[j].getOriginalFilename();
                  System.out.println("className : "+ fileName);
                  String ext = fileName.substring(fileName.lastIndexOf(".") + 1);
                  System.out.println("className : "+ ext);
                  String uuid = UUID.randomUUID().toString();
                  String uuidFileName = uuid + "." + ext;
                  String pathModule = className;
                  String nowString = UtilDateTime.nowString();
                  String pathDate = nowString.substring(0,4) + "/" + nowString.substring(5,7) + "/" + nowString.substring(8,10); 
                  // String path = Constants.UPLOAD_PATH_PREFIX + "/" + pathModule + "/" + pathDate + "/";
                  //String path = Constants.UPLOAD_PATH_PREFIX_LINUX + "/" + pathModule + "/" + pathDate + "/";
                  String path = Constants.UPLOAD_PATH_PREFIX_MAC + "/" + pathModule + "/" + pathDate + "/";
                  String pathForView = Constants.UPLOAD_PATH_PREFIX_FOR_VIEW + "/" + pathModule + "/" + pathDate + "/";
                  
                  System.out.println("path: " + path);
                  
                  File uploadPath = new File(path);
                  
                  System.out.println("uploadPath: " + uploadPath);
                  
                  if (!uploadPath.exists()) {
                      uploadPath.mkdir();
                  } else {
                      // by pass
                  }
                    
                  multipartFiles[j].transferTo(new File(path + uuidFileName));
                  
                  dto.setPath(pathForView);
                  dto.setOriginalName(fileName);
                  dto.setUuidName(uuidFileName);
                  dto.setExt(ext);
                  dto.setSize(multipartFiles[j].getSize());
                  
                  dto.setTableName(tableName);
                  dto.setType(type);
                  dto.setDefaultNy(j == 0 ? 1 : 0);
                  dto.setSort(j + 1);
                  dto.setPseq(dto.getSeq());
    
                  dao.insertUploaded(dto);
                  j++;
              }
    	}                  
	}


		@Override
		public void deleteFiles(String[] deleteSeq, String[] deletePathFile, Member dto, String tableName) throws Exception {
			for (int i=0; i<deleteSeq.length; i++) {
    	        File file = new File(Constants.UPLOAD_PATH_PREFIX_EXTERNAL + deletePathFile[i]);
    	        boolean result = file.delete();
    	        
    	        if(result) {
    	            dto.setSeq(deleteSeq[i]);
    	            dto.setTableName(tableName);
    	            dao.deleteUploaded(dto);
    	        }
			}
		}

		@Override
		public void ueleteFiles(String[] deleteSeq, String[] deletePathFile, Member dto, String tableName) throws Exception {
			for (int i=0; i<deleteSeq.length; i++) {
    	//      File file = new File(Constants.UPLOAD_PATH_PREFIX_EXTERNAL + deletePathFile[i]);
    	//      boolean result = file.delete();
    	        
    	//      if(result) {
    	            dto.setSeq(deleteSeq[i]);
    	            dto.setTableName(tableName);
    	            dao.ueleteUploaded(dto);
    	//      }
			}
		}
		
		public void setRegMod(Article dto) throws Exception {
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
