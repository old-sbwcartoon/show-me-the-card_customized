package com.rnh.showmethecard.model.dao;

import java.util.List;

import com.rnh.showmethecard.model.dto.MyCardList;

public interface CardDao {
	int selectCardDbBySiteUrl(String siteUrl);
	void insertCardDb(String siteUrl, String discoverer, String cName, String imgSrc);
	void insertMyCard(int cardNo, String mycComment);
	void insertMyTag(int cardNo, String mycTag);
	
	List<MyCardList> selectMyCardListByFNo(int fNo);
}