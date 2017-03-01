package com.rnh.showmethecard.model.service;

import java.util.List;

import com.rnh.showmethecard.model.dto.BestNamed;
import com.rnh.showmethecard.model.dto.BestTag;
import com.rnh.showmethecard.model.dto.Card;
import com.rnh.showmethecard.model.dto.EvaluationComment;
import com.rnh.showmethecard.model.dto.EvaluationRating;

public interface EvaluationService {
	
	EvaluationRating addEvaluationRating(int cardNo, String mId, String content, int eRating);
	
	void addEvaluationRatingLiked(int eRatingNo, String mId, String likedmId);

	void addEvaluationComment(EvaluationComment newComment);

	float searchEvaluationRatingAvg(int cardNo);

	List<EvaluationComment> searchEvaluationCommentList(int cardNo);




	void deleteEvaluationCommentByeCommentNo(int eCommentNo);

	void deleteEvaluationRatingByeRatingNo(int eRatingNo);

	boolean confirmEvaluationRatingOfmId(int cardNo, String mId);

	List<EvaluationRating> searchEvaluationRatingListWithPageNo(int cardNo, String getmId, int pageNo);

	EvaluationRating searchEvaluationRatingBymId(int cardNo, String mId);

	int searchEvaluationRatingNoSum(String tName, String tConditionName, String tConditionValue);

	Card searchCardDb(int cardNo);

	boolean confirmEvaluationCommentOfmId(int cardNo, String mId);

	List<BestTag> searchBestTag(int valueNo, String columnName);

	List<BestNamed> searchBestNamed(int cardNo);

	List<EvaluationRating> searchBestEvaluationRatingList(int cardNo, String mId);

	

}
