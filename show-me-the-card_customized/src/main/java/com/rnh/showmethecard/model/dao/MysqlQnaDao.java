package com.rnh.showmethecard.model.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.rnh.showmethecard.model.dto.Member;
import com.rnh.showmethecard.model.dto.Qna;
import com.rnh.showmethecard.model.mapper.QnaMapper;

@Repository(value = "qnaDao")
public class MysqlQnaDao implements QnaDao{
	
	@Autowired
	@Qualifier("qnaMapper")
	private QnaMapper qnaMapper;


	@Override
	public List<Qna> SelectQnaList(int startRow, int lastRow) {
		
		RowBounds bounds = new RowBounds(startRow - 1, lastRow - startRow);
		
		List<Qna>Qnas = (List<Qna>)qnaMapper.SelectQnaList(bounds);

		return Qnas;
	}
	
	@Override
	public int SelectQnaCount() {
		return qnaMapper.SelectQnaCount();
	}

	@Override
	public void InsertQna(Qna qna) {

		qnaMapper.InsertQna(qna);
	}
	
	@Override
	public void InsertReply(Qna qna) {

		qnaMapper.InsertReply(qna);
	}

	@Override
	public void DeleteQna(Qna qna) {

		qnaMapper.DeleteQna(qna);
		
	}

	@Override
	public void UpdateQna(Qna qna) {

		qnaMapper.UpdateQna(qna);
	}

	@Override
	public Qna SelectQnaDetail(int qNo) {
		
		Qna qna = qnaMapper.SelectQnaDetail(qNo);
		
		return qna;
	}
	
	@Override
	public Qna SelectQnaByQnaNo(int qNo) {
		
		Qna qna = qnaMapper.SelectQnaByQnaNo(qNo);
		
		return qna;
	}
	
	@Override
	public void UpdateQnaGroupNo(int qNo) {
		
		qnaMapper.UpdateQnaGroupNo(qNo);
	}
	
	@Override
	public void UpdateQnaStep(int qNo) {


		qnaMapper.UpdateQnaStep(qNo);
		
	}
		
		
}
