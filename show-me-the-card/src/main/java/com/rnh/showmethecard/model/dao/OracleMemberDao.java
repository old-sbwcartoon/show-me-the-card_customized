package com.rnh.showmethecard.model.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.rnh.showmethecard.model.dto.Member;
import com.rnh.showmethecard.model.mapper.MemberMapper;

@Repository(value = "memberDao")
public class OracleMemberDao implements MemberDao {
	
	@Autowired
	@Qualifier("memberMapper")
	private MemberMapper memberMapper;	

	@Override
	public void insertMember(Member member) {
		memberMapper.insertMember(member);
		
	}

	@Override
	public Member selectMemberById(String mId) {
		Member member = memberMapper.selectMemberById(mId);
		return member;
	}

	@Override
	public Member selectMemberByIdAndPasswd(String mId, String password) {
		Member member = memberMapper.selectMemberByIdAndPasswd(mId, password);
		return member;
	}

}









