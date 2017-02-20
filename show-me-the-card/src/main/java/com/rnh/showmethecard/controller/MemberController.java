package com.rnh.showmethecard.controller;

import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.PrintWriter;
import java.util.List;

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
import com.rnh.showmethecard.model.dto.MemberHistory;
import com.rnh.showmethecard.model.dto.Qna;
import com.rnh.showmethecard.model.service.MemberService;
import com.rnh.showmethecard.ui.SpriteImage;

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
		String result = memberService.getMemberBymId(mId, password, session);
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
	
	@RequestMapping(value="updateMember.action", method = RequestMethod.POST)
	public void updateMember(Member member, HttpServletResponse resp) {
		memberService.chageMember(member);
		System.out.println("member update 성공");
		try {
			resp.setContentType("text/html; charset=utf-8");
			PrintWriter out = resp.getWriter();
			out.println("<script>alert('수정되었습니다.');history.go(-2);</script>");
			out.flush();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
	
	@RequestMapping(value="deleteMember.action", method = RequestMethod.GET)
	public void deleteMember(HttpSession session, HttpServletResponse resp) {
		Member member = (Member) session.getAttribute("loginuser");
		String mId = member.getmId();
		memberService.deleteMember(mId);
		System.out.println("member delete");
		try {
			resp.setContentType("text/html; charset=utf-8");
			PrintWriter out = resp.getWriter();
			out.println("<script>alert('탈퇴되었습니다.');window.location.href='/showmethecard/account/logout.action';</script>");
			out.flush();
		} catch (Exception ex) {
			ex.printStackTrace();
		}		
	}
	
	@RequestMapping(value="list.action", method=RequestMethod.GET)
	public String memberList(HttpSession session) {
		List<Member> members = memberService.getMemberList();
		session.setAttribute("members", members);
		return "member/adminPage";
	}
	
	@RequestMapping(value="pointList.action", method=RequestMethod.GET)
	public String PointList(HttpSession session) {
		Member member = (Member) session.getAttribute("loginuser");
		String mId = member.getmId();
		List<MemberHistory> history = memberService.getPointHistory(mId);
		session.setAttribute("history", history);
		return "member/pointPage";
	}
	
	@RequestMapping(value="memberLevel.action", method=RequestMethod.POST)
	@ResponseBody
	public int memberLevel(int mPoint) {
		int level = 0;
		for (int i = 0; i < 100; i++) {
			if ( 50*i*(i+1) < mPoint && mPoint < 50*(i+1)*(i+2)) {
				level = (i+1);
			}
		}
		return level;
	}
	
	@RequestMapping(value="qnaList.action", method=RequestMethod.GET)
	public String qnaList(HttpSession session) {
		Member member = (Member) session.getAttribute("loginuser");
		List<Qna> qna = memberService.getQnaList(member.getmId());
		
		session.setAttribute("Qna", qna);
		return "member/QNAPage";
	}
	
	
	
		
}









