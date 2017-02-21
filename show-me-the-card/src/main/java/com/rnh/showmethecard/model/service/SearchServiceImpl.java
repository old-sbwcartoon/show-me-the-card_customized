package com.rnh.showmethecard.model.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.rnh.showmethecard.model.dao.SearchDao;

@Service("searchService")
public class SearchServiceImpl implements SearchService {

	@Autowired
	@Qualifier("searchDao")
	private SearchDao searchDao;

	
}
