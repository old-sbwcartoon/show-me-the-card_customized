package com.rnh.showmethecard.model.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.rnh.showmethecard.model.dto.Card;
import com.rnh.showmethecard.model.dto.Member;
import com.rnh.showmethecard.model.mapper.ChartMapper;

@Repository(value = "chartDao")
public class MysqlChartDao implements ChartDao {
	
	@Autowired
	@Qualifier("chartMapper")
	private ChartMapper chartMapper;
	
	@Override
	public List<Member> selectDayChart() {
		List<Member> day = chartMapper.dayChart();
		return day;
	}

	@Override
	public List<Member> selectWeekChart() {
		List<Member> week = chartMapper.weekChart();
		return week;
	}

	@Override
	public List<Member> selectMonthChart() {
		List<Member> month = chartMapper.monthChart();
		return month;
	}

	@Override
	public List<Member> selectTotalChart() {
		List<Member> total = chartMapper.totalChart();
		return total;
	}

	@Override
	public List<Card> selectDayCard() {
		List<Card> day = chartMapper.dayCard();
		return day;
	}

	@Override
	public List<Card> selectWeekCard() {
		List<Card> week = chartMapper.weekCard();
		return week;
	}

	@Override
	public List<Card> selectMonthCard() {
		List<Card> month = chartMapper.monthCard();
		return month;
	}

	@Override
	public List<Card> selectTotalCard() {
		List<Card> total = chartMapper.totalCard();
		return total;
	}
	
	

}









