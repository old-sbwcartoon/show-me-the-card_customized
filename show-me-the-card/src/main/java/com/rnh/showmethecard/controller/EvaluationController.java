package com.rnh.showmethecard.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.rnh.showmethecard.model.dto.Card;
import com.rnh.showmethecard.model.dto.EvaluationComment;
import com.rnh.showmethecard.model.dto.EvaluationInfo;
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
		String url = "http://demo.themewagon.com/preview/best-free-multipurpose-bootstrap-corporate-business-template-frontend";
		HtmlParser h = new HtmlParser(url);

		model.addAttribute("url", h.getUrl());
		model.addAttribute("title", h.getTitle());
		model.addAttribute("desc", h.getDesc());
		model.addAttribute("img", h.getImg());
		
		EvaluationComment ec = new EvaluationComment();
		model.addAttribute("evaluationComment", ec.geteCommentNo());
		
		EvaluationInfo ei = new EvaluationInfo();
		model.addAttribute("evaluationInfo", ei.geteRating());
		
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
		
		
		return "evaluation/evaluationmain";
	}
	
	@RequestMapping(value="evaluationsend.action", method=RequestMethod.GET)
	public void evaluationSend(ModelAndView evaluationForm) {
		service.addEval(evaluationForm);
	}
	
}
