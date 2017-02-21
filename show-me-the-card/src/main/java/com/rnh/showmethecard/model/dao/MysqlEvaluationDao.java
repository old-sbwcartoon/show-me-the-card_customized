package com.rnh.showmethecard.model.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.rnh.showmethecard.common.Literal;
import com.rnh.showmethecard.model.dto.EvaluationComment;
import com.rnh.showmethecard.model.dto.EvaluationRating;
import com.rnh.showmethecard.model.dto.Qna;
import com.rnh.showmethecard.model.mapper.EvaluationMapper;

@Repository(value="evaluationDao")
public class MysqlEvaluationDao implements EvaluationDao {
	
	@Autowired
	@Qualifier("evaluationMapper")
	private EvaluationMapper mapper;
	
	
//	@Override
//	public void insertEvaluationRating(EvaluationRating newRating) {
//		mapper.insertEvaluationRating(newRating);		
//	}


	@Override
	public void insertEvaluationComment(EvaluationComment newComment) {
		mapper.insertEvaluationComment(newComment);
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
	public List<EvaluationRating> selectEvaluationRatingListWithPageNo(int cardNo, String mId, int pageNo) {
		int limit = Literal.Ui.LIMIT;
		int articleStartNo = (pageNo - 1) * limit;
		System.out.println(limit);
		System.out.println(articleStartNo);
		HashMap<String, Object> data = new HashMap<>();
		data.put("cardNo", cardNo);
		data.put("mId", mId);
		data.put("articleStartNo", articleStartNo);
		data.put("limit", limit);
		
		return mapper.selectEvaluationRatingListWithPageNo(data);
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
