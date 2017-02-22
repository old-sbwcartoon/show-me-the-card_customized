package com.rnh.showmethecard.model.service;

import java.util.HashMap;
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
	public EvaluationRating addEvaluationRating(int cardNo, String mId, String content, int eRating) {
		return dao.insertEvaluationRating(cardNo, mId, content, eRating);
	}
	
	@Override
	public void addEvaluationComment(EvaluationComment newComment) {
		dao.insertEvaluationComment(newComment);
	}

	@Override
	public void addEvaluationRatingLiked(int eRatingNo, String mId, String likedmId) {
		dao.insertEvaluationRatingLiked(eRatingNo, mId, likedmId);
	}

	@Override
	public List<EvaluationRating> showEvaluationRatingListWithPageNo(int cardNo, String mId, int pageNo) {
		return dao.selectEvaluationRatingListWithPageNo(cardNo, mId, pageNo);
	}

	@Override
	public float showEvaluationRatingAvg(int cardNo) {
		return dao.selectEvaluationRatingAvg(cardNo);
	}

	@Override
	public List<EvaluationComment> showEvaluationCommentList(int cardNo) {
		return dao.selectEvaluationCommentList(cardNo);
	}

	@Override
	public void deleteEvaluationCommentByeCommentNo(int eCommentNo) {
		dao.deleteEvaluationCommentByeCommentNo(eCommentNo);
	}

	@Override
	public void deleteEvaluationRatingByeRatingNo(int eRatingNo) {
		dao.deleteEvaluationRatingByeRatingNo(eRatingNo);
	}

	@Override
	public boolean confirmEvaluationRatingOfmId(int cardNo, String mId) {
		return dao.selectExistsEvaluationRatingOfmId(cardNo, mId);
	}

	@Override
	public EvaluationRating showEvaluationRatingBymId(int cardNo, String mId) {
		return dao.selectEvaluationRatingBymId(cardNo, mId);
	}
	
	
}
