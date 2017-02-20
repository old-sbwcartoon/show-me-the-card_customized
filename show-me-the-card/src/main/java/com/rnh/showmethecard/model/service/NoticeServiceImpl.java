package com.rnh.showmethecard.model.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.rnh.showmethecard.model.dao.NoticeDao;
import com.rnh.showmethecard.model.dto.Member;
import com.rnh.showmethecard.model.dto.Notice;

@Service("noticeService")
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	@Qualifier("noticeDao")
	private NoticeDao noticeDao;

	@Override
	public List<Notice> SearchNoticeList(int startRow, int lastRow) {
		List<Notice> notice = noticeDao.SelectNoticeList(startRow, lastRow);
		
		
		return notice;
	}
	
	@Override
	public int SelectNoticeCount() {
		
		return noticeDao.SelectNoticeCount();
	}

	@Override
	public void AddNotice(Notice notice) {
		
		noticeDao.InsertNotice(notice);
		
	}

	@Override
	public void DeleteNotice(Notice notice) {
		
		noticeDao.DeleteNotice(notice);
		
	}

	@Override
	public void ChangeNotice(Notice notice) {
		
		noticeDao.UpdateNotice(notice);
		
	}

	@Override
	public Notice SearchNoticeDetail(int nNo) {
		Notice notice = noticeDao.SelectNoticeDetail(nNo);
		
		return notice;
	}
	

	
	

}
