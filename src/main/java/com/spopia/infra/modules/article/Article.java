package com.spopia.infra.modules.article;

import org.springframework.web.multipart.MultipartFile;

import com.spopia.infra.common.base.Base;

public class Article extends Base{

	private String aSeq;
	private String title;
	private String content;
	private String newspaper;
	private Integer aAbroadNy;
	private Integer aEvent;
	private Integer aLeague;
	private String reporter;
	private String aCreatedAt;
	private Integer aCreatedBy;
	private String aModifiedAt;
	private Integer modifiedBy;
	private Integer aDelNy;
	private String email;
	
	// comment
	private String id;
	private String comment;
	private String createdAt;
	private String createdBy;
	
	public void setCreatedBy(String createdBy) {
        this.createdBy = createdBy;
    }
    public String getCreatedAt() {
        return createdAt;
    }
    public void setCreatedAt(String createdAt) {
        this.createdAt = createdAt;
    }
    public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	
	// imageUpload
	private MultipartFile[] articleImage;
	private Integer[] process;
	private String[] pathFile;
	private String[] fileSeq;
	
	public MultipartFile[] getArticleImage() {
		return articleImage;
	}
	public void setArticleImage(MultipartFile[] articleImage) {
		this.articleImage = articleImage;
	}
	public Integer[] getProcess() {
        return process;
    }
    public void setProcess(Integer[] process) {
        this.process = process;
    }
    public String[] getPathFile() {
        return pathFile;
    }
    public void setPathFile(String[] pathFile) {
        this.pathFile = pathFile;
    }
    public String[] getFileSeq() {
        return fileSeq;
    }
    public void setFileSeq(String[] fileSeq) {
        this.fileSeq = fileSeq;
    }

    
    private String teamSeq;
	private Integer abroadNy;
	private Integer event;
	private Integer league;
	
	public String getTeamSeq() {
        return teamSeq;
    }
    public void setTeamSeq(String teamSeq) {
        this.teamSeq = teamSeq;
    }
    public Integer getAbroadNy() {
        return abroadNy;
    }
    public void setAbroadNy(Integer abroadNy) {
        this.abroadNy = abroadNy;
    }
    public Integer getEvent() {
        return event;
    }
    public void setEvent(Integer event) {
        this.event = event;
    }
    public Integer getLeague() {
        return league;
    }
    public void setLeague(Integer league) {
        this.league = league;
    }
    
    
    public String getaSeq() {
		return aSeq;
	}
	public void setaSeq(String aSeq) {
		this.aSeq = aSeq;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getNewspaper() {
		return newspaper;
	}
	public void setNewspaper(String newspaper) {
		this.newspaper = newspaper;
	}
	public Integer getaAbroadNy() {
		return aAbroadNy;
	}
	public void setaAbroadNy(Integer aAbroadNy) {
		this.aAbroadNy = aAbroadNy;
	}
	public Integer getaEvent() {
		return aEvent;
	}
	public void setaEvent(Integer aEvent) {
		this.aEvent = aEvent;
	}
	public Integer getaLeague() {
		return aLeague;
	}
	public void setaLeague(Integer aLeague) {
		this.aLeague = aLeague;
	}
	public String getReporter() {
		return reporter;
	}
	public void setReporter(String reporter) {
		this.reporter = reporter;
	}
	public String getaCreatedAt() {
		return aCreatedAt;
	}
	public void setaCreatedAt(String aCreatedAt) {
		this.aCreatedAt = aCreatedAt;
	}
	public Integer getCreatedBy() {
		return aCreatedBy;
	}
	public void setCreatedBy(Integer aCreatedBy) {
		this.aCreatedBy = aCreatedBy;
	}
	public String getaModifiedAt() {
		return aModifiedAt;
	}
	public void setaModifiedAt(String aModifiedAt) {
		this.aModifiedAt = aModifiedAt;
	}
	public Integer getModifiedBy() {
		return modifiedBy;
	}
	public void setModifiedBy(Integer modifiedBy) {
		this.modifiedBy = modifiedBy;
	}
	public Integer getaDelNy() {
		return aDelNy;
	}
	public void setaDelNy(Integer aDelNy) {
		this.aDelNy = aDelNy;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
}
