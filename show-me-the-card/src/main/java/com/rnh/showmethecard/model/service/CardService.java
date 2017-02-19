package com.rnh.showmethecard.model.service;

import com.rnh.showmethecard.model.dto.CardForInsert;



public interface CardService {
	
	int checkCardDb(String siteUrl);
	void insertMyCardOrCardDb(CardForInsert cardForInsert);
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
