package com.saltlux.jjangumall.repository.used;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.saltlux.jjangumall.dto.used.TradeVo;

@Repository
public class TradeRepository {

	@Autowired
	SqlSession sqlSession;
	
	public int apply(TradeVo vo) {
		 
		return sqlSession.insert("trade.apply", vo);
	}

	public int cancle(Long no) {
		
		return sqlSession.update("trade.cancle", no);
	}

	public int succsess(Long no) {
		// TODO Auto-generated method stub
		return sqlSession.update("trade.succsess", no);
	}
}
