package com.rnh.showmethecard.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.rnh.showmethecard.model.dto.Card;
import com.rnh.showmethecard.model.dto.Member;
import com.rnh.showmethecard.model.service.ChartService;

@Controller
@RequestMapping(value = "/chart")
public class ChartController {
	
	@Autowired
	@Qualifier("chartService")
	private ChartService chartService;
	
	@RequestMapping(value="dayChart.action", method=RequestMethod.GET)
	@ResponseBody
	public String dayChart() {
		List<Member> day = chartService.getDayChart();
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		String data = gson.toJson(day);
		
		return data;
	}
	
	@RequestMapping(value="weekChart.action", method=RequestMethod.GET)
	@ResponseBody
	public String weekChart() {
		List<Member> week = chartService.getWeekChart();
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		String data = gson.toJson(week);
		
		return data;
	}
	
	@RequestMapping(value="monthChart.action", method=RequestMethod.GET)
	@ResponseBody
	public String monthChart() {
		List<Member> month = chartService.getMonthChart();
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		String data = gson.toJson(month);
		
		return data;
	}
	
	@RequestMapping(value="dayCard.action", method=RequestMethod.GET)
	@ResponseBody
	public String dayCard() {
		List<Card> day = chartService.getDayCard();
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		String data = gson.toJson(day);
		
		return data;
	}
	
	@RequestMapping(value="weekCard.action", method=RequestMethod.GET)
	@ResponseBody
	public String weekCard() {
		List<Card> week = chartService.getWeekCard();
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		String data = gson.toJson(week);
		
		return data;
	}
	
	@RequestMapping(value="monthCard.action", method=RequestMethod.GET)
	@ResponseBody
	public String monthCard() {
		List<Card> month = chartService.getMonthCard();
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		String data = gson.toJson(month);
		
		return data;
	}
	
	
	
		
}









