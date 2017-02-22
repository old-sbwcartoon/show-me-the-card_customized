package com.rnh.showmethecard.model.dao;

import java.util.List;

import com.rnh.showmethecard.model.dto.Folder;
import com.rnh.showmethecard.model.dto.Friend;
import com.rnh.showmethecard.model.dto.Member;

public interface FolderDao {
	
//	void insertMember(Folder folder);
	
	List<Folder> searchFolderById(String mId);
//	
//	Member selectMemberByIdAndPasswd(String mId, String password);
//	
//	void updateMemberById(Member member);
//	
//	void deleteMemberById(String mId);
//	
//	List<Member> selectMemberList();

	void registerFolder(Folder folder);

	void changeFolder(Folder folder);

	void deleteFolder(Folder folder);

	List<Member> searchFollow(Friend friend);
	

	void registerfollow(Friend friend);

}