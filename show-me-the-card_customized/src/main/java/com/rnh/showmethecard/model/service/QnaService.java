package com.rnh.showmethecard.model.service;

import java.util.List;

import com.rnh.showmethecard.model.dto.Member;
import com.rnh.showmethecard.model.dto.Qna;

public interface QnaService {
	
	List<Qna> SearchQnaList(int startRow, int lastRow);
	
	int SelectQnaCount();
	
	void AddQna(Qna qna);
	
	void DeleteQna(Qna qna);
	
	void ChangeQna(Qna qna);
	
	Qna SearchQnaDetail(int qNo);
	
	Qna SelectQnaByQnaNo(int qNo);
	
	void InsertReply(Qna qna);
	
	void UpdateQnaGroupNo(int qNo);
	
	void UpdateQnaStep(int qNo);
}
