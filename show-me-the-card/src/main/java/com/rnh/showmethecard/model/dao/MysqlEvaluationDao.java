package com.rnh.showmethecard.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.rnh.showmethecard.model.dto.EvaluationComment;
import com.rnh.showmethecard.model.dto.EvaluationRating;
import com.rnh.showmethecard.model.mapper.EvaluationMapper;

@Repository(value="evaluationDao")
public class MysqlEvaluationDao implements EvaluationDao {
	
	@Autowired
	@Qualifier("evaluationMapper")
	private EvaluationMapper mapper;
	
	
	@Override
	public void insertEvaluationRating(int cardNo, String mId, String content, int eRating) {
		HashMap<String, String> data = new HashMap<>();
		data.put("mId", mId);
		data.put("cardNo", String.valueOf(cardNo));
		data.put("content", content);
		data.put("eRating", String.valueOf(eRating));
		
		mapper.insertEvaluationRating(data);		
	}

	
	@Override
	public void insertEvaluationComment(int cardNo, String mId, String content) {
//		HashMap<String, String> data = new HashMap<>();
//		data.put("mId", mId);
//		data.put("cardNo", String.valueOf(new Integer(cardNo)));
//		data.put("content", content);
		
		HashMap<String, Object> data = new HashMap<>();
		data.put("mId", mId);
		data.put("cardNo", new Integer(cardNo));
		data.put("content", content);
		
		mapper.insertEvaluationComment(data);
	}


	@Override
	public void insertEvaluationRatingLiked(int cardNo, String mId, String likedmId) {
		HashMap<String, String> data = new HashMap<>();
		data.put("cardNo", String.valueOf(new Integer(cardNo)));
		data.put("mId", mId);
		data.put("likedmId", likedmId);
		
		mapper.insertEvaluationRatingLiked(data);
	}


	@Override
	public int selectEvaluationRatingLiked(int cardNo, String mId) {
		HashMap<String, String> data = new HashMap<>();
		data.put("cardNo", String.valueOf(cardNo));
		data.put("mId", mId);
		
		return mapper.selectEvaluationRatingLiked(data);	
	}


	@Override
	public ArrayList<EvaluationRating> selectEvaluationRatingList(int cardNo) {
		return mapper.selectEvaluationRatingList(cardNo);
	}


	@Override
	public float selectEvaluationRatingAvg(int cardNo) {
		return mapper.selectEvaluationRatingAvg(cardNo);
	}


	@Override
	public ArrayList<EvaluationComment> selectEvaluationCommentList(int cardNo) {
		return mapper.selectEvaluationCommentList(cardNo);
	}


	
	
	
}
