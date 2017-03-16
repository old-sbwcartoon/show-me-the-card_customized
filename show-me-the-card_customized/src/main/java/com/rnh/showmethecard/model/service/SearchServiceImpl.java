package com.rnh.showmethecard.model.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.rnh.showmethecard.model.dao.SearchDao;
import com.rnh.showmethecard.model.dto.Card;
import com.rnh.showmethecard.model.dto.Member;

@Service("searchService")
public class SearchServiceImpl implements SearchService {
	
	@Autowired
	@Qualifier("searchDao")
	private SearchDao searchDao;
	
	/*@Override
	public List<Member> memberSearch(int startRow, int lastRow, String fName) {
		
		List<Member> members = searchDao.memberSearch(startRow, lastRow, fName);
		//System.out.println(members);
		
		return members;
	}*/

	@Override
	public List<Member> memberSearch(String fName) {
		
		List<Member> members = searchDao.memberSearch(fName);
		//System.out.println(members);
		
		return members;
	}
	
	@Override
	public List<Card> cardSearch(String cName) {
		List<Card> cards = searchDao.cardSearch(cName);
		//System.out.println(members);
		
		return cards;
	}
	

}
