package com.rnh.showmethecard.model.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.rnh.showmethecard.model.dto.Member;
import com.rnh.showmethecard.model.dto.Notice;
import com.rnh.showmethecard.model.mapper.NoticeMapper;

@Repository(value = "noticeDao")
public class MysqlNoticeDao implements NoticeDao{
	
	@Autowired
	@Qualifier("noticeMapper")
	private NoticeMapper noticeMapper;


	@Override
	public List<Notice> SelectNoticeList(int startRow, int lastRow) {
		
		RowBounds bounds = new RowBounds(startRow - 1, lastRow - startRow);
		
		List<Notice>notices = (List<Notice>)noticeMapper.SelectNoticeList(bounds);

		return notices;
	}
	
	@Override
	public int SelectNoticeCount() {
		return noticeMapper.SelectNoticeCount();
	}

	@Override
	public void InsertNotice(Notice notice) {

		noticeMapper.InsertNotice(notice);
	}

	@Override
	public void DeleteNotice(Notice notice) {

		noticeMapper.DeleteNotice(notice);
		
	}

	@Override
	public void UpdateNotice(Notice notice) {

		noticeMapper.UpdateNotice(notice);
	}

	@Override
	public Notice SelectNoticeDetail(int nNo) {
		
		Notice notice = noticeMapper.SelectNoticeDetail(nNo);
		
		return notice;
	}
	

	
}
