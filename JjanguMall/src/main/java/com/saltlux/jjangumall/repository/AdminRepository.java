package com.saltlux.jjangumall.repository;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.saltlux.jjangumall.dto.AdminDTO;

@Repository
public class AdminRepository {

	@Autowired
	private SqlSession sqlSession;
	

	public AdminDTO loginProcess(Map<String, String> map) {
		return sqlSession.selectOne("adminSQL.loginProcess",map);
	}
}
