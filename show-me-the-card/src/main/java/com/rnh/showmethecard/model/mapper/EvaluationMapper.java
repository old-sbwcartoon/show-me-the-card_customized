package com.rnh.showmethecard.model.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import com.rnh.showmethecard.model.dto.EvaluationRating;

public interface EvaluationMapper {

	void insertEvaluationRating(HashMap<String, String> data);

	void insertEvaluationComment(HashMap<String, String> data);

	void insertEvaluationRatingLiked(HashMap<String, String> data);

	int selectEvaluationRatingLiked(HashMap<String, String> data);

	ArrayList<EvaluationRating> selectEvaluationRatingList(int cardNo);

	
}
