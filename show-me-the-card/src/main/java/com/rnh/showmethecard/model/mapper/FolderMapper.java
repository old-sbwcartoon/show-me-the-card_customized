package com.rnh.showmethecard.model.mapper;

import java.util.List;

import com.rnh.showmethecard.model.dto.Folder;
import com.rnh.showmethecard.model.dto.Friend;
import com.rnh.showmethecard.model.dto.Member;

//com.mvcdemoweb.model.mapper.MemberMapper 파일에 대응하는 인터페이스
public interface FolderMapper {
	
//	void insertMember(Member member);
//	
	List<Folder> selectFolderById(String mId); 		 
	

//	
//	Member selectMemberByIdAndPasswd(HashMap<String, Object> params);
//	
//	void updateMemberById(Member member);
//	
//	void deleteMemberById(String mId);
//	
//	List<Member> selectMembers();

	void insertFolder(Folder folder);

	void updateFolder(Folder folder);

	void deleteFolder(Folder folder);


	Member selectFolder(String mId);


	List<Member> searchFollow(Friend friend);


	void insertfollow(Friend friend);


	List<Member> selectMyFollow(String mId);


	void deletefollow(Friend friend);
	
	
}
