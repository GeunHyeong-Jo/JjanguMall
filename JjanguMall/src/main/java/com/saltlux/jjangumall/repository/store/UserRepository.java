package com.saltlux.jjangumall.repository.store;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.saltlux.jjangumall.dto.UserDTO;

@Repository
public class UserRepository {

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


	public UserDTO getUser(UserDTO dto) {
		return sqlSession.selectOne("user.getUser",dto);
	}


}
