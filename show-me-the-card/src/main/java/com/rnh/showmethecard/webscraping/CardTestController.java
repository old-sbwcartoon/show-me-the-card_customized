package com.rnh.showmethecard.webscraping;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.rnh.showmethecard.common.Literal;
import com.rnh.showmethecard.webscraping.HtmlParser;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/webscrapping")
public class CardTestController {
	
	@RequestMapping(value = "/urlsearch.action", method = RequestMethod.GET)
	public String home(Model model) {		
		return "searchtest/urlsearch";
	}
	
	@RequestMapping(value = "/showcard.action", method = RequestMethod.GET, produces = "text/plain; charset=utf-8")
	public String urlSearch(Model model, String url) {
		HtmlParser h = new HtmlParser(url, Literal.ParseHtml.From.WEB);
			
		model.addAttribute("url", h.getUrl());
		model.addAttribute("title", h.getTitle());
		model.addAttribute("desc", h.getDesc());
		model.addAttribute("img", h.getImg());
				
		return "searchtest/showcard";
	}
	
}
 