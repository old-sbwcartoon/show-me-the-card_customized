package com.rnh.showmethecard.model.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.rnh.showmethecard.model.dto.Member;

public interface MemberService {
		
	void registerMember(Member member);

	String getMemberResultBymId(String mId);
	
	Member getMemberBymIdAndPassword(String mId, String password);
	
	String getMemberBymId(String mId, String password, HttpSession session);
	
	void chageMember(Member member);
	
	void deleteMember(String mId);
	
	List<Member> getMemberList();
}
