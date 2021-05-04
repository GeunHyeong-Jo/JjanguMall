package com.saltlux.mysite.repository;

import java.util.Map;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.saltlux.mysite.dto.UserDTO;

@Repository
public class UserRepository {

	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private DataSource dataSource;	
	
	

	public UserDTO checkId(String userId) {
		return sqlSession.selectOne("user.checkId",userId);
	}


	public UserDTO checkEmail(String userEmail) {
		return sqlSession.selectOne("user.checkEmail",userEmail);
	}


	public void join(UserDTO userDTO) {
		int count = sqlSession.insert("user.join",userDTO);
	}

	public void updateUserInfo(UserDTO userDTO) {
		sqlSession.update("user.updateUserInfo", userDTO);	
	}
	
	public void addCartCount(String userId) {
		sqlSession.update("user.addCartCount", userId);	
	}

	public void subCartCount(String userId) {
		sqlSession.update("user.subCartCount",userId);
	}

	public void allDeleteCartCount(String userId) {
		sqlSession.update("user.allDeleteCartCount",userId);
	}

	public void modify(Map<String, String> map) {
		sqlSession.update("user.modify",map);
	}

	public void memberDelete(Map<String, String> map) {
		sqlSession.delete("user.memberDelete",map);
	}


	public UserDTO getUser(Map<String, String> map) {
		return sqlSession.selectOne("user.getUser",map);
	}


}
