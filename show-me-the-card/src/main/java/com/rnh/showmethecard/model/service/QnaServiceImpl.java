package com.rnh.showmethecard.model.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.rnh.showmethecard.model.dao.QnaDao;
import com.rnh.showmethecard.model.dto.Member;
import com.rnh.showmethecard.model.dto.Qna;

@Service("qnaService")
public class QnaServiceImpl implements QnaService {

	@Autowired
	@Qualifier("qnaDao")
	private QnaDao qnaDao;

	@Override
	public List<Qna> SearchQnaList() {
		List<Qna> qna = qnaDao.SelectQnaList();
		
		
		return qna;
	}

	@Override
	public void AddQna(Qna qna) {
		
		qnaDao.InsertQna(qna);
		
	}

	@Override
	public void DeleteQna(Qna qna) {
		
		qnaDao.DeleteQna(qna);
		
	}

	@Override
	public void ChangeQna(Qna qna) {
		
		qnaDao.UpdateQna(qna);
		
	}

	@Override
	public Qna SearchQnaDetail(int qNo) {
		Qna qna = qnaDao.SelectQnaDetail(qNo);
		
		return qna;
	}

}
