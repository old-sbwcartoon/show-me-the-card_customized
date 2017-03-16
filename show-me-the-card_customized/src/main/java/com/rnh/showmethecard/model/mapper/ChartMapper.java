package com.rnh.showmethecard.model.mapper;

import java.util.List;

import com.rnh.showmethecard.model.dto.Card;
import com.rnh.showmethecard.model.dto.Member;

public interface ChartMapper {
	
	List<Member> dayChart();
	
	List<Member> weekChart();
	
	List<Member> monthChart();
	
	List<Member> totalChart();
	
	List<Card> dayCard();
	
	List<Card> weekCard();
	
	List<Card> monthCard();
	
	List<Card> totalCard();
	
}
