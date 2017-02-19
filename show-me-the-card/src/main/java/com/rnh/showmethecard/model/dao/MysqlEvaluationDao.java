package com.rnh.showmethecard.model.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.rnh.showmethecard.model.dto.EvaluationComment;
import com.rnh.showmethecard.model.dto.EvaluationRating;
import com.rnh.showmethecard.model.dto.Qna;
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
	public EvaluationComment insertEvaluationComment(EvaluationComment newComment) {
		EvaluationComment ec = mapper.insertEvaluationComment(newComment);
		System.out.println(ec.geteCommentNo());
		return mapper.insertEvaluationComment(newComment);
	}


	@Override
	public void insertEvaluationRatingLiked(int eRatingNo, String mId, String likedmId) {
		HashMap<String, String> data = new HashMap<>();
		data.put("eRatingNo", String.valueOf(new Integer(eRatingNo)));
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
	public List<EvaluationRating> selectEvaluationRatingListWithmId(int cardNo, String mId) {
		HashMap<String, String> data = new HashMap<>();
		data.put("cardNo", String.valueOf(cardNo));
		data.put("mId", mId);
		
		return mapper.selectEvaluationRatingListWithmId(data);
	}

	@Override
	public float selectEvaluationRatingAvg(int cardNo) {
		return mapper.selectEvaluationRatingAvg(cardNo);
	}


	@Override
	public List<EvaluationComment> selectEvaluationCommentList(int cardNo) {
		return mapper.selectEvaluationCommentList(cardNo);
	}


	@Override
	public void deleteEvaluationCommentByeCommentNo(int eCommentNo) {
		mapper.deleteEvaluationCommentByeCommentNo(eCommentNo);
	}


	@Override
	public void deleteEvaluationRatingByeRatingNo(int eRatingNo) {		
		mapper.deleteEvaluationRatingByeRatingNo(eRatingNo);
		mapper.deleteEvaluationRatingLikedByeRatingNo(eRatingNo);
	}


	@Override
	public boolean selectExistsEvaluationRatingOfmId(int cardNo, String mId) {
		HashMap<String, String> data = new HashMap<>();
		data.put("cardNo", String.valueOf(cardNo));
		data.put("mId", mId);
		return mapper.selectExistsEvaluationRatingOfmId(data);
	}





	
	
	
}
