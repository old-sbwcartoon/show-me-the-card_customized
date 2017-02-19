package com.rnh.showmethecard.model.service;

import java.util.List;

import com.rnh.showmethecard.model.dto.Folder;

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
}
