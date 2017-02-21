package com.rnh.showmethecard.common;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.rnh.showmethecard.model.dto.Member;
import com.rnh.showmethecard.model.service.MemberService;

@Service("point")
public class Point {
	
	@Autowired
	@Qualifier("memberService")
	private MemberService memberService;

	public Member updateMemberPointAndLevel(String content, Member member) { 
		memberService.updateMemberPointAndLevel(content, member);
		member = memberService.getMemberBymId(member.getmId());
		return member;
	}
}
