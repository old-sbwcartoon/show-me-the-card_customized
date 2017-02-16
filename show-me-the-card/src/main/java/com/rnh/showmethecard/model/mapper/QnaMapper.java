package com.rnh.showmethecard.model.mapper;

import java.util.HashMap;
import java.util.List;

import com.rnh.showmethecard.model.dto.Member;
import com.rnh.showmethecard.model.dto.Qna;

public interface QnaMapper {
	
	
	List<Qna>SelectQnaList();
	
	void InsertQna(Qna qna);
	
	void DeleteQna(Qna qna);
	
	void UpdateQna(Qna qna);	
	
	Qna SelectQnaDetail(int qNo);
	
	
}
