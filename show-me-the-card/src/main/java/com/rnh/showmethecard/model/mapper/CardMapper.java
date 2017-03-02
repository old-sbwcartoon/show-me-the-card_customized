package com.rnh.showmethecard.model.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.rnh.showmethecard.model.dto.CardForInsert;
import com.rnh.showmethecard.model.dto.CardHistory;
import com.rnh.showmethecard.model.dto.MyCardList;

public interface CardMapper {
	String selectCardDbBySiteUrl(String siteUrl);
	void insertCardDb(@Param("siteUrl")String siteUrl, @Param("discoverer")String discoverer,@Param("cName")String cName, @Param("imgSrc")String imgSrc, @Param("urlDesc")String urlDesc);
	void insertMyCard(CardForInsert cardForInsert);
	void insertMycTag(HashMap<String, Object> map);
	
	void insertMyCardWithCardNo(CardForInsert cardForInsert);
	
	List<MyCardList> selectMyCardListByFNo(int fNo);
	
	void insertMyCardWithMycNo(@Param("mycNo") int mycNo, @Param("fNo") int fNo);
	
	List<Integer> selectFolderByMId(String mId);
	
	void upDelMyCardByMycNo(int mycNo);
	
	void insertCardHistory(CardHistory cardHistory);
}
