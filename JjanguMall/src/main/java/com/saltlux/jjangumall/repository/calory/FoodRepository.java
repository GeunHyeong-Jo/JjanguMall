package com.saltlux.jjangumall.repository.calory;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.saltlux.jjangumall.dto.FoodDTO;

@Repository
public class FoodRepository {
	
	@Autowired
	private SqlSession sqlSession;

	public FoodDTO findNo(int no) {
		return sqlSession.selectOne("food.findNo",no);
	}

	public int findName(String name) {
		return sqlSession.selectOne("food.findName",name);
	}
}
