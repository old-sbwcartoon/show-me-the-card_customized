package com.rnh.showmethecard.model.dao;

import java.util.HashMap;
import java.util.List;

import com.rnh.showmethecard.model.dto.Member;
import com.rnh.showmethecard.model.dto.Notice;

public interface NoticeDao {

	
	List<Notice> SelectNoticeList(int startRow, int lastRow);
	
	int SelectNoticeCount();
	
	void InsertNotice(Notice notice);
	
	void DeleteNotice(Notice notice);
	
	void UpdateNotice(Notice notice);
	
	Notice SelectNoticeDetail(int nNo);
	



}
