package com.rnh.showmethecard.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.rnh.showmethecard.model.dao.CardDao;

@Controller
@RequestMapping(value = "/card")
public class CardController {
	
	@Autowired
	@Qualifier("cardDao")
	private CardDao dao;
	public void setDao(CardDao dao) {
		this.dao = dao;
	}

	@RequestMapping(value="cardregister.action", method=RequestMethod.GET)
	public String cardRegisterForm() {
		return "card/cardregisterform";
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









