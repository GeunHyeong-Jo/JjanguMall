package com.saltlux.jjangumall.controller.com;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.saltlux.jjangumall.dto.ProductDTO;
import com.saltlux.jjangumall.dto.UserDTO;
import com.saltlux.jjangumall.security.AuthUser;
import com.saltlux.jjangumall.service.com.ComCartService;
import com.saltlux.jjangumall.service.com.ComProductService;

@RequestMapping("com")
@Controller
public class ComMainController { //컴퓨터의 메인컨트롤러
	
	//
	@Autowired
	private ComProductService comProductService;
	@Autowired
	private ComCartService comCartService;
	//여기에 제품리스트, 로그인했으면 아이디의 장바구니리스트
	
	//
	@RequestMapping("index") //초기화면을 보여준다
	public ModelAndView index(@AuthUser UserDTO authUser) { 
		ModelAndView mav = new ModelAndView();
		List<ProductDTO> productList = comProductService.getAllProduct();
		
		//mav.addObject("", mav);
		mav.setViewName("/main/index"); //일단 초기화면으로 넘긴다
		return mav;
	}
	
}
