package com.rnh.showmethecard.model.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.rnh.showmethecard.model.mapper.EvaluationMapper;

@Repository(value="evaluationDao")
public class MysqlEvaluationDao implements EvaluationDao {
	
	@Autowired
	@Qualifier("evaluationMapper")
	private EvaluationMapper mapper;
	
	
}
