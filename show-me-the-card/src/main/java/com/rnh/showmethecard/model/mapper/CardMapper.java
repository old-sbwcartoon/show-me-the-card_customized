package com.rnh.showmethecard.model.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import com.rnh.showmethecard.model.dto.MyCardList;

public interface CardMapper {
	String selectCardDbBySiteUrl(String siteUrl);
	void insertCardDb(@Param("siteUrl")String siteUrl, @Param("discoverer")String discoverer,@Param("cName")String cName, @Param("imgSrc")String imgSrc);
	void insertMyCard(HashMap<String, Object> map);
	void insertMycTag(HashMap<String, Object> map);
	
	List<MyCardList> selectMyCardListByFNo(int fNo);
}
