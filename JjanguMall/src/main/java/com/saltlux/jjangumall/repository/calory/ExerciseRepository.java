package com.saltlux.jjangumall.repository.calory;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.saltlux.jjangumall.dto.ExerciseDTO;
import com.saltlux.jjangumall.dto.ExerciselistDTO;

@Repository
public class ExerciseRepository {
	
	@Autowired
	private SqlSession sqlSession;

	public ExerciseDTO findNo(int no) {
		return sqlSession.selectOne("exercise.findNo",no);
	}
	
	public int findName(String name) {
		return sqlSession.selectOne("exercise.findName",name);
	}
}
