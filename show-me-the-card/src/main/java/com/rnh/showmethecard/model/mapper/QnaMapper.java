package com.rnh.showmethecard.model.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;

import com.rnh.showmethecard.model.dto.Member;
import com.rnh.showmethecard.model.dto.Qna;

public interface QnaMapper {
	
	
	List<Qna>SelectQnaList(RowBounds bounds);
	
	int SelectQnaCount();
	
	void InsertQna(Qna qna);
	
	void DeleteQna(Qna qna);
	
	void UpdateQna(Qna qna);	
	
	Qna SelectQnaDetail(int qNo);
	
	Qna SelectQnaByQnaNo(int qNo);
	
	void InsertReply(Qna qna);
	
	void UpdateQnaGroupNo(int qNo);
	
}
