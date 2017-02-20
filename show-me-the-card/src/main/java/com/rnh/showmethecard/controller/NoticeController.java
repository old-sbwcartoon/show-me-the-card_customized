package com.rnh.showmethecard.controller;

import java.lang.reflect.Type;
import java.util.ArrayList;
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

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.reflect.TypeToken;
import com.rnh.showmethecard.model.dao.MemberDao;
import com.rnh.showmethecard.model.dao.NoticeDao;
import com.rnh.showmethecard.model.dto.Member;
import com.rnh.showmethecard.model.dto.Notice;
import com.rnh.showmethecard.model.service.NoticeService;
import com.rnh.showmethecard.ui.ThePager;

@Controller
@RequestMapping(value = "/notice/")
public class NoticeController {
	@Autowired
	@Qualifier("noticeDao")
	private NoticeDao noticeDao;

	@Autowired
	@Qualifier(value = "noticeService")
	private NoticeService noticeService;

	// Gson 광역선언
	@RequestMapping(value = "noticeList.action", method = RequestMethod.GET, produces = "application/json;charset=utf-8")
	public ModelAndView NoticeList(HttpSession session, HttpServletRequest req) {		
		
		int currentPage = 1;
		int pageSize = 10;
		int dataCount = 0;
		int pagerSize = 10;
		
		String page = req.getParameter("pageno");

		String url = "noticeList.action";

		if (page != null && page.length() > 0) {
			currentPage = Integer.parseInt(page);
		}
		
		int startRow = (currentPage - 1) * pageSize + 1;
		
		List<Notice> notices = noticeService.SearchNoticeList(startRow, startRow + pageSize);
		
		dataCount = noticeDao.SelectNoticeCount();
		ThePager pager = new ThePager(dataCount, currentPage, pageSize, pagerSize, url);
		
		ModelAndView mav = new ModelAndView();	
		
		mav.setViewName("notice/list");
		mav.addObject("notices", notices);
		mav.addObject("pageno", currentPage);
		mav.addObject("pager", pager);
		
		return mav;	
		
	}
	
	@RequestMapping(value = "detail.action", method = RequestMethod.GET, produces = "application/json;charset=utf-8")
	public ModelAndView NoticeList(int nNo) {		
		ModelAndView mav = new ModelAndView();
		
		Notice notice = noticeService.SearchNoticeDetail(nNo);
		
		mav.setViewName("notice/detail");
		mav.addObject("notice", notice);
		
		
		
		return mav;	
		
	}
	
	
	@RequestMapping(value = "insertNotice.action", method = RequestMethod.GET, produces = "application/json;charset=utf-8")
	
	public String AddNotice() {			
		
		
		return "notice/writeform";
		
		
		
	}
	
	@RequestMapping(value = "insertNotice.action", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
	
	public String AddNotice(Notice notice) {	
		
		noticeService.AddNotice(notice);
		
		return "redirect:/notice/noticeList.action";
		
		
		
	}
	
	@RequestMapping(value = "deletenotice.action", method = RequestMethod.GET, produces = "application/json;charset=utf-8")
	
	public String DeleteNotice(int nNo) {
		Notice notice = new Notice();
		
		notice.setTitle("삭제");
		notice.setContent("삭제된 공지사항");
		notice.setnNo(nNo);		
		
		noticeService.DeleteNotice(notice);
		
		return "redirect:/notice/noticeList.action";
		
	}
	
	@RequestMapping(value = "update.action", method = RequestMethod.GET, produces = "application/json;charset=utf-8")
	public ModelAndView ChangeNotice(int nNo) {		
		ModelAndView mav = new ModelAndView();
		
		Notice notice = noticeService.SearchNoticeDetail(nNo);
		
		mav.setViewName("notice/editform");
		mav.addObject("notice", notice);
		
		
		
		return mav;	
		
	}
	
	@RequestMapping(value = "update.action", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
	
	public String ChangeNotice(Notice notice) {
		
		noticeService.ChangeNotice(notice);
		
		return "redirect:/notice/noticeList.action";
		
	}
	

}
