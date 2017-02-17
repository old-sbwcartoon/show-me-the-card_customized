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

import com.rnh.showmethecard.ui.ThePager;
import com.google.gson.reflect.TypeToken;
import com.rnh.showmethecard.model.dao.QnaDao;
import com.rnh.showmethecard.model.dto.Qna;
import com.rnh.showmethecard.model.service.QnaService;

@Controller
@RequestMapping(value = "/qna/")
public class QnaController {
	
	@Autowired
	@Qualifier("qnaDao")
	private QnaDao qnaDao;

	@Autowired
	@Qualifier(value = "qnaService")
	private QnaService qnaService;

	@RequestMapping(value = "qnaList.action", method = RequestMethod.GET, produces = "application/json;charset=utf-8")
	public ModelAndView QnaList(HttpSession session, HttpServletRequest req) {		
			
		int currentPage = 1;
		int pageSize = 10;
		int dataCount = 0;
		int pagerSize = 10;

		String page = req.getParameter("pageno");

		String url = "qnaList.action";

		if (page != null && page.length() > 0) {
			currentPage = Integer.parseInt(page);
		}
		
		int startRow = (currentPage - 1) * pageSize + 1;
		
		List<Qna> qnas = qnaService.SearchQnaList(startRow, startRow + pageSize);
		
		dataCount = qnaDao.SelectQnaCount();
		ThePager pager = new ThePager(dataCount, currentPage, pageSize, pagerSize, url);
				
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("qna/list");
		mav.addObject("qnas", qnas);
		mav.addObject("pageno", currentPage);
		mav.addObject("pager", pager);
		
		return mav;	
		
	}
	
	@RequestMapping(value = "detail.action", method = RequestMethod.GET, produces = "application/json;charset=utf-8")
	public ModelAndView QnaList(int qNo) {		
		ModelAndView mav = new ModelAndView();
		
		Qna qna = qnaService.SearchQnaDetail(qNo);
		
		mav.setViewName("qna/detail");
		mav.addObject("qna", qna);
		
		
		
		return mav;	
		
	}
	
	
	@RequestMapping(value = "insertQna.action", method = RequestMethod.GET, produces = "application/json;charset=utf-8")
	
	public String AddQna() {			
		
		
		return "qna/writeform";
		
		
		
	}
	
	@RequestMapping(value = "insertQna.action", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
	
	public String AddQna(Qna qna) {	
		
		qnaService.AddQna(qna);
		qnaService.UpdateQnaGroupNo(qna.getqNo());
		
		return "redirect:/qna/qnaList.action";
		
		
		
	}
	
	@RequestMapping(value = "deleteQna.action", method = RequestMethod.GET, produces = "application/json;charset=utf-8")
	
	public String DeleteQna(int qNo) {
		Qna qna = new Qna();
		
		qna.setTitle("삭제");
		qna.setContent("삭제된 글");
		qna.setqNo(qNo);		
		
		qnaService.DeleteQna(qna);
		
		return "redirect:/qna/qnaList.action";
		
	}
	
	@RequestMapping(value = "update.action", method = RequestMethod.GET, produces = "application/json;charset=utf-8")
	public ModelAndView ChangeQna(int qNo) {		
		ModelAndView mav = new ModelAndView();
		
		Qna qna = qnaService.SearchQnaDetail(qNo);
		
		mav.setViewName("qna/editform");
		mav.addObject("qna", qna);
		
		
		
		return mav;	
		
	}
	
	@RequestMapping(value = "update.action", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
	public String ChangeQna(Qna qna) {
		
		qnaService.ChangeQna(qna);
		
		return "redirect:/qna/qnaList.action";
		
	}
	
	
	@RequestMapping(value = "reply.action", method = RequestMethod.GET, produces = "application/json;charset=utf-8")
	public ModelAndView InsertReply(int qNo, HttpSession session) {		
		ModelAndView mav = new ModelAndView();
		
		Qna qna = qnaService.SelectQnaByQnaNo(qNo);
		
		mav.setViewName("qna/replyform");
		//mav.addObject("qna", qna);
		session.setAttribute("qna", qna);
				
		return mav;	
		
	}
	
	@RequestMapping(value = "reply.action", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
	public String InsertReply(Qna qna, HttpSession session) {
		Qna qna1 = (Qna)session.getAttribute("qna");
		qna.setGroupNo(qna1.getGroupNo());
		qna.setDepth(qna1.getDepth());
		qna.setStep(qna1.getStep());
		qnaService.InsertReply(qna);
		
		return "redirect:/qna/qnaList.action";
	}
	
	

}
