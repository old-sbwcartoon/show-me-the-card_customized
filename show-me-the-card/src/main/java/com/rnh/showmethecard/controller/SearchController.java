package com.rnh.showmethecard.controller;

import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.rnh.showmethecard.ui.ThePager;
import com.google.gson.reflect.TypeToken;
import com.rnh.showmethecard.model.dao.SearchDao;
import com.rnh.showmethecard.model.dto.Member;
import com.rnh.showmethecard.model.dto.Card;
import com.rnh.showmethecard.model.dto.Folder;
import com.rnh.showmethecard.model.service.SearchService;

@Controller
@RequestMapping(value = "/search/")
public class SearchController {
	
	@Autowired
	@Qualifier("searchDao")
	private SearchDao searchDao;

	@Autowired
	@Qualifier(value = "searchService")
	private SearchService searchService;

	
}
