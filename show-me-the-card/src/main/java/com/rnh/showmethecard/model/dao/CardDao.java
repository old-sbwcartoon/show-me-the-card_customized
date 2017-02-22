package com.rnh.showmethecard.model.dao;

import java.util.List;

import com.rnh.showmethecard.model.dto.MyCardList;

public interface CardDao {
	int selectCardDbBySiteUrl(String siteUrl);
	void insertCardDb(String siteUrl, String discoverer, String cName);
	void insertMyCard(int cardNo, String mycComment);
	List<MyCardList> selectMyCardByFNo(int fNo);
	String selectUrlFromCardDbByCardNo(int cardNo);
	
	List<MyCardList> selectMyCardListByFNo(int fNo);
}