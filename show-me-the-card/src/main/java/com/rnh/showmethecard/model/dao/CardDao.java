package com.rnh.showmethecard.model.dao;

public interface CardDao {
	boolean selectCardDbBySiteUrl(String url);
	void insertCardDb(String userId, String url);
	void insertCardDb(int cardNo, String mycComment);
}