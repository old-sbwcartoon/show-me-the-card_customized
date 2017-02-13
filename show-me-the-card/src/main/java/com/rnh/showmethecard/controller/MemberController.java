package com.rnh.showmethecard.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.rnh.showmethecard.model.dao.MemberDao;

@Controller
@RequestMapping(value = "/member")
public class MemberController {
	
	@Autowired
	@Qualifier("memberDao")
	private MemberDao dao;
	public void setDao(MemberDao dao) {
		this.dao = dao;
	}

	@RequestMapping(value="register.action", method=RequestMethod.GET)
	public String registerForm() {
		return "member/registerform";
	}
	
	//회원가입
	@RequestMapping(value="register.action", method=RequestMethod.POST)
	public String register() {
		return "redirect:/home.action";
	}
	
	//아이디 중복 확인
	@RequestMapping(value="confirmId.action", method = RequestMethod.POST,  produces = "application/json;charset=utf-8")
	@ResponseBody
	public String confirmId(String mId) {
		//String memberId = dao.selectIdById(mId);
		//if (memberId == null) {
		//	return "success";
		//} else {
			return "fail";
		//}
	}
		
}









