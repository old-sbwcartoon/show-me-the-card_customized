package com.rnh.showmethecard.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
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
	public String searchFolderById(HttpSession session, Model model, HttpServletResponse response) {
		Member member = null;
		if (session.getAttribute("loginuser") != null) { 
			member = (Member) session.getAttribute("loginuser");	 
			} else { 
				PrintWriter writer;
				try {
					writer = response.getWriter();
					writer.println("<script>alert('Need Login'); location.href='/showmethecard/home.action';</script>");
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}				
			 
			} 
		
		String mId = member.getmId();
		List<Folder> folders = (List<Folder>) folderService.searchFolderById(mId);
		model.addAttribute("folders", folders);		
		return "mypage/mypage";
	}
	
//	//폴더 등록
	@RequestMapping(value="register.action", method=RequestMethod.POST, produces = "application/json;charset=utf-8" )
	@ResponseBody
	public String RegisterFolder(Folder folder, String fName, String mId, boolean secret) {
		folder.setfName(fName);
		folder.setmId(mId);
		folder.setSecret(secret);
		folderService.registerFolder(folder);
		
		Gson gson = new Gson();	
		
		return gson.toJson(folder);
	}

	
	//폴더 수정
	@RequestMapping(value="update.action", method=RequestMethod.POST, produces = "application/json;charset=utf-8" )
	@ResponseBody
	public String ChangeFolder(Folder folder, String fName, String mId, String fNo, boolean secret) {
		
		folder.setfName(fName);
		int fNo1 = Integer.parseInt(fNo);
		folder.setfNo(fNo1);
		folder.setmId(mId);		
		folder.setSecret(secret);
		
		folderService.changeFolder(folder);
		
		Gson gson = new Gson();	
		
		return gson.toJson(folder);
	}
	
	
	//폴더 수정
	@RequestMapping(value="delete.action", method=RequestMethod.POST, produces = "application/json;charset=utf-8" )
	@ResponseBody
	public String DeleteFolder(Folder folder, String fName, String mId, String fNo) {
		
		folder.setfName(fName);
		int fNo1 = Integer.parseInt(fNo);
		folder.setfNo(fNo1);
		folder.setmId(mId);	
		
		
		folderService.deleteFolder(folder);
		
		Gson gson = new Gson();	
		
		return gson.toJson(folder);
	}
	
	
	
	@RequestMapping(value="myfollow.action", method=RequestMethod.GET)
	public String searchFollowById(HttpSession session, Model model) {
		Member member = null;
		if (session.getAttribute("loginuser") != null) { 
			member = (Member) session.getAttribute("loginuser");	 
			} else { 
				
			 return "home";
			}		
		
		
		
		return "mypage/follow";
	}
	
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









