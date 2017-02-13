package com.rnh.showmethecard.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.rnh.showmethecard.model.dao.MemberDao;

@Controller
@RequestMapping(value = "/account")
public class AccountController {
	
	@Autowired
	@Qualifier("memberDao")
	private MemberDao dao;
	public void setMemberDao(MemberDao memberDao) {
		this.dao = memberDao;
	}
	
	@RequestMapping(value="login.action", method=RequestMethod.GET)
	public String loginForm() {
		return "account/loginform";
	}
	
	@RequestMapping(value="login.action", method=RequestMethod.POST)
	public String login() {
		return "redirect:/home.action";
	}
}









