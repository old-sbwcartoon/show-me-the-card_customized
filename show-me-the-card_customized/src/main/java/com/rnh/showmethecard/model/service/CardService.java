package com.rnh.showmethecard.model.service;

import java.util.List;

import com.rnh.showmethecard.model.dto.CardForInsert;
import com.rnh.showmethecard.model.dto.MyCardList;



public interface CardService {
	
	int checkCardDb(String siteUrl);
	
	void insertMyCardOrCardDb(CardForInsert cardForInsert);
	
	List<MyCardList> readMyCard(int fNo);
	
	void ScrapAction(int mycNo, String mId);
	
	void delMyCard(int mycNo);
	
	//List<MyCardList> selectMyCardListByFNo(int fNo);
	//void insertCardDb(String userId, String url);
	//void insertMyCard(int cardNo, String mycComment);
//	
//	void inputAdviceNote(AdviceNote adviceNote, String userType);
//	
//	List<AdviceNoteForList> searchChild(String userId, String userType);
	
//	void insertAdviceNote(AdviceNote adviceNote);
//	void checkUserTypeToShowList(String userId);
//	
//	AdviceNoteForList selectChildTableByKNo(String tmpKNo);
//	
//	AdviceNote changeAdviceNoteDto();
//	
//	List<AdviceNote> selectAdviceNoteListAll();
//	
//	void updateAdviceNoteByNoteNo(AdviceNote adviceNote);
//	
//	AdviceNoteForList searchTeamById(String adnroidId);

	
	
	
}
