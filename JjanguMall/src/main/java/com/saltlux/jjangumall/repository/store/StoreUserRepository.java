package com.saltlux.jjangumall.repository.store;

import java.util.Map;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.saltlux.jjangumall.dto.UserDTO;

@Repository
public class StoreUserRepository {

	@Autowired
	private SqlSession sqlSession;

	public UserDTO checkId(String userId) {
		return sqlSession.selectOne("user.checkId",userId);
	}


	public UserDTO checkEmail(String userEmail) {
		return sqlSession.selectOne("user.checkEmail",userEmail);
	}


	public boolean join(UserDTO userDTO) {
		int count = sqlSession.insert("user.join",userDTO);
		return count==1;
	}

	public void updateUserInfo(UserDTO userDTO) {
		sqlSession.update("user.updateUserInfo", userDTO);	
	}

	public void modify(UserDTO dto) {
		sqlSession.update("user.modify",dto);
	}

	public void delete(String userId) {
		sqlSession.delete("user.delete",userId);
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


	public UserDTO getUser(UserDTO userDTO) {
		return sqlSession.selectOne("user.getUser",userDTO);
	}


	public UserDTO adminLogin(Map<String, String> map) {
		return sqlSession.selectOne("user.adminLogin",map);
	}


	public String getAuth(String memId) {
		return sqlSession.selectOne("user.getAuth", memId);
	}


}
