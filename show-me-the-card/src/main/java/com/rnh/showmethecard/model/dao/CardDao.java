package com.rnh.showmethecard.model.dao;

import java.util.List;

import com.rnh.showmethecard.model.dto.CardForInsert;
import com.rnh.showmethecard.model.dto.CardHistory;
import com.rnh.showmethecard.model.dto.MyCardList;

public interface CardDao {
	int selectCardDbBySiteUrl(String siteUrl);
	void insertCardDb(String siteUrl, String discoverer, String cName, String imgSrc, String urlDesc);
	void insertMyCard(CardForInsert cardForInsert);
	void insertMyTag(int mycNo, String mycName);
	
	void insertMyCardWithCardNo(CardForInsert cardForInsert);
	
	List<MyCardList> selectMyCardListByFNo(int fNo);
	
	void insertMyCardWithMycNo(int mycNo, int fNo);
	
	List<Integer> selectFolderByMId(String mId);
	
	void upDelMyCardByMycNo(int mycNo);
	
	void insertCardHistory(CardHistory cardHistory);
	
	void updateCardDbPoint(int cardNo);
	
	int selectCardDbAsCount();
	
	int selectCardNoAtMyCardByMycNo(int mycNo);
}