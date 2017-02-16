package com.rnh.showmethecard.model.dao;

import java.util.ArrayList;

import com.rnh.showmethecard.model.dto.EvaluationRating;

public interface EvaluationDao {

	void insertEvaluationRating(int cardNo, String mId, String content, int eRating);	

	void insertEvaluationComment(int cardNo, String mId, String content);

	void insertEvaluationRatingLiked(int cardNo, String mId, String likedmId);

	int selectEvaluationRatingLiked(int cardNo, String mId);

	ArrayList<EvaluationRating> selectEvaluationRatingList(int cardNo);

	
}
