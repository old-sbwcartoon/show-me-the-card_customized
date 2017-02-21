package com.rnh.showmethecard.model.dao;

import java.util.HashMap;
import java.util.List;

import com.rnh.showmethecard.model.dto.Member;
import com.rnh.showmethecard.model.dto.Card;
import com.rnh.showmethecard.model.dto.Folder;

public interface SearchDao {
	
	List<Member> memberSearch(int startRow, int lastRow);
	
	int memberSearchCount();

	
}
