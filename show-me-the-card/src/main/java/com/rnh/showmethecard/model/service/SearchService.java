package com.rnh.showmethecard.model.service;

import java.util.List;

import com.rnh.showmethecard.model.dto.Member;

public interface SearchService {
	
	List<Member> memberSearch(int startRow, int lastRow);
}
