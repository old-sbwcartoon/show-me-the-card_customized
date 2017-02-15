package com.rnh.showmethecard.model.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.rnh.showmethecard.common.Util;
import com.rnh.showmethecard.model.dao.MemberDao;
import com.rnh.showmethecard.model.dto.Member;

@Service("memberService")
public class MemberServiceImpl implements MemberService {

	@Autowired
	@Qualifier("memberDao")
	private MemberDao dao;

	@Override
	public void registerMember(Member member) {
		member.setPassword(Util.getHashedString(member.getPassword(), "SHA-256"));
		dao.insertMember(member);
	}

	@Override
	public String getMemberResultBymId(String mId) {
		Member member = dao.selectMemberById(mId);
		if (member == null) {
			return "success";
		} else {
			return "fail";
		}
	}

	@Override
	public Member getMemberBymIdAndPassword(String mId, String password) {
		password = Util.getHashedString(password, "SHA-256");
		Member member = dao.selectMemberByIdAndPasswd(mId, password);
		return member;
	}

	@Override
	public String getMemberBymId(String mId, String password, HttpSession session) {
		Member member = dao.selectMemberById(mId);
		session.setAttribute("loginuser", member);
		
		String passwd = member.getPassword();
		String confirmPasswd = Util.getHashedString(password, "SHA-256");
		
		if (passwd.equals(confirmPasswd)) {
			return "member/updateform";
		} else {
			return "fail";
		}
	}

	@Override
	public void chageMember(Member member) {
		member.setPassword(Util.getHashedString(member.getPassword(), "SHA-256"));
		dao.updateMemberById(member);
	}

	@Override
	public void deleteMember(String mId) {
		dao.deleteMemberById(mId);		
	}

	@Override
	public List<Member> getMemberList() {
		List<Member> members = dao.selectMemberList();
		return members;
	}
	
	
	

}
