package com.rnh.showmethecard.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.rnh.showmethecard.model.dao.EvaluationDao;

@Service("evaluationService")
public class EvaluationServiceImpl implements EvaluationService {

	@Autowired
	@Qualifier("evaluationDao")
	private EvaluationDao dao;

	@Override
	public void addEval(ModelAndView evaluationForm) {
//		dao.addEvaluation();
	}
	
	
}
