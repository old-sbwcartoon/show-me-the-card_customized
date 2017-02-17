package com.rnh.showmethecard.controller;

import java.net.URL;

import javax.servlet.http.HttpSession;
import javax.swing.text.View;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.rnh.showmethecard.card.classes.CheckUrlStatus;
import com.rnh.showmethecard.model.dao.CardDao;
import com.rnh.showmethecard.model.dto.CardBasicInfo;
import com.rnh.showmethecard.model.dto.Member;
import com.rnh.showmethecard.webscraping.HtmlParser;

@Controller
@RequestMapping(value = "/card")
public class CardController {
	
	@Autowired
	@Qualifier("cardDao")
	private CardDao dao;
	public void setDao(CardDao dao) {
		this.dao = dao;
	}
	
	Gson gson = new Gson();
	
	

	@RequestMapping(value="cardregister.action", method=RequestMethod.GET)
	public String cardRegisterForm() {
		System.out.println("들어는 왔구만");
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
		System.out.println(url);
		Member member = (Member) session.getAttribute("loginuser");
		String mId = member.getmId();
		
		HtmlParser h = new HtmlParser(url);
		
		CardBasicInfo cInfo = new CardBasicInfo();
		
		if (true) {
			model.addAttribute("url", h.getUrl());
			model.addAttribute("title", h.getTitle());
			model.addAttribute("desc", h.getDesc());
			model.addAttribute("img", h.getImg());
			return "card/card";
		} else{
//		String strJson = gson.toJson(cInfo);
//		System.out.println(strJson);
		
////	mav.setView("card");
//		mav.addObject("CardBasicInfo", cInfo);
//		System.out.println(mId);
		
		return "틀렸어!";
		}
		
	}
//	
//	//회원가입
//	@RequestMapping(value="register.action", method=RequestMethod.POST)
//	public String register() {
//		return "redirect:/home.action";
//	}
//	
//	//아이디 중복 확인
//	@RequestMapping(value="confirmId.action", method = RequestMethod.POST,  produces = "application/json;charset=utf-8")
//	@ResponseBody
//	public String confirmId(String mId) {
//		//String memberId = dao.selectIdById(mId);
//		//if (memberId == null) {
//		//	return "success";
//		//} else {
//			return "fail";
//		//}
//	}
		
}









