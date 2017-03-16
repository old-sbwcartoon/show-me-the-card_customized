package com.rnh.showmethecard.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.rnh.showmethecard.common.Literal;
import com.rnh.showmethecard.model.dao.CardDao;
import com.rnh.showmethecard.model.dto.CardBasicInfo;
import com.rnh.showmethecard.model.dto.CardForInsert;
import com.rnh.showmethecard.model.dto.Member;
import com.rnh.showmethecard.model.dto.MyCardList;
import com.rnh.showmethecard.model.service.CardService;
import com.rnh.showmethecard.webscraping.HtmlParser;

@Controller
@RequestMapping(value = "/mypage")
public class CardController {
	
	@Autowired
	@Qualifier("cardService")
	private CardService cardService;
	
	private int cardNo;
	
	Member member;
	String mId;
	int afNo;
	
	Gson gson = new Gson();
	
	@RequestMapping(value="cardregister.action", method=RequestMethod.GET)
	public String cardRegisterForm(HttpSession session,Model model, String fNo, String pageOwner, HttpServletResponse response) {
		member = (Member) session.getAttribute("loginuser");
		mId = member.getmId();
		
		if (fNo == null) {
			return "card/cardregisterform";
		} else {
			afNo = Integer.parseInt(fNo);
			model.addAttribute("getFNo", fNo);
			model.addAttribute("pageOwner", pageOwner);
			model.addAttribute("mId", mId);
			return "card/cardregisterform";
		}
		
	}
	
	@RequestMapping(value="card.action", method=RequestMethod.GET)
	public String card() {
		return "card/card";
	}
	@RequestMapping(value="checkurl.action", method = RequestMethod.GET,  produces = "application/json;charset=utf-8")
	public String checkandshowcard(Model model, HttpSession session, String url) {
		HtmlParser h = new HtmlParser(url, Literal.ParseHtml.From.WEB);
		
		if (h.isUrlOk()) {
			cardNo = cardService.checkCardDb(h.getUrl());
			model.addAttribute("url", h.getUrl());
			model.addAttribute("title", h.getTitle());
			model.addAttribute("desc", h.getDesc());
			model.addAttribute("img", h.getImg());
			model.addAttribute("cardNo", cardNo);
			model.addAttribute("check", "fine");
			return "card/card";
		} else{
			model.addAttribute("check", "bad");
			System.out.println("잘못된주소");
		return "틀렸어!";
		}	
	}
	
	@RequestMapping(value="showmycardlist.action", method=RequestMethod.GET)
	public String ShowMYCardList(HttpSession session, HttpServletRequest req, int fNo, String pageOwner){
		member = (Member) session.getAttribute("loginuser");
		mId = member.getmId();
		List<MyCardList> myCardListList= cardService.readMyCard(fNo);
		for (int i = 0 ; i < myCardListList.size(); i ++){
			int tmp = myCardListList.get(i).getcLevel();
			int level = 1;
			switch (tmp){
				case 1 : level = 100; break;
				case 2 : level = 80; break;
				case 3 : level = 60; break;
				case 4 : level = 30; break;
				case 5 : level = 0; break;
			}
			myCardListList.get(i).setcLevel(level);
		}
		System.out.println(pageOwner);
		int listLength = myCardListList.size();
		
		Collections.reverse(myCardListList);
		req.setAttribute("mId", mId);
		req.setAttribute("pageOwner", pageOwner);
		req.setAttribute("mycardListList", myCardListList);
		return "card/mycardlist";
	}
	
	@RequestMapping(value="cardregisterfin.action", method=RequestMethod.POST)
	@ResponseBody
	public String cardRegisterfinal(HttpSession session,  @RequestBody String stringJson) {
		member = (Member) session.getAttribute("loginuser");
		mId = member.getmId();
		System.out.println(stringJson);
		CardForInsert cardForInsert;
		cardForInsert = gson.fromJson(stringJson, CardForInsert.class);
//		HtmlParser h = new HtmlParser(cardForInsert.getSiteUrl(), Literal.ParseHtml.From.WEB);
//		cardForInsert.setSiteUrl(h.getUrl());
		cardForInsert.setDiscoverer(mId);
//		cardForInsert.setImgSrc(h.getImg());
//		cardForInsert.setcName(h.getTitle());
//		cardForInsert.setUrlDesc(h.getDesc());
		
		cardService.insertMyCardOrCardDb(cardForInsert);
		return "입력 성공";
	}
	
	
	@RequestMapping(value="scrap.action", method=RequestMethod.GET)
	public String scrap(HttpSession session, HttpServletRequest req,int mycNo, String pageOwner){
		member = (Member) session.getAttribute("loginuser");
		mId = member.getmId();
//		System.out.println(pageOwner);
//		System.out.println(mycNo);
		if(mId == pageOwner){
			System.out.println("본인");
			return "";
		}else{
			System.out.println("타인");
			cardService.ScrapAction(mycNo, mId);
			
			return "redirect:/mypage/mypage.action?gold="+pageOwner;
		}
	}
	
	@RequestMapping(value="delmycard.action", method=RequestMethod.GET)
	public String delmycard(HttpSession session, HttpServletRequest req, int mycNo, String pageOwner){
		member = (Member) session.getAttribute("loginuser");
		mId = member.getmId();
//		System.out.println(pageOwner);
//		System.out.println(mycNo);
		if(mId == pageOwner){
			System.out.println("본인");
			return "";
		}else{
			System.out.println("타인");
			cardService.delMyCard(mycNo);
			return "redirect:/mypage/mypage.action?gold="+pageOwner;
		}
	}	
}









