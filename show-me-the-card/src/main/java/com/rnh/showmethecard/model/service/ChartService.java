package com.rnh.showmethecard.model.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.rnh.showmethecard.model.dto.Card;
import com.rnh.showmethecard.model.dto.Member;
import com.rnh.showmethecard.model.dto.MemberHistory;
import com.rnh.showmethecard.model.dto.Qna;

public interface ChartService {
	
	List<Member> getDayChart();
	
	List<Member> getWeekChart();
	
	List<Member> getMonthChart();
	
	List<Member> getTotalChart();
	
	List<Card> getDayCard();
	
	List<Card> getWeekCard();
	
	List<Card> getMonthCard();
	
	List<Card> getTotalCard();
	
}
