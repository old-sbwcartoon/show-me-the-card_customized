package com.rnh.showmethecard.model.dao;

import java.util.HashMap;
import java.util.List;

import com.rnh.showmethecard.model.dto.Member;
import com.rnh.showmethecard.model.dto.Card;
import com.rnh.showmethecard.model.dto.Folder;

public interface SearchDao {
	
	//List<Member> memberSearch(int startRow, int lastRow, String fName);
	
	List<Member> memberSearch(String fName);
	
	int memberSearchCount();
	
	List<Card> cardSearch(String cName);
	
	int cardSearchCount();

	
}
