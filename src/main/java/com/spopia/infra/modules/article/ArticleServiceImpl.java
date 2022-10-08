package com.spopia.infra.modules.article;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.spopia.infra.common.base.BaseServiceImpl;
import com.spopia.infra.common.util.UtilDateTime;
import com.spopia.infra.common.util.UtilRegMod;
import com.spopia.infra.common.util.UtilUpload;
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
	public int insert(Article dto) throws Exception {
		try {
    	
	    	setRegMod(dto);
	    	
	    	dao.insert(dto);
	    	
	    	int j = 0;
	    	for(MultipartFile multipartFile : dto.getArticleImage() ) {
	    			
	    		if(!multipartFile.isEmpty()) {
	    		
	    			String pathModule = this.getClass().getSimpleName().toString().toLowerCase().replace("serviceimpl", "");		
	    			UtilUpload.upload(multipartFile, pathModule, dto);
	    			
		    		dto.setTableName("articleUploaded");
		    		dto.setType(2);
		    		dto.setDefaultNy(j == 0 ? 1 : 0);
		    		dto.setSort(j + 1);
		    		dto.setPseq(dto.getaSeq());
	
					dao.insertUploaded(dto);
					j++;
	    		}
	    	}
	
			return 1;
	
	    } catch (Exception e) {
	        throw new Exception();
    }
	}

	@Override
	public int update(Article dto) throws Exception {
		return dao.update(dto);
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
