package com.rnh.showmethecard.controller;

import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.rnh.showmethecard.ui.ThePager;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.reflect.TypeToken;
import com.rnh.showmethecard.model.dao.SearchDao;
import com.rnh.showmethecard.model.dto.Member;
import com.rnh.showmethecard.model.service.SearchService;
import com.rnh.showmethecard.model.dto.Card;
import com.rnh.showmethecard.model.dto.Folder;

@Controller
@RequestMapping(value = "/search/")
public class SearchController {
	
	@Autowired
	@Qualifier("searchDao")
	private SearchDao searchDao;
	
	@Autowired
	@Qualifier("searchService")
	private SearchService searchService;
	
	@RequestMapping(value = "search.action", method = RequestMethod.GET)
	public String searchPage() {
		
		return "search/search";
	}
	
//	@RequestMapping(value = "searchMember.action", method = RequestMethod.GET, produces = "application/json;charset=utf-8")
//	public ModelAndView memberSearch(HttpSession session, HttpServletRequest req, String fName) {
//		
//		ModelAndView mav = new ModelAndView();
//				
//		// 페이저 기능
//		int currentPage = 1;
//		int pageSize = 20;
//		int dataCount = 0;
//		int pagerSize = 20;
//		
//		String page = req.getParameter("pageno");
//		
//		String url = "search.action";
//		
//		if (page != null && page.length() > 0) {
//			currentPage = Integer.parseInt(page);
//		}
//		int startRow = (currentPage - 1) * pageSize + 1;
//		
//		List<Member> members = searchService.memberSearch(startRow, startRow + pageSize, fName);
//		
//		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
//		String member = gson.toJson(members);
//		
//		dataCount = searchDao.memberSearchCount();
//		
//		ThePager pager = new ThePager(dataCount, currentPage, pageSize, pagerSize, url);
//		
//		mav.addObject("pageno", currentPage);
//		mav.addObject("pager", pager);	
//		
//		return mav;
//	}
	
	@RequestMapping(value = "searchMember.action", method = RequestMethod.GET, produces = "application/json;charset=utf-8")
	@ResponseBody
	public String memberSearch(HttpSession session, HttpServletRequest req, String fName) {
		
		List<Member> members = searchService.memberSearch(fName);
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		String member = gson.toJson(members);
		
		return member;
	}
		
}
