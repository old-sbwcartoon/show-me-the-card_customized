package com.rnh.showmethecard.model.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.rnh.showmethecard.common.Util;
import com.rnh.showmethecard.model.dao.FolderDao;
import com.rnh.showmethecard.model.dao.MemberDao;
import com.rnh.showmethecard.model.dto.Folder;
import com.rnh.showmethecard.model.dto.Friend;
import com.rnh.showmethecard.model.dto.Member;

@Service("folderService")
public class FolderServiceImpl implements FolderService {

	@Autowired
	@Qualifier("folderDao")
	private FolderDao folderDao;

	@Override
	public List<Folder> searchFolderById(String mId) {		
		List<Folder> folder = (List<Folder>) folderDao.searchFolderById(mId);
		
		return folder;
	}

	@Override
	public void registerFolder(Folder folder) {
		
		folderDao.registerFolder(folder);
		
	}

	@Override
	public void changeFolder(Folder folder) {
		folderDao.changeFolder(folder);
		
	}

	@Override
	public void deleteFolder(Folder folder) {
		folderDao.deleteFolder(folder);
		
		
	}

	@Override
	public List<Member> searchFollow(String mId, String frId) {
		Friend friend = new Friend();		
		friend.setmId(mId);
		friend.setFrId(frId);
		return (List<Member>) folderDao.searchFollow(friend);
	}

	@Override
	public void registerfollow(String mId, String frId) {
		Friend friend = new Friend();		
		friend.setmId(mId);
		friend.setFrId(frId);
		folderDao.registerfollow(friend);
		
	}

	@Override
	public List<Member> selectMyFollow(String mId) {
		return (List<Member>) folderDao.selectMyFollow(mId);
	}

	@Override
	public void deletefollow(String mId, String frId) {
		Friend friend = new Friend();		
		friend.setmId(mId);
		friend.setFrId(frId);
		folderDao.deletefollow(friend);
		
	}

	@Override
	public void setBestFolderTag(String ftName, String bestTag, int fNo) {
		folderDao.setBestFolderTag(ftName, bestTag, fNo);
		
	}

	
}
