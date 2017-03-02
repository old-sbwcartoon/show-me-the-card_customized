package com.rnh.showmethecard.common;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.rnh.showmethecard.model.dao.CardDao;
import com.rnh.showmethecard.model.dto.CardHistory;
import com.rnh.showmethecard.model.dto.Member;
import com.rnh.showmethecard.model.service.CardService;
import com.rnh.showmethecard.model.service.MemberService;

@Service("point")
public class Point {
	
	@Autowired
	@Qualifier("memberService")
	private MemberService memberService;

	public Member updateMemberPointAndLevel(String content, Member member) { 
		memberService.updateMemberPointAndLevel(content, member);
		member = memberService.getMemberBymId(member.getmId());
		return member;
	}
	
	@Autowired
	@Qualifier("cardDao")
	private CardDao cardDao;
	private CardHistory cardHistory;
	public void makePointWithType(int mycNo , String type, String mId){

		int tmp = cardDao.selectCardDbAsCount();
		int cardNo = cardDao.selectCardNoAtMyCardByMycNo(mycNo);
		int chPoint = 0;
		switch(type){
		case "scrap" : chPoint = 20;break;
		case "moveurl" : chPoint = 1;break;
		case "ratingcard" : chPoint = 1;break;
		}
		cardHistory = new CardHistory();
		cardHistory.setCardNo(cardNo);
		cardHistory.setChPoint(chPoint);
		cardHistory.setmId(mId);
		cardHistory.setType(type);
		cardDao.insertCardHistory(cardHistory);
		cardDao.updateCardDbPoint(cardNo);
		
		
	}
}
