package com.saltlux.jjangumall.repository.used;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.saltlux.jjangumall.dto.used.ReviewVo;

@Repository
public class ReviewRepository {
	
	@Autowired
	SqlSession sqlSession;

	public int review(ReviewVo vo) {
		 
		return sqlSession.update("review.review", vo);
	}

}
