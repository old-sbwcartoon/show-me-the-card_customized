package com.rnh.showmethecard.model.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.rnh.showmethecard.model.dto.CardForInsert;
import com.rnh.showmethecard.model.dto.MyCardList;
import com.rnh.showmethecard.model.mapper.CardMapper;


@Repository(value = "cardDao")
public class MysqlCardDao implements CardDao {
	
	@Autowired
	@Qualifier("cardMapper")
	private CardMapper cardMapper;	
	
	
	@Override
	public int selectCardDbBySiteUrl(String siteUrl) {
		String a = cardMapper.selectCardDbBySiteUrl(siteUrl);
		int b = 0;
		if(a == null){
			return b;
		}
		return b = Integer.parseInt(a);
	}
	
	@Override
	public void insertCardDb(String siteUrl, String discoverer, String cName, String imgSrc, String urlDesc) {
		cardMapper.insertCardDb(siteUrl, discoverer, cName, imgSrc, urlDesc);
	}
	
	@Override
	public void insertMyCard(CardForInsert cardForInsert) {
		cardMapper.insertMyCard(cardForInsert);
	}
	
	public void insertMyTag(int mycNo, String mycName) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("mycNo", mycNo);
		map.put("mycName", mycName);
		cardMapper.insertMycTag(map);
	}
	
	@Override
	public List<MyCardList> selectMyCardListByFNo(int fNo){
		return cardMapper.selectMyCardListByFNo(fNo);
	}
	
	@Override
	public void insertMyCardWithCardNo(CardForInsert cardForInsert){
		
	}
	
	@Override
	public void insertMyCardWithMycNo(int mycNo,  int fNo){
		cardMapper.insertMyCardWithMycNo(mycNo, fNo);
	}
	
	@Override
	public List<Integer> selectFolderByMId(String mId){
		return cardMapper.selectFolderByMId(mId);
	}
	
	@Override
	public void upDelMyCardByMycNo(int mycNo){
		cardMapper.upDelMyCardByMycNo(mycNo);
	}

}









