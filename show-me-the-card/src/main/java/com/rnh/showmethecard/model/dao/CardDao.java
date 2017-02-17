package com.rnh.showmethecard.model.dao;

public interface CardDao {
	int selectCardDbBySiteUrl(String url);
	void insertCardDb(String userId, String url);
	void insertMyCard(int cardNo, String mycComment);
}