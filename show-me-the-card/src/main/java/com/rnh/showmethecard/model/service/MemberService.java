package com.rnh.showmethecard.model.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.rnh.showmethecard.model.dto.Member;
import com.rnh.showmethecard.model.dto.MemberHistory;

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
	
}
