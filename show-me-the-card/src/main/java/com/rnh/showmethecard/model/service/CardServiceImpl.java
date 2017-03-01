package com.rnh.showmethecard.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import org.springframework.stereotype.Service;

import com.rnh.showmethecard.model.dao.CardDao;
import com.rnh.showmethecard.model.dto.CardForInsert;
import com.rnh.showmethecard.model.dto.MyCardList;



@Service("cardService")
public class CardServiceImpl implements CardService {
	
	private List<MyCardList> myCardListList;
	
	@Autowired
	@Qualifier("cardDao")
	private CardDao cardDao;
	@Override
	public int checkCardDb(String siteUrl){
		int resultCardNo = cardDao.selectCardDbBySiteUrl(siteUrl);
		return resultCardNo;
	}
	
	
	@Override
	public void insertMyCardOrCardDb(CardForInsert cardForInsert){
		int cardNo = cardDao.selectCardDbBySiteUrl(cardForInsert.getSiteUrl());
		System.out.println("사이트조회 서비스 : " + cardNo);
		if(cardNo == 0){
			//카드 db 저장
			String discoverer = cardForInsert.getDiscoverer();
			String siteUrl = cardForInsert.getSiteUrl();
			String cName = cardForInsert.getcName();
			String imgSrc = cardForInsert.getImgSrc();
			String urlDesc = cardForInsert.getUrlDesc();
			cardDao.insertCardDb(siteUrl, discoverer, cName, imgSrc, urlDesc);
			//마이카드 저장
			cardNo = cardDao.selectCardDbBySiteUrl(cardForInsert.getSiteUrl());
			cardForInsert.setCardNo(cardNo);
			System.out.println("CARDDB INSERT 성공");
		}
		
		int fNo = cardForInsert.getfNo();
		cardForInsert.setCardNo(cardNo);
		
		cardDao.insertMyCard(cardForInsert);
		
		int mycNo = cardForInsert.getMycNo();
		System.out.println(mycNo);
		
//		int mycNo = cardForInsert.get
		System.out.println("MYCARD INSERT 성공");
		
		String mycName = "";
		
		for(int i = 0 ; i < cardForInsert.getMycTagsArr().length ; i++){
			mycName = cardForInsert.getMycTagsArr()[i];
			System.out.println(mycName);
			cardDao.insertMyTag(mycNo, mycName);
		}
		System.out.println("MYCTAG INSERT 성공");
	}
	
	@Override
	public List<MyCardList> readMyCard(int fNo){
		return cardDao.selectMyCardListByFNo(fNo);
	}
	
	@Override
	public void ScrapAction(int mycNo, String mId){
		List<Integer> fNoList = cardDao.selectFolderByMId(mId);
		int fNo;
		if(fNoList.isEmpty()){
			//insertFolder
		}else{
			fNo = fNoList.get(fNoList.size() - 1);
			cardDao.insertMyCardWithMycNo(mycNo, fNo);
		}
	}
	
	@Override
	public void delMyCard(int mycNo){
		cardDao.upDelMyCardByMycNo(mycNo);
	}

	

}
