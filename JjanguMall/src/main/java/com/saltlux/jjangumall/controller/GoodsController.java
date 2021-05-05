package com.saltlux.jjangumall.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.saltlux.jjangulmall.service.GoodsService;
import com.saltlux.jjangumall.dto.GoodsDTO;


@Controller
@RequestMapping("/goods/*")
public class GoodsController {
	@Autowired
	private GoodsService goodsService;
	
	
	
	//상품상세 페이지
	@RequestMapping(value="/goods_view", method=RequestMethod.GET)
	public ModelAndView goodView(@RequestParam String productCode) {
		
		//상품한개받아오기
		GoodsDTO goodsDTO = goodsService.getGoodsView(Integer.parseInt(productCode));
		ModelAndView mav = new ModelAndView();
		mav.addObject("goodsDTO", goodsDTO);
		
		mav.addObject("display", "/goods/goods_view.jsp");
		mav.setViewName("/main/nosIndex");
		return mav;
		
	}
	
	
	
}
