package com.rnh.showmethecard.model.dao;

public interface CardDao {
	int selectCardDbBySiteUrl(String siteUrl);
	void insertCardDb(String siteUrl, String discoverer, String cName);
	void insertMyCard(int cardNo, String mycComment);
}