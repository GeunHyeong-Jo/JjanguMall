package com.saltlux.jjangumall.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.saltlux.jjangumall.dto.ProductDTO;
import com.saltlux.jjangumall.service.store.StoreProductService;

@Controller
public class MainController {
	
	@Autowired
	private StoreProductService sotreProductService;
	
	@RequestMapping("")
	public ModelAndView index() {
		
		List<ProductDTO> list = sotreProductService.get_goods_list();
		System.out.println("메인 상품리스트 "+list);
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.addObject("display", "/goods/main_goods.jsp");
		mav.setViewName("/main/index");
		return mav;		

	}
	
	//상품상세 페이지
	@RequestMapping(value="/goods_view", method=RequestMethod.GET)
	public ModelAndView goodView(@RequestParam String productNo) {
		
		//상품한개받아오기
		ProductDTO productDTO = sotreProductService.getGoodsView(Integer.parseInt(productNo));
		ModelAndView mav = new ModelAndView();
		mav.addObject("productDTO", productDTO);
		
		mav.addObject("display", "/goods/goods_view.jsp");
		mav.setViewName("/main/nosIndex");
		return mav;
	}
	
	//건강관리 페이지
	@RequestMapping("/calory/index")
	public String caloryIndex() {
		return "/main/caloryindex";
	}
	
	//건강관리 페이지
	@RequestMapping("/store")
	public ModelAndView storeIndex() {
		List<ProductDTO> list = sotreProductService.get_store_list();
		System.out.println("메인 상품리스트 "+list);
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.addObject("display", "/goods/store_goods.jsp");
		mav.setViewName("/main/nosIndex");
		return mav;	
	}
}