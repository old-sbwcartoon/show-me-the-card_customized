package com.rnh.showmethecard.model.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.rnh.showmethecard.model.dto.Folder;
import com.rnh.showmethecard.model.mapper.FolderMapper;

@Repository(value = "folderDao")
public class MysqlFolderDao implements FolderDao {
	
	@Autowired
	@Qualifier("folderMapper")
	private FolderMapper folderMapper;	

	@Override
	public List<Folder> searchFolderById(String mId) {
		List<Folder> folder = (List<Folder>) folderMapper.selectFolderById(mId);		
		return folder;
	}
	
	
	@Override
	public void registerFolder(Folder folder) {
		folderMapper.insertFolder(folder);
	}
//
//	@Override
//	public Member selectMemberById(String mId) {
//		Member member = memberMapper.selectMemberById(mId);
//		return member;
//	}
//
//	@Override
//	public Member selectMemberByIdAndPasswd(String mId, String password) {
//		HashMap<String, Object> params = new HashMap<>();
//		params.put("mId", mId);
//		params.put("password", password);
//		
//		Member member = memberMapper.selectMemberByIdAndPasswd(params);
//		return member;
//	}
//
//	@Override
//	public void updateMemberById(Member member) {
//		memberMapper.updateMemberById(member);	
//	}
//
//	@Override
//	public void deleteMemberById(String mId) {
//		memberMapper.deleteMemberById(mId);		
//	}
//
//	@Override
//	public List<Member> selectMemberList() {
//		List<Member> members = memberMapper.selectMembers();
//		return members;
//	}


}









