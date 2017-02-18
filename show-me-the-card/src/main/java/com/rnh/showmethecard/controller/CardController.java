package com.rnh.showmethecard.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.google.gson.Gson;
import com.rnh.showmethecard.model.dao.CardDao;
import com.rnh.showmethecard.model.dto.CardBasicInfo;
import com.rnh.showmethecard.model.dto.Member;
import com.rnh.showmethecard.model.service.CardService;
import com.rnh.showmethecard.webscraping.HtmlParser;

@Controller
@RequestMapping(value = "/card")
public class CardController {
	
//	@Autowired
//	@Qualifier("cardDao")
//	private CardDao dao;
//	public void setDao(CardDao dao) {
//		this.dao = dao;
//	}
	@Autowired
	@Qualifier("cardService")
	private CardService cardService;
	
	private int cardNo;
	
	Member member;
	String mId;
	
	Gson gson = new Gson();
	
	

	@RequestMapping(value="cardregister.action", method=RequestMethod.GET)
	public String cardRegisterForm() {
		return "card/cardregisterform";
	}
	
	@RequestMapping(value="card.action", method=RequestMethod.GET)
	public String card() {
		return "card/card";
	}
	@RequestMapping(value="checkurl.action", method = RequestMethod.GET,  produces = "application/json;charset=utf-8")
	public String checkandshowcard(Model model, HttpSession session, String url) {
		//URL javaUrl = url;
//		ModelAndView mav = new ModelAndView("/WEB-INF/view/card/card.jsp");
//		//mav.
		
		member = (Member) session.getAttribute("loginuser");
		mId = member.getmId();
		
		HtmlParser h = new HtmlParser(url);
		
		//CardBasicInfo cInfo = new CardBasicInfo();
		
		int cardNo = cardService.checkCardDb(h.getUrl());
		System.out.println(cardNo);
		
		
		if (h.isUrlOk()) {
			model.addAttribute("url", h.getUrl());
			model.addAttribute("title", h.getTitle());
			model.addAttribute("desc", h.getDesc());
			model.addAttribute("img", h.getImg());
			model.addAttribute("resultCheck", "fine");
			model.addAttribute("cardNo", cardNo);
			if(cardNo==0 && h.isUrlOk() == true){
				model.addAttribute("oldAndNew", "new");
			}else{model.addAttribute("oldAndNew", "old");}
			return "card/card";
		} else{
//		String strJson = gson.toJson(cInfo);
//		System.out.println(strJson);
		
////	mav.setView("card");
//		mav.addObject("CardBasicInfo", cInfo);
//		System.out.println(mId);
			model.addAttribute("resultCheck", "bad");
		return "틀렸어!";
		}
		
	}
	
	@RequestMapping(value="cardregisterfin.action", method=RequestMethod.POST)
	public String cardRegisterfinal(HttpSession session,  @RequestBody String stringJson) {
		System.out.println("들어는 왔구만");
		System.out.println(stringJson);
		//adviceNote = gson.fromJson(stringJson, AdviceNote.class);
		return "redirect:/card/cardregisterform";
	}
		
}









