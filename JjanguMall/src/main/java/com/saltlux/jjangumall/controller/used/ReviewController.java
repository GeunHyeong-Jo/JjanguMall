package com.saltlux.jjangumall.controller.used;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.saltlux.jjangumall.dto.used.ReviewVo;
import com.saltlux.jjangumall.security.Auth;
import com.saltlux.jjangumall.service.used.ReviewService;

@Controller
@RequestMapping("/used")
public class ReviewController {

	
	@Autowired
	ReviewService reviewService;
	
	@Auth
	@RequestMapping(value="/review", method=RequestMethod.GET)
	public String review() {
		
		return "used/user/review";
	}
	
	@Auth
	@RequestMapping(value="/review", method=RequestMethod.POST)
	public String review(ReviewVo vo)  {
		System.out.println(vo);
		
		int result = reviewService.review(vo);
		return "redirect:/used/user/buy";
	}
}
