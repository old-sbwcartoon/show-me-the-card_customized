package com.rnh.showmethecard.model.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.rnh.showmethecard.model.dto.Member;
import com.rnh.showmethecard.model.dto.MemberHistory;
import com.rnh.showmethecard.model.dto.Qna;
import com.rnh.showmethecard.model.mapper.MemberMapper;

@Repository(value = "memberDao")
public class MysqlMemberDao implements MemberDao {
	
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
		HashMap<String, Object> params = new HashMap<>();
		params.put("mId", mId);
		params.put("password", password);
		
		Member member = memberMapper.selectMemberByIdAndPasswd(params);
		return member;
	}

	@Override
	public void updateMemberById(Member member) {
		memberMapper.updateMemberById(member);	
	}

	@Override
	public void deleteMemberById(String mId) {
		memberMapper.deleteMemberById(mId);		
	}

	@Override
	public List<Member> selectMemberList() {
		List<Member> members = memberMapper.selectMembers();
		return members;
	}

	@Override
	public List<MemberHistory> selectPointHistory(String mId) {
		List <MemberHistory> history = memberMapper.selectPointHistory(mId);
		return history;
	}

	@Override
	public boolean selectPointExits(String mId, String content) {
		HashMap<String, Object> params = new HashMap<>();
		params.put("mId", mId);
		params.put("content", content);
		
		boolean result = memberMapper.selectPointExist(params);
		return result;
	}

	@Override
	public void updatePointHistory(String mId, String content) {
		HashMap<String, Object> params = new HashMap<>();
		params.put("mId", mId);
		params.put("content", content);
		
		memberMapper.updatePointHistory(params);
	}

	@Override
	public void insertPointHistory(MemberHistory history) {
		memberMapper.insertPointHistory(history);		
	}

	@Override
	public void updateMemberPoint(String mId) {
		memberMapper.updateMemberPoint(mId);
	}
	
	@Override
	public void updateMemberLevel(String mId, int mLevel) {
		HashMap<String, Object> params = new HashMap<>();
		params.put("mId", mId);
		params.put("mLevel", mLevel);
		
		memberMapper.updateMemberLevel(params);
	}

	@Override
	public List<Qna> selectQnaList(String mId) {
		List <Qna> qnaList = memberMapper.selectQnalist(mId);
		return qnaList;
	}

}









