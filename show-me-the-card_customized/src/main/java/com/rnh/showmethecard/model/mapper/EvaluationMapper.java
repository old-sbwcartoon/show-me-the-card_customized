package com.rnh.showmethecard.model.mapper;

import java.util.HashMap;
import java.util.List;

import com.rnh.showmethecard.model.dto.BestNamed;
import com.rnh.showmethecard.model.dto.BestTag;
import com.rnh.showmethecard.model.dto.Card;
import com.rnh.showmethecard.model.dto.CardBasicInfo;
import com.rnh.showmethecard.model.dto.EvaluationComment;
import com.rnh.showmethecard.model.dto.EvaluationRating;

public interface EvaluationMapper {

	void insertEvaluationRatingLiked(HashMap<String, String> data);	
	
	void insertEvaluationComment(EvaluationComment newComment);


	
	float selectEvaluationRatingAvg(int cardNo);

	List<EvaluationRating> selectEvaluationRatingList(int cardNo);

	List<EvaluationComment> selectEvaluationCommentList(int cardNo);
	
	
	
	void deleteEvaluationCommentByeCommentNo(int eCommentNo);

	void deleteEvaluationRatingByeRatingNo(int eRatingNo);
	
	void deleteEvaluationRatingLikedByeRatingNo(int eRatingNo);

	
	
	
	int selectEvaluationRatingLiked(HashMap<String, String> data);

	boolean selectExistsEvaluationRatingOfmId(HashMap<String, String> data);

	List<EvaluationRating> selectEvaluationRatingListWithPageNo(HashMap<String, Object> data);

	void insertEvaluationRating(EvaluationRating data);

	EvaluationRating selectEvaluationRatingBymId(HashMap<String, String> data);

	int selectEvaluationRatingNoSumWithCardNo(HashMap<String, String> data);

	Card selectCardDbByCardNo(int cardNo);

	boolean selectExistsEvaluationCommentOfmId(HashMap<String, Object> data);

	List<BestTag> selectBestTag(BestTag bestTag);

	List<BestNamed> selectBestNamed(int cardNo);

	List<EvaluationRating> selectBestEvaluationRatingListWithCardNo(HashMap<String, Object> data);
	
	void updateCardRatingByCardNo(HashMap<String, Object> data);

	CardBasicInfo selectCardBasicInfoByCardNo(int cardNo);
	
}
