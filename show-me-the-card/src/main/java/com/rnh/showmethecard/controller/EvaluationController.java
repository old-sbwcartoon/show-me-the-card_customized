package com.rnh.showmethecard.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.rnh.showmethecard.model.dto.Card;
import com.rnh.showmethecard.model.dto.EvaluationComment;
import com.rnh.showmethecard.model.dto.EvaluationRating;
import com.rnh.showmethecard.model.dto.Member;
import com.rnh.showmethecard.model.service.EvaluationService;
import com.rnh.showmethecard.webscraping.HtmlParser;

@Controller
@RequestMapping(value="/evaluation")
public class EvaluationController {

	//test code
	@Autowired
	@Qualifier("evaluationService")
	private EvaluationService service;
	
	@RequestMapping(value="/evaluationmain.action", method=RequestMethod.GET)
	public String showEvaluation(Model model) {
		String url = "http://j07051.tistory.com/333";
		HtmlParser h = new HtmlParser(url);

		model.addAttribute("url", h.getUrl());
		model.addAttribute("title", h.getTitle());
		model.addAttribute("desc", h.getDesc());
		model.addAttribute("img", h.getImg());
		
		EvaluationComment ec = new EvaluationComment();
		model.addAttribute("evaluationComment", ec.geteCommentNo());
				
		// 전체 Point, 최초 등록일
		Card c = new Card();
		model.addAttribute("cPoint", c.getcPoint());
		model.addAttribute("regDate", c.getRegDate());
		
		// 전체 스크랩 수 // evaluation? my_card 합
		// model.addAttribute("scrapCount", e.getScrapCount());
		// model.addAttribute("", );
		
		//MyCard myc = new MyCard();
		
		// 별점 평균
		// Evaluation e = new Evaluation();
		model.addAttribute("evallist", service.showEvaluationRatingList(2));
		
		return "evaluation/evaluationmain";
	}
	
	//합치기
	@RequestMapping(value="addevalrating.action", method=RequestMethod.GET)
	public void addEvaluationRating(int cardNo, HttpServletRequest req, String content, int eRating) {
		Member member = (Member)req.getSession().getAttribute("loginuser");
		
		service.addEvaluationRating(2, member.getmId(), content, eRating);
	}

	
	@RequestMapping(value="addevalcomment.action", method=RequestMethod.GET)
	public void addEvaluationComment(int cardNo, HttpServletRequest req, String content) {
		Member member = (Member)req.getSession().getAttribute("loginuser");
		
		service.addEvaluationComment(2, member.getmId(), content);
	}
	
	
	@RequestMapping(value="addevalratingliked.action", method=RequestMethod.GET)
	public void addEvaluationRatingLiked(int cardNo, String mId, HttpServletRequest req) {
		Member member = (Member)req.getSession().getAttribute("loginuser");
		//mId != member.getmId()일 때 씀
		service.addEvaluationRatingLiked(2, mId, member.getmId());
	}
	
	
	
	
	
	
	
	@RequestMapping(value="showevalratinglist.action", method=RequestMethod.GET)
	public ModelAndView showEvaluationRatingList(int cardNo) {
		List<EvaluationRating> evalRatingList = service.showEvaluationRatingList(2);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("evaluation/evaluationmain");
		mav.addObject("evalRatingList", evalRatingList);
		
		return mav;
	}
	
}
