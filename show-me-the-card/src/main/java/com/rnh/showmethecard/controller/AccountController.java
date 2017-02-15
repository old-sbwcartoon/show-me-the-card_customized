package com.rnh.showmethecard.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.rnh.showmethecard.common.Util;
import com.rnh.showmethecard.model.dao.MemberDao;
import com.rnh.showmethecard.model.dto.Member;
import com.rnh.showmethecard.model.service.MemberService;

@Controller
@RequestMapping(value = "/account")
public class AccountController {
	
	@Autowired
	@Qualifier("memberDao")
	private MemberDao dao;
	public void setMemberDao(MemberDao memberDao) {
		this.dao = memberDao;
	}
	
	@Autowired
	@Qualifier("memberService")
	private MemberService memberService;
		
	@RequestMapping(value="login.action", method=RequestMethod.POST)
	public String login(String mId, String password, HttpSession session, HttpServletResponse resp) {
		
		Member member = memberService.getMemberBymIdAndPassword(mId, password);
		
		if (member != null) {
			session.setAttribute("loginuser", member);
			return "redirect:/home.action";
		} else {
			//로그인 실패 alert
			try {
				resp.setContentType("text/html; charset=utf-8");
				PrintWriter out = resp.getWriter();
				out.println("<script>alert('아이디와 비밀번호를 확인해주세요.');history.go(-1);</script>");
				out.flush();	
			} catch (Exception ex) {
				ex.printStackTrace();
			}
			return "home";
		}
		
	}
	
	@RequestMapping(value="logout.action", method=RequestMethod.GET)
	public String logout(HttpSession session) {
		session.removeAttribute("loginuser");
		return "redirect:/home.action";
	}
	
}









