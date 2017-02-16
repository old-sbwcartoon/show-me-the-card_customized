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

	
}
