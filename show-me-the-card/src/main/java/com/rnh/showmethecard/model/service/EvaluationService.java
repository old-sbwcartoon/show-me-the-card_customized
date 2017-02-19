package com.rnh.showmethecard.model.service;

import java.util.List;

import com.rnh.showmethecard.model.dto.EvaluationComment;
import com.rnh.showmethecard.model.dto.EvaluationRating;

public interface EvaluationService {

	void addEvaluationRating(int cardNo, String mId, String content, int eRating);
	
	void addEvaluationRatingLiked(int eRatingNo, String mId, String likedmId);

	EvaluationComment  addEvaluationComment(EvaluationComment newComment);

	List<EvaluationRating> showEvaluationRatingListWithmId(int cardNo, String mId);

	float showEvaluationRatingAvg(int cardNo);

	List<EvaluationComment> showEvaluationCommentList(int cardNo);




	void deleteEvaluationCommentByeCommentNo(int eCommentNo);

	void deleteEvaluationRatingByeRatingNo(int eRatingNo);

	boolean confirmEvaluationRatingOfmId(int cardNo, String mId);
	


	



	

}
