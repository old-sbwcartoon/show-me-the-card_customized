package com.rnh.showmethecard.model.dao;

import java.util.List;

import com.rnh.showmethecard.model.dto.Card;
import com.rnh.showmethecard.model.dto.Member;

public interface ChartDao {
	
	List<Member> selectDayChart();
	
	List<Member> selectWeekChart();
	
	List<Member> selectMonthChart();
	
	List<Member> selectTotalChart();
	
	List<Card> selectDayCard();
	
	List<Card> selectWeekCard();
	
	List<Card> selectMonthCard();
	
	List<Card> selectTotalCard();

}