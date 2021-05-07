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
	
		return sqlSession.insert("used.user.signUp", vo);
	}
	
	
	// -------------- Sign In
	public UserVo findByIdAndPassword(UserVo vo) {
		
		return sqlSession.selectOne("used.user.findByIdAndPassword", vo);
	}
	
	public UserVo findById(String id) {
		
		return sqlSession.selectOne("used.user.findById", id);
	}
	
	
	public int update(UserVo vo) {
		
		return sqlSession.update("used.user.update", vo);
	}
	
	public String getRole(String id) {
		
		return sqlSession.selectOne("used.user.getRole", id);
	}
	
	public UserVo seller(String id) {
		
		return sqlSession.selectOne("used.user.seller", id);
	}
	
	public Double sellerPoint(String id) {
		
		return sqlSession.selectOne("used.user.sellerPoint", id);
	}
	
	public List<TradeVo> tradeList(String id) {
		
		return sqlSession.selectList("used.user.tradeList", id);
	}
	
	public Double avgPoint(String id) {
		
		return sqlSession.selectOne("used.user.avgPoint", id);
	}
	

}
