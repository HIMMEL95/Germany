package com.spopia.infra.modules.article;

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
import com.spopia.infra.common.base.BaseServiceImpl;
import com.spopia.infra.common.util.UtilDateTime;
import com.spopia.infra.common.util.UtilRegMod;
import com.spopia.infra.modules.comment.Comment;
import com.spopia.infra.modules.comment.CommentVo;

@Service
public class ArticleServiceImpl extends BaseServiceImpl implements ArticleService{

	@Autowired
	ArticleDao dao;

	@Override
	public List<Article> selectList(ArticleVo vo) throws Exception {
		return dao.selectList(vo);
	}

	@Override
	public List<Article> selectList() throws Exception {
		return dao.selectList();
	}

	@Override
	public List<Article> selectList1() throws Exception {
		return dao.selectList1();
	}
	
	@Override
    public void uploadFiles(MultipartFile[] multipartFiles, Article dto, String tableName, int type) throws Exception {
        
        int j = 0;
        for(MultipartFile multipartFile : multipartFiles) {
                
            if(!multipartFile.isEmpty()) {
            
                String className = dto.getClass().getSimpleName().toString().toLowerCase();     
                String fileName = multipartFile.getOriginalFilename();
                String ext = fileName.substring(fileName.lastIndexOf(".") + 1);
                String uuid = UUID.randomUUID().toString();
                String uuidFileName = uuid + "." + ext;
                String pathModule = className;
                String nowString = UtilDateTime.nowString();
                String pathDate = nowString.substring(0,4) + "/" + nowString.substring(5,7) + "/" + nowString.substring(8,10); 
                String path = Constants.UPLOAD_PATH_PREFIX + "/" + pathModule + "/" + pathDate + "/";
                /*
                 String path = Constants.UPLOAD_PATH_PREFIX_LINUX + "/" + pathModule + "/" +
                 pathDate + "/";
                 String path = Constants.UPLOAD_PATH_PREFIX_MAC + "/" + pathModule + "/" +
                 pathDate + "/";
                 */
                String pathForView = Constants.UPLOAD_PATH_PREFIX_FOR_VIEW + "/" + pathModule + "/" + pathDate + "/";
                
                System.out.println("path: " + path);
                
                File uploadPath = new File(path);
                
                if (!uploadPath.exists()) {
                    uploadPath.mkdir();
                } else {
                    // by pass
                }
                  
                multipartFile.transferTo(new File(path + uuidFileName));
                
                dto.setPath(pathForView);
                dto.setOriginalName(fileName);
                dto.setUuidName(uuidFileName);
                dto.setExt(ext);
                dto.setSize(multipartFile.getSize());
                
                dto.setTableName(tableName);
                dto.setType(type);
                dto.setDefaultNy(j == 0 ? 1 : 0);
                dto.setSort(j + 1);
                dto.setPseq(dto.getaSeq());

                dao.insertUploaded(dto);
                j++;
            }
        }
    }
	
	@Override
	public int insert(Article dto) throws Exception {
		try {
    	
	    	setRegMod(dto);
	    	
	    	String str = dto.getContent().replace("\n", "<br>");
	    	dto.setContent(str);
	    	
	    	dao.insert(dto);
	    	
	    	uploadFiles(dto.getArticleImage(), dto, "articleUploaded", 2);
	
			return 1;
	
	    } catch (Exception e) {
	        throw new Exception();
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
	
	@Override
    public void deleteFiles(String[] deleteSeq, String[] deletePathFile, Article dto, String tableName) throws Exception{
        
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
    public void ueleteFiles(String[] deleteSeq, String[] deletePathFile, Article dto, String tableName) throws Exception{
        
        for (int i=0; i<deleteSeq.length; i++) {
//          File file = new File(Constants.UPLOAD_PATH_PREFIX_EXTERNAL + deletePathFile[i]);
//          boolean result = file.delete();
            
//          if(result) {
                dto.setSeq(deleteSeq[i]);
                dto.setTableName(tableName);
                dao.ueleteUploaded(dto);
//          }
        }
    }

	@Override
	public int update(Article dto) throws Exception {
	    setRegMod(dto);
	    dao.update(dto);
        /*
         * deleteFiles(dto.getUploadImgDeleteSeq(), dto.getUploadImgDeletePathFile(),
         * dto, "infrMemberUploaded");
         */
	    uploadFiles(dto.getArticleImage(), dto, "articleUploaded", 2);
        return 1;
	}

	@Override
    public int uelete(Article dto) throws Exception {
        return dao.uelete(dto);
    }

    @Override
    public int delete(ArticleVo vo) throws Exception {
        return dao.delete(vo);
    }
	
	@Override
	public Article selectOne(ArticleVo vo) throws Exception {
		return dao.selectOne(vo);
	}
	
	@Override
	public int selectOneCount(ArticleVo vo) throws Exception {
		return dao.selectOneCount(vo);
	}

	/* mainlist */
	@Override
	public List<Article> mainList(ArticleVo vo) throws Exception {
		return dao.mainList(vo);
	}

	/* article comment */
	@Override
	public List<Comment> articleComment(CommentVo vo) throws Exception {
		return dao.articleComment(vo);
	}

	@Override
	public int articleCommentCount(CommentVo vo) throws Exception {
		return dao.articleCommentCount(vo);
	}

    /* article select */
	@Override
	public List<Article> abroad(Article dto) throws Exception {
	    return dao.abroad(dto);
	}
	
	@Override
	public List<Article> event(Article dto) throws Exception {
	    return dao.event(dto);
	}
	
	@Override
	public List<Article> league(Article dto) throws Exception {
	    return dao.league(dto);
	}
	
}
