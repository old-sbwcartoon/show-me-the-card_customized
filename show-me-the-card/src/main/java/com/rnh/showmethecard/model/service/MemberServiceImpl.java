package com.rnh.showmethecard.model.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.rnh.showmethecard.common.Literal;
import com.rnh.showmethecard.common.Util;
import com.rnh.showmethecard.model.dao.MemberDao;
import com.rnh.showmethecard.model.dto.Member;
import com.rnh.showmethecard.model.dto.MemberHistory;
import com.rnh.showmethecard.model.dto.Qna;

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

	@Override
	public List<MemberHistory> getPointHistory(String mId) {
		List<MemberHistory> history =  dao.selectPointHistory(mId);
		return history;
	}
	
	@Override
	public List<Qna> getQnaList(String mId) {
		List<Qna> qna = dao.selectQnaList(mId);
		return qna;
	}

/*	@Override
	public void updateMemberPointAndLevel(String content, int point, Member member) {
		MemberHistory history = new MemberHistory();
		history.setmId(member.getmId());
		history.setContent(content);
		history.setPoint(point);
		
		
		//point insert
		boolean result = dao.selectPointExits(history.getmId(), history.getContent());
		if ( !result ) {
			//없으면 insert
			dao.insertPointHistory(history);
		} else {
			//있으면 update
			dao.updatePointHistory(history.getmId(), history.getContent());
		}
		
		//전제 포인트 update
		dao.updateMemberPoint(member.getmId());
		
		member = dao.selectMemberById(member.getmId());
		System.out.println(member.getmPoint());
		//level 계산
		int mLevel = 0;
		for (int i = 0; i < 100; i++) {
			if ( 50*i*(i+1) <= member.getmPoint() && member.getmPoint() < 50*(i+1)*(i+2)) {
				mLevel = (i+1);
			} else if (member.getmPoint() >= 50*100*101) {
				mLevel = 100;
			}
		}
		
		//level update
		dao.updateMemberLevel(member.getmId(), mLevel);
				
	}*/
	
	@Override
	public Member getMemberBymId(String mId) {
		Member member = dao.selectMemberById(mId);
		return member;
	}
	
	@Override 
	public void updateMemberPointAndLevel(String content, Member member) {
		MemberHistory history = new MemberHistory();
		history.setmId(member.getmId());
		history.setContent(content);
		history.setPoint(Literal.Content.Member.getPoint(content));
		
		
		//point insert
		boolean result = dao.selectPointExits(history.getmId(), history.getContent());
		if ( !result ) {
			//없으면 insert
			dao.insertPointHistory(history);
		} else {
			//있으면 update
			dao.updatePointHistory(history.getmId(), history.getContent());
		}
		
		//전제 포인트 update
		dao.updateMemberPoint(member.getmId());
		
		int mLevel = 0;
	for (int i = 0; i < 100; i++) {
		if ( 50*i*(i+1) <= member.getmPoint() && member.getmPoint() < 50*(i+1)*(i+2)) {
			mLevel = (i+1);
		} else if (member.getmPoint() >= 50*100*101) {
			mLevel = 100;
		}
	}
		
		//level update
		dao.updateMemberLevel(member.getmId(), mLevel);
	}
	
	
	

}
