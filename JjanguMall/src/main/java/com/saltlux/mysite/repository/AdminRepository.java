package com.saltlux.mysite.repository;

import java.util.Map;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.saltlux.mysite.dto.AdminDTO;

@Repository
public class AdminRepository {

	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private DataSource dataSource;

	public AdminDTO loginProcess(Map<String, String> map) {
		return sqlSession.selectOne("adminSQL.loginProcess",map);
	}
}
