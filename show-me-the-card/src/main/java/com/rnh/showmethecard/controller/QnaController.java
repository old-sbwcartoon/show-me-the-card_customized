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
import com.rnh.showmethecard.model.dto.Member;
import com.rnh.showmethecard.model.dto.Qna;
import com.rnh.showmethecard.model.service.QnaService;

@Controller
@RequestMapping(value = "/qna/")
public class QnaController {
	@Autowired
	@Qualifier("memberDao")
	private MemberDao memberDao;

	@Autowired
	@Qualifier(value = "qnaService")
	private QnaService qnaService;

	// Gson 광역선언
	private Gson gson = new Gson();

	@RequestMapping(value = "qnaList.action", method = RequestMethod.GET, produces = "application/json;charset=utf-8")
	public ModelAndView QnaList(HttpSession session) {		
		ModelAndView mav = new ModelAndView();
				
		List<Qna> qnas = qnaService.SearchQnaList();
		
		mav.setViewName("qna/list");
		mav.addObject("qnas", qnas);
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
	public String InsertReply() {
		
		return "qna/replyform";
	}
	
	@RequestMapping(value = "reply.action", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
	public String InsertReply(HttpServletRequest req) {

		Member member = 
				(Member)req.getSession().getAttribute("loginuser");

		Qna qna = new Qna();
		
		qna.setqNo(Integer.parseInt(req.getParameter("qNo")));
		qna.setTitle(req.getParameter("title"));
		qna.setmId(member.getmId());
		qna.setContent(req.getParameter("content"));
				
		qnaService.InsertReply(qna);
				
		return "redirect:/qna/qnaList.action";
	}
	

}
