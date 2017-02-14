package com.rnh.showmethecard.model.service;

import java.util.List;

import com.rnh.showmethecard.model.dto.Member;
import com.rnh.showmethecard.model.dto.Notice;

public interface NoticeService {
	
	List<Notice> SearchNoticeList();
	
	void AddNotice(Notice notice);
	
	void DeleteNotice(Notice notice);
	
	void ChangeNotice(Notice notice);
	
	Notice SearchNoticeDetail(int noticeNo);
	
	
}
