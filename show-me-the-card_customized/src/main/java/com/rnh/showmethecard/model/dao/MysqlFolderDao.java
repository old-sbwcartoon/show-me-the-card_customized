package com.rnh.showmethecard.model.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.rnh.showmethecard.model.dto.Folder;
import com.rnh.showmethecard.model.dto.Friend;
import com.rnh.showmethecard.model.dto.Member;
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


	@Override
	public void changeFolder(Folder folder) {
		folderMapper.updateFolder(folder);
		
	}


	@Override
	public void deleteFolder(Folder folder) {
		folderMapper.deleteFolder(folder);
		
	}


	@Override
	public List<Member> searchFollow(Friend friend) {
		
		return (List<Member>) folderMapper.searchFollow(friend);
	}


	@Override
	public void registerfollow(Friend friend) {
		folderMapper.insertfollow(friend);
		
	}


	@Override
	public List<Member> selectMyFollow(String mId) {
		return (List<Member>) folderMapper.selectMyFollow(mId);
	}


	@Override
	public void deletefollow(Friend friend) {

		folderMapper.deletefollow(friend);
		
	}


	@Override
	public void setBestFolderTag(String ftName, String bestTag, int fNo) {
		folderMapper.updateBestFolderTag(ftName, bestTag, fNo);
		
	}





}









