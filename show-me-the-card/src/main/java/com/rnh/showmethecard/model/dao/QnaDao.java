package com.rnh.showmethecard.model.dao;

import java.util.HashMap;
import java.util.List;

import com.rnh.showmethecard.model.dto.Member;
import com.rnh.showmethecard.model.dto.Qna;

public interface QnaDao {

	
	List<Qna> SelectQnaList(int startRow, int lastRow);
	
	int SelectQnaCount();
	
	void InsertQna(Qna qna);
	
	void DeleteQna(Qna qna);
	
	void UpdateQna(Qna qna);
	
	Qna SelectQnaDetail(int qNo);
	
	Qna SelectQnaByQnaNo(int qNo);

	void InsertReply(Qna qna);
	
	void UpdateQnaGroupNo(int qNo);
}
