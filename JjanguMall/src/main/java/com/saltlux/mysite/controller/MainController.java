package com.saltlux.mysite.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.saltlux.mysite.dto.GoodsDTO;
import com.saltlux.mysite.service.GoodsService;



@Controller
public class MainController {
	
	@Autowired
	private GoodsService goodService;
	
	@RequestMapping("")
	public ModelAndView index() {
		List<GoodsDTO> list = goodService.get_goods_list_newP();
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.addObject("display", "/goods/main_goods.jsp");
		mav.setViewName("/main/index");
		return mav;
	}
}