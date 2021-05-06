package com.saltlux.jjangumall.repository.used;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.saltlux.jjangumall.dto.used.TradeVo;
import com.saltlux.jjangumall.dto.used.UserVo;

@Repository
public class UsedUserRepository {

	
	@Autowired
	SqlSession sqlSession;
	 
	
	// -------------- Sign Up
	public int signUp(UserVo vo) {
	
		return sqlSession.insert("user.signUp", vo);
	}
	
	
	// -------------- Sign In
	public UserVo findByIdAndPassword(UserVo vo) {
		
		return sqlSession.selectOne("user.findByIdAndPassword", vo);
	}
	
	public UserVo findById(String id) {
		
		return sqlSession.selectOne("user.findById", id);
	}
	
	
	public int update(UserVo vo) {
		
		return sqlSession.update("user.update", vo);
	}
	
	public String getRole(String id) {
		
		return sqlSession.selectOne("user.getRole", id);
	}
	
	public UserVo seller(String id) {
		
		return sqlSession.selectOne("user.seller", id);
	}
	
	public Double sellerPoint(String id) {
		
		return sqlSession.selectOne("user.sellerPoint", id);
	}
	
	public List<TradeVo> tradeList(String id) {
		
		return sqlSession.selectList("user.tradeList", id);
	}
	
	public Double avgPoint(String id) {
		
		return sqlSession.selectOne("user.avgPoint", id);
	}
	

}
