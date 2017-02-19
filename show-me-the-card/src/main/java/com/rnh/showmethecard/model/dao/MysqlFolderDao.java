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


	@Override
	public void changeFolder(Folder folder) {
		folderMapper.updateFolder(folder);
		
	}


	@Override
	public void deleteFolder(Folder folder) {
		folderMapper.deleteFolder(folder);
		
	}


}









