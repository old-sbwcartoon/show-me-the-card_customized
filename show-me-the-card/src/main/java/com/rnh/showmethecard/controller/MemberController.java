package com.rnh.showmethecard.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.rnh.showmethecard.common.Util;
import com.rnh.showmethecard.model.dao.MemberDao;
import com.rnh.showmethecard.model.dto.Member;
import com.rnh.showmethecard.model.service.MemberService;

@Controller
@RequestMapping(value = "/member")
public class MemberController {
	
	@Autowired
	@Qualifier("memberDao")
	private MemberDao dao;
	public void setDao(MemberDao dao) {
		this.dao = dao;
	}
	
	@Autowired
	@Qualifier("memberService")
	private MemberService memberService;

	//회원가입
	@RequestMapping(value="register.action", method=RequestMethod.POST)
	public String register(Member member) {
		memberService.registerMember(member);
		return "redirect:/home.action";
	}
	
	//아이디 중복 확인
	@RequestMapping(value="confirmId.action", method = RequestMethod.POST,  produces = "application/json;charset=utf-8")
	@ResponseBody
	public String confirmId(String mId) {		
		String result = memberService.getMemberResultBymId(mId);
		return result;
	}
	
	@RequestMapping(value="mypage.action", method = RequestMethod.POST)
	public String confirmPassword(String password, HttpSession session, HttpServletResponse resp) {
		Member member = (Member) session.getAttribute("loginuser");
		
		String mId = member.getmId();
		String result = memberService.getMemberBymId(mId, password);
		if (result.equals("fail")) {
			try {
				resp.setContentType("text/html; charset=utf-8");
				PrintWriter out = resp.getWriter();
				out.println("<script>alert('비밀번호를 확인해주세요.');history.go(-1);</script>");
				out.flush();
			} catch (Exception ex) {
				ex.printStackTrace();
			}
			return "home";
		} else {
			return result;
		}
	}
	
	@RequestMapping(value="update.action", method = RequestMethod.POST)
	public String updateMember(Member member, HttpServletResponse resp) {
		memberService.chageMember(member);
		System.out.println("member update 성공");
		try {
			resp.setContentType("text/html; charset=utf-8");
			PrintWriter out = resp.getWriter();
			out.println("<script>alert('수정되었습니다.');history.go(-1);</script>");
			out.flush();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return "redirect:/home.action";
	}
	
	@RequestMapping(value="deleteMember.action", method = RequestMethod.GET)
	public String deleteMember(String mId, HttpServletResponse resp) {
		memberService.deleteMember(mId);
		try {
			resp.setContentType("text/html; charset=utf-8");
			PrintWriter out = resp.getWriter();
			out.println("<script>alert('탈퇴되었습니다.');history.go(-1);</script>");
			out.flush();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return "redirect:/home.action";
	}
	
		
}









