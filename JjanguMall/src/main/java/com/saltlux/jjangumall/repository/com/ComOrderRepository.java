package com.saltlux.jjangumall.repository.com;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ComOrderRepository {

	@Autowired
	private SqlSession sqlSession;
	
	
}
