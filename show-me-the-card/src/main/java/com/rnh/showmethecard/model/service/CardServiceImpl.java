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
		int cardNo = cardForInsert.getCardNo();
		if(cardNo == 0){
			String discoverer = cardForInsert.getDiscoverer();
			String siteUrl = cardForInsert.getSiteUrl();
			String cName = cardForInsert.getcName();
			cardDao.insertCardDb(siteUrl, discoverer, cName);
			System.out.println("CARDDB INSERT 성공");
		}
		cardNo = cardDao.selectCardDbBySiteUrl(cardForInsert.getSiteUrl());
		System.out.println(cardNo);
		String mycComment = cardForInsert.getMycComment();
		cardDao.insertMyCard(cardNo, mycComment);
		System.out.println("MYCARD INSERT 성공");
	}
	
//	@Override
//	public List<MyCardList> readMyCard(int fNo){
//		
//		myCardListList = cardDao.selectMyCardByFNo(fNo);
//		System.out.println(myCardListList.get(0).getMycComment());
//		for(int i = 0; i< myCardListList.size(); i++){
//			int tmp = myCardListList.get(i).getCardNo();
//			System.out.println(tmp);
//			String tmpResult = cardDao.selectUrlFromCardDbByCardNo(tmp);
//			myCardListList.get(i).setUrl(tmpResult);
//			System.out.println(tmpResult);
//		}
//		System.out.println("일단성공");
//		
//		return myCardListList;
//	}
	
	@Override
	public List<MyCardList> readMyCard(int fNo){
		return cardDao.selectMyCardListByFNo(fNo);
	}
	
//	private AdviceNote adviceNote;
//	private AdviceNoteForList adviceNoteForList;
//	private List<AdviceNoteForList> adviceNoteForListList;
//	private List<AdviceNote> adviceNoteList;
//	
//	private int number;
//	private List<String> strList;
//	@Override
//	public List<AdviceNote> checkAndShowList(String userId, String userType){
////		int number;
//		switch(userType){
//		case "D": number = adviceNoteDao.selectTeamById(userId);
////				  adviceNoteForList.setkNo(number);
//				  adviceNoteList = adviceNoteDao.selectAdviceNoteWithDynamic(userType, number);
//				  break;
//		case "P": adviceNoteForList = adviceNoteDao.selectChildNoById(userId);
//				  number = adviceNoteForList.getChNo();
//				  adviceNoteList = adviceNoteDao.selectAdviceNoteWithDynamic(userType, number);
//				  break;
//		case "T": number = adviceNoteDao.selectTeacherById(userId);
////		  		  adviceNoteForList.setcNo(number);
//		          adviceNoteList = adviceNoteDao.selectAdviceNoteWithDynamic(userType, number);
//		          break;
//		default:break;
//		}
//		return adviceNoteList;
//	}
//	
//	@Override
//	public void inputAdviceNote(AdviceNote adviceNote, String userType){
////		int number;
//		String userId = adviceNote.getId();
//		switch(userType){
//		case "D": 
//			number = adviceNoteDao.selectTeamById(userId);
////			adviceNoteForList.setkNo(number);
//			adviceNote.setDirection("가정으로");
//			break;
//		case "P": 
//			adviceNoteForList = adviceNoteDao.selectChildNoById(userId);
//			number = adviceNoteForList.getChNo();
//			adviceNote.setChNo(number);
//			adviceNote.setDirection("유치원으로");
//			break;
//		case "T": 
//			number = adviceNoteDao.selectTeacherById(userId);
////			adviceNoteForList.setcNo(number);
//			adviceNote.setDirection("가정으로");
//			break;
//		default:break;
//		}
//		adviceNoteDao.insertAdviceNote(adviceNote);
//	}
//	
//	@Override
//	public List<AdviceNoteForList> searchChild(String userId, String userType){
////		int number;
//		
//		switch(userType){
//		case "D": 
//			number = adviceNoteDao.selectTeamById(userId);
//			adviceNoteForListList = adviceNoteDao.selectChildListByNo(userType, number);
//			break;
//		case "P":
//			adviceNoteForList = adviceNoteDao.selectChildNoById(userId);
//			number = adviceNoteForList.getChNo();
//			adviceNoteForListList = adviceNoteDao.selectChildListByNo(userType, number);
//			break;
//		case "T":
//			number = adviceNoteDao.selectTeacherById(userId);  
//			adviceNoteForListList = adviceNoteDao.selectChildListByNo(userType, number);
//			break;
//		default:break;
//		}
//		return adviceNoteForListList;
//	}
	
	
	
	
	
//	@Override
//	public List<AdviceNote> selectAdviceNoteListAll(){
//		return (List<AdviceNote>) adviceNoteDao.selectAdviceNoteListAll();
//	}
//	
//	
//	@Override
//	public void updateAdviceNoteByNoteNo(AdviceNote adviceNote){
//		adviceNoteDao.updateAdviceNoteByNoteNo(adviceNote);
//	}
//	
//	@Override
//	public AdviceNote changeAdviceNoteDto() {
//		System.out.println(1);
//		return adviceNote;
//	}
//	
//	@Override
//	public AdviceNoteForList searchTeamById(String androidId){
//		adviceNoteForList = adviceNoteDao.selectTeamById(androidId);
//		return adviceNoteForList;
//	}
	

}
