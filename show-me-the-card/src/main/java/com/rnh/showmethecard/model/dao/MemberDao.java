package com.rnh.showmethecard.model.dao;

import java.util.List;

import com.rnh.showmethecard.model.dto.Member;
import com.rnh.showmethecard.model.dto.MemberHistory;

public interface MemberDao {
	
	void insertMember(Member member);
	
	Member selectMemberById(String mId);
	
	Member selectMemberByIdAndPasswd(String mId, String password);
	
	void updateMemberById(Member member);
	
	void deleteMemberById(String mId);
	
	List<Member> selectMemberList();
	
	List<MemberHistory> selectPointHistory(String mId);
	
	boolean selectPointExits(String mId, String content );
	
	void updatePointHistory(String mId, String content);
	
	void insertPointHistory(MemberHistory history);
	
	void updateMemberPoint(String mId);

}