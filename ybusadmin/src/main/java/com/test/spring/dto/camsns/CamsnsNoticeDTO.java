package com.test.spring.dto.camsns;

import java.sql.Date;
import java.util.List;

import com.test.spring.dto.NoticeFileDTO;

public class CamsnsNoticeDTO {
	private String notice_seq;
	private String title;
	private String content;
	private String universitySeq;
	private Date writeDt;
	
	
	public String getNotice_seq() {
        return notice_seq;
    }

    public void setNotice_seq(String notice_seq) {
        this.notice_seq = notice_seq;
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

    public String getUniversitySeq() {
        return universitySeq;
    }

    public void setUniversitySeq(String universitySeq) {
        this.universitySeq = universitySeq;
    }

    public Date getWriteDt() {
        return writeDt;
    }

    public void setWriteDt(Date writeDt) {
        this.writeDt = writeDt;
    }

    private List<NoticeFileDTO> filelist;
	

	public List<NoticeFileDTO> getFilelist() {
		return filelist;
	}

	public void setFilelist(List<NoticeFileDTO> filelist) {
		this.filelist = filelist;
	}

	
}
