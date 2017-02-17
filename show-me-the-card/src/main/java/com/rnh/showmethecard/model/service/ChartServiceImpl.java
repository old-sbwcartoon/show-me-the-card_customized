package com.rnh.showmethecard.model.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.rnh.showmethecard.common.Util;
import com.rnh.showmethecard.model.dao.ChartDao;
import com.rnh.showmethecard.model.dao.MemberDao;
import com.rnh.showmethecard.model.dto.Card;
import com.rnh.showmethecard.model.dto.Member;
import com.rnh.showmethecard.model.dto.MemberHistory;
import com.rnh.showmethecard.model.dto.Qna;

@Service("chartService")
public class ChartServiceImpl implements ChartService {

	@Autowired
	@Qualifier("chartDao")
	private ChartDao dao;
	
	@Override
	public List<Member> getDayChart() {
		List<Member> day = dao.selectDayChart();
		return day;
	}

	@Override
	public List<Member> getWeekChart() {
		List<Member> week = dao.selectWeekChart();
		return week;
	}

	@Override
	public List<Member> getMonthChart() {
		List<Member> month = dao.selectMonthChart();
		return month;
	}

	@Override
	public List<Member> getTotalChart() {
		List<Member> total = dao.selectTotalChart();
		return total;
	}

	@Override
	public List<Card> getDayCard() {
		List<Card> day = dao.selectDayCard();
		return day;
	}

	@Override
	public List<Card> getWeekCard() {
		List<Card> week = dao.selectWeekCard();
		return week;
	}

	@Override
	public List<Card> getMonthCard() {
		List<Card> month = dao.selectMonthCard();
		return month;
	}

	@Override
	public List<Card> getTotalCard() {
		List<Card> total = dao.selectTotalCard();
		return total;
	}
	
	

}
