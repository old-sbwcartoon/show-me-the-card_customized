package com.rnh.showmethecard.model.service;

import java.util.List;

import com.rnh.showmethecard.model.dto.Folder;
import com.rnh.showmethecard.model.dto.Friend;
import com.rnh.showmethecard.model.dto.Member;

public interface FolderService {
		
	List<Folder> searchFolderById(String mid);

	void registerFolder(Folder folder);
//	
//	Member getMemberBymIdAndPassword(String mId, String password);
//	
//	String getMemberBymId(String mId, String password);
//	
//	void chageMember(Member member);
//	
//	void deleteMember(String mId);
//	
//	List<Member> getMemberList();

	void changeFolder(Folder folder);

	void deleteFolder(Folder folder);

	List<Member> searchFollow(String mId, String frId);

	void registerfollow(String mId, String frId);

	List<Member> selectMyFollow(String mId);

	void deletefollow(String mId, String frId);
}
