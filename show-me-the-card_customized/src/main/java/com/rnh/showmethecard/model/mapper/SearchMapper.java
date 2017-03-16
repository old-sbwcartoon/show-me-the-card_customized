package com.rnh.showmethecard.model.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;

import com.rnh.showmethecard.model.dto.Member;
import com.rnh.showmethecard.model.dto.Card;
import com.rnh.showmethecard.model.dto.Folder;

public interface SearchMapper {
	
	//List<Member> memberSearch(RowBounds bounds, String fName);
	
	List<Member> memberSearch(String fName);
	
	int memberSearchCount();
	
	List<Card> cardSearch(String cName);
	
	int cardSearchCount();
	
}
