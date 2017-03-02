package com.rnh.showmethecard.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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
import com.rnh.showmethecard.model.dto.BestTag;
import com.rnh.showmethecard.model.dto.Folder;
import com.rnh.showmethecard.model.dto.Friend;
import com.rnh.showmethecard.model.dto.Member;
import com.rnh.showmethecard.model.dto.Notice;
import com.rnh.showmethecard.model.service.EvaluationService;
import com.rnh.showmethecard.model.service.FolderService;
import com.rnh.showmethecard.model.service.MemberService;

@Controller
@RequestMapping(value = "/mypage")
public class MyPageController {
	
	@Autowired
	@Qualifier("folderDao")
	private FolderDao folderDao;	
	
	@Autowired
	@Qualifier("folderService")
	private FolderService folderService;
	
	@Autowired
	@Qualifier("memberService")
	private MemberService memberService;
	
	@Autowired
	@Qualifier("evaluationService")
	private EvaluationService evaluationService;

	@RequestMapping(value="mypage.action", method=RequestMethod.GET)
	public String searchFolderById(HttpSession session, Model model, HttpServletResponse response, String goId) {
		Member member = null;
		
		String mId = null;
		boolean ownerPlag = false;
			member = (Member) session.getAttribute("loginuser");
				if (goId == null) {
					mId = member.getmId();
					ownerPlag = true;
				} else if(!(member.getmId().equals(goId))) {
					mId = goId;
				} else if(member.getmId().equals(goId)) {					
					ownerPlag = true;
					mId = goId;
				}
		
		List<Folder> folders = (List<Folder>) folderService.searchFolderById(mId);
		model.addAttribute("folders", folders);
		
		Member owner = memberService.getMemberBymId(mId);
		
		model.addAttribute("poLevel", owner.getmLevel());
		model.addAttribute("pageOwner", mId);
		model.addAttribute("ownerPlag", ownerPlag);
		
		
		String[] ftName = {"FT_NAME1", "FT_NAME2", "FT_NAME3"};
		for (int j = 0; j < folders.size(); j++) {
			
			List<BestTag> bestTagList = evaluationService.searchBestTag(folders.get(j).getfNo(), "F_NO");
			
			for (int i = 0; i < bestTagList.size(); i++) {
				String bestTag = bestTagList.get(i).getBestTagName();
				
				folderService.setBestFolderTag(ftName[i], bestTag, folders.get(j).getfNo());
			}
		}
		
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
	@RequestMapping(value="folderupdate.action", method=RequestMethod.POST, produces = "application/json;charset=utf-8" )
	@ResponseBody
	public String ChangeFolder(Folder folder, String fName, String mId, int fNo, boolean secret) {

		folder.setfName(fName);
		
		folder.setfNo(fNo);
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
	public String searchFollowById(HttpSession session, Model model, HttpServletResponse response) {
		Member member = null;
		String mId = null;
		 
			member = (Member) session.getAttribute("loginuser");
			mId = member.getmId();

		List<Member> friend = (List<Member>) folderService.selectMyFollow(mId);
		model.addAttribute("friends", friend);	
		
		
		return "mypage/follow";
	}
	
	
	@RequestMapping(value="searchfollow.action", method=RequestMethod.POST, produces = "application/json;charset=utf-8" )
	@ResponseBody
	public String SearchFollow(HttpSession session,HttpServletResponse response,  String frId) {
		Member member = null;
		
		member = (Member) session.getAttribute("loginuser");
		String mId = member.getmId();
		
		List<Member> members = (List<Member>) folderService.searchFollow(mId, frId);
		
		Gson gson = new Gson();		 
		return gson.toJson(members);
	}
	
	@RequestMapping(value="registerfollow.action", method=RequestMethod.POST, produces = "application/json;charset=utf-8" )
	@ResponseBody
	public String RegisterFollow(HttpSession session,HttpServletResponse response,  String frId) {
		Member member = null;
		 
			member = (Member) session.getAttribute("loginuser");
			
		String mId = member.getmId();
		folderService.registerfollow(mId, frId);
		
			
		
		return "success";
	}
	
	
	@RequestMapping(value="deletefollow.action", method=RequestMethod.POST, produces = "application/json;charset=utf-8" )
	@ResponseBody
	public String DeleteFollow(HttpSession session,HttpServletResponse response,  String frId) {
		Member member = null;
		member = (Member) session.getAttribute("loginuser");	 
		String mId = member.getmId();
		folderService.deletefollow(mId, frId);
		
			
		
		return "success";
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













