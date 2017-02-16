package com.rnh.showmethecard.model.service;

import java.util.List;

import com.rnh.showmethecard.model.dto.EvaluationComment;
import com.rnh.showmethecard.model.dto.EvaluationRating;

public interface EvaluationService {

	void addEvaluationRating(int cardNo, String mId, String content, int eRating);

	void addEvaluationComment(int cardNo, String mId, String content);

	void addEvaluationRatingLiked(int cardNo, String mId, String likedmId);

	List<EvaluationRating> showEvaluationRatingList(int cardNo);

	float showEvaluationRatingAvg(int cardNo);

	List<EvaluationComment> showEvaluationCommentList(int cardNo);



	

}
