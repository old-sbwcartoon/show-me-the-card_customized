package com.rnh.showmethecard.model.dao;

import java.util.List;

import com.rnh.showmethecard.model.dto.BestNamed;
import com.rnh.showmethecard.model.dto.BestTag;
import com.rnh.showmethecard.model.dto.Card;
import com.rnh.showmethecard.model.dto.CardBasicInfo;
import com.rnh.showmethecard.model.dto.EvaluationComment;
import com.rnh.showmethecard.model.dto.EvaluationRating;

public interface EvaluationDao {

	EvaluationRating insertEvaluationRating(int cardNo, String mId, String content, int eRating);

	void insertEvaluationComment(EvaluationComment newComment);

	void insertEvaluationRatingLiked(int eRatingNo, String mId, String likedmId);

	int selectEvaluationRatingLiked(int cardNo, String mId);

	float selectEvaluationRatingAvg(int cardNo);

	List<EvaluationComment> selectEvaluationCommentList(int cardNo);


	
	
	
	void deleteEvaluationCommentByeCommentNo(int eCommentNo);

	void deleteEvaluationRatingByeRatingNo(int cardNo, int eRatingNo);

	boolean selectExistsEvaluationRatingOfmId(int cardNo, String mId);

	List<EvaluationRating> selectEvaluationRatingListWithPageNo(int cardNo, String mId, int pageNo);

	EvaluationRating selectEvaluationRatingBymId(int cardNo, String mId);

	int selectEvaluationRatingNoSumWithCardNo(String tName, String tConditionName, String tConditionValue);

	Card selectCardDbByCardNo(int cardNo);

	boolean selectExistsEvaluationCommentOfmId(int cardNo, String mId);

	List<BestTag> selectBestTag(int cardNo, String columnName);

	List<BestNamed> selectBestNamed(int cardNo);

	List<EvaluationRating> selectBestEvaluationRatingListWithCardNo(int cardNo, String mId);

	CardBasicInfo selectCardBasicInfo(int cardNo);


	
}
