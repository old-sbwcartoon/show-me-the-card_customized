package com.rnh.showmethecard;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.rnh.showmethecard.model.dto.Card;
import com.rnh.showmethecard.model.dto.Member;
import com.rnh.showmethecard.model.service.ChartService;

@Controller
public class HomeController {
	
	@Autowired
	@Qualifier("chartService")
	private ChartService chartService;
		
	@RequestMapping(value = {"/", "home.action"}, method = RequestMethod.GET)
	public String home(Locale locale, Model model, HttpSession session) {
		
		List<Member> total = chartService.getTotalChart();
		session.setAttribute("total", total);
		
		List<Card> totalCard = chartService.getTotalCard();
		session.setAttribute("totalCard", totalCard);
		
		return "home";
	}
}
