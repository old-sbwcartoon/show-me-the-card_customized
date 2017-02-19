package com.rnh.showmethecard.model.mapper;

import java.util.HashMap;

import org.apache.ibatis.annotations.Param;

public interface CardMapper {
	String selectCardDbBySiteUrl(String siteUrl);
	void insertCardDb(@Param("siteUrl")String siteUrl, @Param("discoverer")String discoverer,@Param("cName")String cName);
	void insertMyCard(HashMap<String, Object> map);
}
