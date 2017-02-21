package com.rnh.showmethecard.model.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.rnh.showmethecard.model.dto.Member;
import com.rnh.showmethecard.model.dto.Card;
import com.rnh.showmethecard.model.dto.Folder;
import com.rnh.showmethecard.model.mapper.CardMapper;
import com.rnh.showmethecard.model.mapper.FolderMapper;
import com.rnh.showmethecard.model.mapper.MemberMapper;
import com.rnh.showmethecard.model.mapper.SearchMapper;

@Repository(value = "searchDao")
public class MysqlSearchDao implements SearchDao{
	
	@Autowired
	@Qualifier("searchMapper")
	private SearchMapper searchMapper;	

	@Autowired
	@Qualifier("memberMapper")
	private MemberMapper memberMapper;	

	@Autowired
	@Qualifier("cardMapper")
	private CardMapper cardMapper;
	
	@Autowired
	@Qualifier("folderMapper")
	private FolderMapper folderMapper;	
	
	@Override
	public List<Member> memberSearch(int startRow, int lastRow) {
		
		RowBounds bounds = new RowBounds(startRow - 1, lastRow - startRow);	
		
		List<Member> members = searchMapper.memberSearch(bounds);
		
		return members;
	}
	
	@Override
	public int memberSearchCount() {
		
		int count = searchMapper.memberSearchCount();
		
		return 0;
	}
	
}
