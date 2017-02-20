package com.rnh.showmethecard.model.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.rnh.showmethecard.model.dto.Member;
import com.rnh.showmethecard.model.dto.MemberHistory;
import com.rnh.showmethecard.model.dto.Qna;

public interface MemberService {
		
	void registerMember(Member member);

	String getMemberResultBymId(String mId);
	
	Member getMemberBymIdAndPassword(String mId, String password);
	
	String getMemberBymId(String mId, String password, HttpSession session);
	
	void chageMember(Member member);
	
	void deleteMember(String mId);
	
	List<Member> getMemberList();
	
	List<MemberHistory> getPointHistory(String mId);
	
	void registerPoint(MemberHistory history);
	
	void updateMemberPoint(String mId);
	
	void updateMemberLevel(String mId, int mLevel);
	
	List<Qna> getQnaList(String mId);
}
