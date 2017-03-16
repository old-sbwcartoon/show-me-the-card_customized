package com.rnh.showmethecard.model.service;

import java.util.List;

import com.rnh.showmethecard.model.dto.Card;
import com.rnh.showmethecard.model.dto.Member;

public interface SearchService {
	
	//List<Member> memberSearch(int startRow, int lastRow, String fName);
	List<Member> memberSearch(String fName);
	
	List<Card> cardSearch(String cName);
}
