package com.rnh.showmethecard.model.service;

import java.util.ArrayList;

import com.rnh.showmethecard.model.dto.EvaluationRating;

public interface EvaluationService {

	void addEvaluationRating(int cardNo, String mId, String content, int eRating);

	void addEvaluationComment(int cardNo, String mId, String content);

	void addEvaluationRatingLiked(int cardNo, String mId, String likedmId);

	ArrayList<EvaluationRating> showEvaluationRatingList(int cardNo);



	

}
