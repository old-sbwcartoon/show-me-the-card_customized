package com.rnh.showmethecard.model.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.rnh.showmethecard.model.dao.EvaluationDao;
import com.rnh.showmethecard.model.dto.EvaluationComment;
import com.rnh.showmethecard.model.dto.EvaluationRating;

@Service("evaluationService")
public class EvaluationServiceImpl implements EvaluationService {

	@Autowired
	@Qualifier("evaluationDao")
	private EvaluationDao dao;


	@Override
	public void addEvaluationRating(int cardNo, String mId, String content, int eRating) {
		dao.insertEvaluationRating(cardNo, mId, content, eRating);
	}

	@Override
	public void addEvaluationComment(int cardNo, String mId, String content) {
		dao.insertEvaluationComment(cardNo, mId, content);
	}

	@Override
	public void addEvaluationRatingLiked(int cardNo, String mId, String likedmId) {
		dao.insertEvaluationRatingLiked(cardNo, mId, likedmId);
	}

	@Override
	public ArrayList<EvaluationRating> showEvaluationRatingList(int cardNo) {
		return dao.selectEvaluationRatingList(cardNo);
	}

	@Override
	public float showEvaluationRatingAvg(int cardNo) {
		return dao.selectEvaluationRatingAvg(cardNo);
	}

	@Override
	public List<EvaluationComment> showEvaluationCommentList(int cardNo) {
		return dao.selectEvaluationCommentList(cardNo);
	}


	
	
}
