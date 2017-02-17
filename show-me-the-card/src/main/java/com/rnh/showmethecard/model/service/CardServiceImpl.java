package com.rnh.showmethecard.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.rnh.showmethecard.model.dao.CardDao;


@Service("cardService")
public class CardServiceImpl implements CardService {
	
	@Autowired
	@Qualifier("cardDao")
	private CardDao cardDao;
	
	@Override
	public int checkCardDb(String siteUrl){
		int resultCardNo = cardDao.selectCardDbBySiteUrl(siteUrl);
		return resultCardNo;
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
