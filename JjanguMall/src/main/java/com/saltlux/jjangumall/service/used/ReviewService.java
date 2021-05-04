package com.saltlux.jjangumall.service.used;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.saltlux.jjangumall.dto.used.ReviewVo;
import com.saltlux.jjangumall.repository.used.ReviewRepository;

@Service
public class ReviewService {
	
	@Autowired
	ReviewRepository reviewRepository;

	public int review(ReviewVo vo) {
		
		return reviewRepository.review(vo);
	}

}
