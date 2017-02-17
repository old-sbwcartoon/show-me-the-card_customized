package com.rnh.showmethecard.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.rnh.showmethecard.model.dao.FolderDao;
import com.rnh.showmethecard.model.dto.Folder;
import com.rnh.showmethecard.model.dto.Member;
import com.rnh.showmethecard.model.dto.Notice;
import com.rnh.showmethecard.model.service.FolderService;

@Controller
@RequestMapping(value = "/mypage")
public class MyPageController {
	
	@Autowired
	@Qualifier("folderDao")
	private FolderDao folderDao;	
	
	@Autowired
	@Qualifier("folderService")
	private FolderService folderService;

	@RequestMapping(value="mypage.action", method=RequestMethod.GET)
	public String searchFolderById(HttpSession session, Model model) {
		Member member = (Member) session.getAttribute("loginuser");
		String mId = member.getmId();
		List<Folder> folders = (List<Folder>) folderService.searchFolderById(mId);
		model.addAttribute("folders", folders);		
		return "mypage/mypage";
	}
	
//	//폴더 등록
	@RequestMapping(value="register.action", method=RequestMethod.POST, produces = "application/json;charset=utf-8" )
	@ResponseBody
	public String register(Folder folder, String fName, String mId) {
		folder.setfName(fName);
		folder.setmId(mId);
		folder.setSecret(false);
		folderService.registerFolder(folder);
		
		Gson gson = new Gson();	
		
		return gson.toJson(folder);
	}
//	
//	//아이디 중복 확인
//	@RequestMapping(value="confirmId.action", method = RequestMethod.POST,  produces = "application/json;charset=utf-8")
//	@ResponseBody
//	public String confirmId(String mId) {
//		Member member = dao.selectMemberById(mId);
//		if (member == null) {
//			return "success";
//		} else {
//			return "fail";
//		}
//	}
		
}









