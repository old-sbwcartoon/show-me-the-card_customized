package com.rnh.showmethecard.model.mapper;

import java.util.HashMap;
import java.util.List;

import com.rnh.showmethecard.model.dto.EvaluationComment;
import com.rnh.showmethecard.model.dto.EvaluationRating;

public interface EvaluationMapper {

	void insertEvaluationRatingLiked(EvaluationRating newRating);

	List<EvaluationRating> selectEvaluationRatingList(int cardNo);

	float selectEvaluationRatingAvg(int cardNo);

	List<EvaluationComment> selectEvaluationCommentList(int cardNo);

	void insertEvaluationComment(EvaluationComment newComment);

	
	
	
	void deleteEvaluationCommentByeCommentNo(int eCommentNo);

	void deleteEvaluationRatingByeRatingNo(int eRatingNo);
	
	void deleteEvaluationRatingLikedByeRatingNo(int eRatingNo);

	
	
	
	int selectEvaluationRatingLiked(HashMap<String, String> data);


	boolean selectExistsEvaluationRatingOfmId(HashMap<String, String> data);

	List<EvaluationRating> selectEvaluationRatingListWithPageNo(HashMap<String, Object> data);

	void insertEvaluationRating(EvaluationRating newRating);

	
}
