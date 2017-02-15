package com.rnh.showmethecard.model.dao;

import com.rnh.showmethecard.model.dto.Member;

public interface MemberDao {
	
	void insertMember(Member member);
	
	Member selectMemberById(String mId);
	
	Member selectMemberByIdAndPasswd(String mId, String password);
	
	void updateMemberById(Member member);
	
	void deleteMemberById(String mId);

}