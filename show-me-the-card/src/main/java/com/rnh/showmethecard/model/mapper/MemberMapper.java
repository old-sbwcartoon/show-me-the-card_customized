package com.rnh.showmethecard.model.mapper;

import java.util.HashMap;

import com.rnh.showmethecard.model.dto.Member;

//com.mvcdemoweb.model.mapper.MemberMapper 파일에 대응하는 인터페이스
public interface MemberMapper {
	
	void insertMember(Member member);
	
	Member selectMemberById(String mId);
	
	Member selectMemberByIdAndPasswd(HashMap<String, Object> params);
}
