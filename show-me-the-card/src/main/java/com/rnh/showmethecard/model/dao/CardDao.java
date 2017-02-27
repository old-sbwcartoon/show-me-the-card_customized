package com.rnh.showmethecard.model.dao;

import java.util.List;

import com.rnh.showmethecard.model.dto.CardForInsert;
import com.rnh.showmethecard.model.dto.MyCardList;

public interface CardDao {
	int selectCardDbBySiteUrl(String siteUrl);
	void insertCardDb(String siteUrl, String discoverer, String cName, String imgSrc, String urlDesc);
	void insertMyCard(CardForInsert cardForInsert);
	void insertMyTag(int mycNo, String mycName);
	
	List<MyCardList> selectMyCardListByFNo(int fNo);
}