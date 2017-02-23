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

import com.google.gson.Gson;
import com.rnh.showmethecard.common.Literal;
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
	
	@RequestMapping(value={"/evaluationmain.action", "/", ""}, method=RequestMethod.GET)
	public String showEvaluation(Model model, HttpServletRequest req) { //////////////////////////////////cardNo
		Member member = (Member)req.getSession().getAttribute("loginuser");
		
		int cardNo = 2;
		
//		String url = "http://j07051.tistory.com/333";
		String url = "http://crosstheline.tistory.com/41";
//		String url = "https://www.odpia.org/main.odpia";
		HtmlParser h = new HtmlParser(url, Literal.ParseHtml.From.WEB);

		model.addAttribute("cardNo", cardNo);
		
		model.addAttribute("url", h.getUrl());
		model.addAttribute("title", h.getTitle());
		model.addAttribute("desc", h.getDesc());
		model.addAttribute("img", h.getImg());
		
		model.addAttribute("isEvalRating", service.confirmEvaluationRatingOfmId(cardNo, member.getmId()));//////////////////////////////////cardNo
		// 전체 Point, 최초 등록일
		Card c = new Card();
		model.addAttribute("cPoint", c.getcPoint());
		model.addAttribute("regDate", c.getRegDate());
		
		model.addAttribute("evalCommentList", service.showEvaluationCommentList(2));

		model.addAttribute("evalRatingList", showEvaluationRatingListWithPageNo(cardNo, req, 1));
		model.addAttribute("eRatingAvg", service.showEvaluationRatingAvg(cardNo));
		
		model.addAttribute("myRating", service.showEvaluationRatingBymId(cardNo, member.getmId()));
		
		return "evaluation/evaluationmain";
	}
	
	@RequestMapping(value="showevalrating.action", method=RequestMethod.POST)
	@ResponseBody
	public List<EvaluationRating> showEvaluationRatingListWithPageNo(int cardNo, HttpServletRequest req, int pageNo) {
		Member member = (Member)req.getSession().getAttribute("loginuser");		
		return service.showEvaluationRatingListWithPageNo(cardNo, member.getmId(), 1);
	}
	
	//합치기
	@RequestMapping(value="addevalrating.action", method=RequestMethod.POST, produces="application/json;charset=utf-8")
	@ResponseBody
	public String addEvaluationRating(int cardNo, HttpServletRequest req, String content, int eRating) {
		Member member = (Member)req.getSession().getAttribute("loginuser");		
		EvaluationRating newRating = service.addEvaluationRating(cardNo, member.getmId(), content, eRating);
		
		return new Gson().toJson(newRating);
	}

	
	@RequestMapping(value="addevalcomment.action", method=RequestMethod.POST)
	@ResponseBody
	public String addEvaluationComment(int cardNo, HttpServletRequest req, String content) {
		/////////////////////////////////// int cardNo
		Member member = (Member)req.getSession().getAttribute("loginuser");

		EvaluationComment newComment = new EvaluationComment();
		newComment.setCardNo(2);
		newComment.setContent(content);
		newComment.setmId(member.getmId());
		
		service.addEvaluationComment(newComment);
				
		return new Gson().toJson(newComment);
	}
	

	
	@RequestMapping(value="addevalratingliked.action", method=RequestMethod.POST)
	@ResponseBody
	public String addEvaluationRatingLiked(int eRatingNo, String mId, HttpServletRequest req) {
		Member member = (Member)req.getSession().getAttribute("loginuser");
		service.addEvaluationRatingLiked(eRatingNo, mId, member.getmId());
		return null;
	}
	
	
	
	
	
	
	@RequestMapping(value="delevalrating.action", method=RequestMethod.POST)
	@ResponseBody
	public String deleteEvaluationRating(int eRatingNo) {
		service.deleteEvaluationRatingByeRatingNo(eRatingNo);
		return null;
	}
	
	@RequestMapping(value="delevalcomment.action", method=RequestMethod.POST)
	@ResponseBody
	public String deleteEvaluationComment(int eCommentNo) {
		service.deleteEvaluationCommentByeCommentNo(eCommentNo);
		return null;
	}
	
	
}
