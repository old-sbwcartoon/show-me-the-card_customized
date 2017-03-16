package com.rnh.showmethecard.model.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.rnh.showmethecard.common.Literal;
import com.rnh.showmethecard.model.dto.BestNamed;
import com.rnh.showmethecard.model.dto.BestTag;
import com.rnh.showmethecard.model.dto.Card;
import com.rnh.showmethecard.model.dto.CardBasicInfo;
import com.rnh.showmethecard.model.dto.EvaluationComment;
import com.rnh.showmethecard.model.dto.EvaluationRating;
import com.rnh.showmethecard.model.mapper.EvaluationMapper;

@Repository(value="evaluationDao")
public class MysqlEvaluationDao implements EvaluationDao {
	
	@Autowired
	@Qualifier("evaluationMapper")
	private EvaluationMapper mapper;
	

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
	public void insertEvaluationComment(EvaluationComment newComment) {
		mapper.insertEvaluationComment(newComment);
	}


	@Override
	public List<EvaluationRating> selectEvaluationRatingListWithPageNo(int cardNo, String mId, int pageNo) {
		int limit = Literal.Ui.PAGER_LIMIT;
		int articleStartNo = (pageNo - 1) * limit;

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
	public void deleteEvaluationRatingByeRatingNo(int cardNo, int eRatingNo) {		
		mapper.deleteEvaluationRatingByeRatingNo(eRatingNo);
		mapper.deleteEvaluationRatingLikedByeRatingNo(eRatingNo);
		
		HashMap<String, Object> data = new HashMap<>();
		data.put("cardNo", cardNo);
		data.put("minArticleNo", Literal.Analysis.Average.MIN_ARTICLE_NO);
		mapper.updateCardRatingByCardNo(data);
	}


	@Override
	public boolean selectExistsEvaluationRatingOfmId(int cardNo, String mId) {
		HashMap<String, String> data = new HashMap<>();
		data.put("cardNo", String.valueOf(cardNo));
		data.put("mId", mId);
		return mapper.selectExistsEvaluationRatingOfmId(data);
	}

	@Override
	public EvaluationRating insertEvaluationRating(int cardNo, String mId, String content, int eRating) {
		EvaluationRating data = new EvaluationRating();
		data.setCardNo(cardNo);
		data.setmId(mId);
		data.setContent(content);
		data.seteRating(eRating);
		mapper.insertEvaluationRating(data);
		
		HashMap<String, Object> mapData = new HashMap<>();
		mapData.put("cardNo", cardNo);
		mapData.put("minArticleNo", Literal.Analysis.Average.MIN_ARTICLE_NO);
		mapper.updateCardRatingByCardNo(mapData);
		
		
		return data;
	}


	@Override
	public EvaluationRating selectEvaluationRatingBymId(int cardNo, String mId) {
		HashMap<String, String> data = new HashMap<>();
		data.put("cardNo", String.valueOf(cardNo));
		data.put("mId", mId);
		return mapper.selectEvaluationRatingBymId(data);
	}


	
	@Override
	public int selectEvaluationRatingNoSumWithCardNo(String tName, String tConditionName, String tConditionValue) {
		HashMap<String, String> data = new HashMap<>();
		data.put("tName", tName);
		data.put("tConditionName", tConditionName);
		data.put("tConditionValue", tConditionValue);
		return mapper.selectEvaluationRatingNoSumWithCardNo(data);
	}


	
	@Override
	public Card selectCardDbByCardNo(int cardNo) {
		return mapper.selectCardDbByCardNo(cardNo);
	}


	@Override
	public boolean selectExistsEvaluationCommentOfmId(int cardNo, String mId) {
		HashMap<String, Object> data = new HashMap<>();
		data.put("cardNo", cardNo);
		data.put("mId", mId);
		
		return mapper.selectExistsEvaluationCommentOfmId(data);
	}


	@Override
	public List<BestTag> selectBestTag(int valueNo, String columnName) {
		BestTag bestTag = new BestTag();
		bestTag.setValueNo(valueNo);
		bestTag.setColumnName(columnName);
		return mapper.selectBestTag(bestTag);
	}


	@Override
	public List<BestNamed> selectBestNamed(int cardNo) {
		return mapper.selectBestNamed(cardNo);
	}


	@Override
	public List<EvaluationRating> selectBestEvaluationRatingListWithCardNo(int cardNo, String mId) {
		HashMap<String, Object> data = new HashMap<>();
		data.put("cardNo", cardNo);
		data.put("mId", mId);
		data.put("limit", Literal.Ui.BEST_EVALUATION_RATING_LIST_LIMIT);
		
		return mapper.selectBestEvaluationRatingListWithCardNo(data);
	}


	@Override
	public CardBasicInfo selectCardBasicInfo(int cardNo) {
		return mapper.selectCardBasicInfoByCardNo(cardNo);
	}



	
	
}
