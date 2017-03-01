package com.rnh.showmethecard.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.rnh.showmethecard.model.dao.EvaluationDao;
import com.rnh.showmethecard.model.dto.BestNamed;
import com.rnh.showmethecard.model.dto.BestTag;
import com.rnh.showmethecard.model.dto.Card;
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
	public List<EvaluationRating> searchEvaluationRatingListWithPageNo(int cardNo, String mId, int pageNo) {
		return dao.selectEvaluationRatingListWithPageNo(cardNo, mId, pageNo);
	}

	@Override
	public float searchEvaluationRatingAvg(int cardNo) {
		return dao.selectEvaluationRatingAvg(cardNo);
	}

	@Override
	public List<EvaluationComment> searchEvaluationCommentList(int cardNo) {
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
	public EvaluationRating searchEvaluationRatingBymId(int cardNo, String mId) {
		return dao.selectEvaluationRatingBymId(cardNo, mId);
	}

	@Override
	public int searchEvaluationRatingNoSum(String tName, String tConditionName, String tConditionValue) {
		return dao.selectEvaluationRatingNoSumWithCardNo(tName, tConditionName, tConditionValue);
	}

	@Override
	public Card searchCardDb(int cardNo) {
		return dao.selectCardDbByCardNo(cardNo);
	}

	@Override
	public boolean confirmEvaluationCommentOfmId(int cardNo, String mId) {
		return dao.selectExistsEvaluationCommentOfmId(cardNo, mId);
	}

	@Override
	public List<BestTag> searchBestTag(int valueNo, String columnName) {		
		return dao.selectBestTag(valueNo, columnName);
	}

	@Override
	public List<BestNamed> searchBestNamed(int cardNo) {
		return dao.selectBestNamed(cardNo);
	}

	@Override
	public List<EvaluationRating> searchBestEvaluationRatingList(int cardNo, String mId) {
		return dao.selectBestEvaluationRatingListWithCardNo(cardNo, mId);
	}
	
	
}
