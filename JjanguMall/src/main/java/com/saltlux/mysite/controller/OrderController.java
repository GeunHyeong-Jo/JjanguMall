package com.saltlux.mysite.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.saltlux.mysite.dto.*;

import com.saltlux.mysite.service.*;



@Controller
@RequestMapping("/order/*")
public class OrderController {

	@Autowired
	private OrderService orderService;
	
	@Autowired
	private GoodsService goodsService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private CartService cartService;		
	

	//배송 정보 추가
	@RequestMapping(value="/updateUserInfo", method=RequestMethod.POST)
	@ResponseBody
	public String setUserInfo(@ModelAttribute UserDTO userDTO) {
		System.out.println("배송정보="+userDTO);
		userService.updateUserInfo(userDTO);
		System.out.println("업데이트내용"+userService.checkId("song"));
		return "success";
	}
	
	//주문 정보 추가
	@RequestMapping(value="/setOrderInfo", method=RequestMethod.POST)
	@ResponseBody
	public String setOrderInfo(@ModelAttribute OrderDTO orderDTO) {
		System.out.println("주문정보="+orderDTO);
		int su = orderService.setOrderInfo(orderDTO);
		System.out.println(su);
		if(su == 1)	return "success";
		else return "fail";
	}
	
	//order_cart 페이지 : 장바구니에서 선택주문에서 이동하는 페이지
	@GetMapping("/order_cart")
	public ModelAndView orderCart(@RequestParam(required=false, defaultValue="") String checkedValueStr, HttpSession session ) {
		System.out.println("선택주문하러왔어용");
		List<CartDTO> list = new ArrayList<CartDTO>();
		String[] cartCodeStr = checkedValueStr.split(",");
		System.out.println(cartCodeStr.length);
		int[] cartCode = new int[cartCodeStr.length];
		for(int i = 0; i<cartCodeStr.length; i++) {
			cartCode[i] = Integer.parseInt(cartCodeStr[i]);
			CartDTO cartDTO = cartService.getCartDTO(cartCode[i]);
			list.add(cartDTO);
			System.out.println("선택주문할내용 "+cartDTO);
		}
		
	 	String thumbImgList = "";
		String productCodeList = "";
		String productNameList = "";
		String discountPriceList = "";
		String purchaseQtyList = "";
		
		for(int i= 0 ; i<list.size(); i++) {
			thumbImgList += (list.get(i).getThumbImg() + ",");
			productCodeList += (list.get(i).getProductCode() + ",");
			productNameList += (list.get(i).getProductName() + ",");
			discountPriceList += (list.get(i).getDiscountPrice() + ",");
			purchaseQtyList += (list.get(i).getProductQty() + ",");
		}
		
		String userId = (String) session.getAttribute("memId");
		UserDTO userDTO = userService.checkId(userId);
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("checkedValueStr", checkedValueStr);
		mav.addObject("thumbImgList", thumbImgList);
		mav.addObject("productCodeList", productCodeList);
		mav.addObject("productNameList", productNameList);
		mav.addObject("discountPriceList", discountPriceList);
		mav.addObject("purchaseQtyList", purchaseQtyList);
		mav.addObject("userDTO", userDTO);
		mav.addObject("list", list);
		mav.addObject("display", "/order/order_cart.jsp");
		mav.setViewName("/main/nosIndex");
		return mav;
	}
	
	//order_settle 페이지
	@GetMapping("/order_settle")
	public ModelAndView orderSettle(@RequestParam(required=false, defaultValue="") String checkedValueStr,			
									HttpSession session) {
		System.out.println(" order_settle에 왔니?");
		
		String userId = (String) session.getAttribute("memId");
		ModelAndView mav = new ModelAndView();
		//주문정보
		List<OrderDTO> list = orderService.getOrderProduct(userId);		
		//유저정보
		UserDTO userDTO = userService.checkId(userId);
		
		mav.addObject("list", list); 
		mav.addObject("userDTO", userDTO);		
		mav.addObject("checkedValueStr", checkedValueStr); //cartCode
		System.out.println(" check : "+checkedValueStr+",userDTO : "+userDTO+",list : "+list);
		
		mav.addObject("display", "/order/order_settle.jsp");
		mav.setViewName("/main/nosIndex");
		return mav;
	}
	
	
	//ORDERLIST 생성 및 ORDER 수정
	@RequestMapping(value="/insertOrderlist", method=RequestMethod.POST)
	@ResponseBody
	public String insertOrderlist(@RequestParam Map<String, Object> map, HttpSession session) {
		//ORDERLIST 생성
		System.out.println("map :" + map);
		orderService.insertOrderlist(map);
		
		//orderstate증가 0=>1(주문접수상태)
		int orderCode = orderService.getOrderListCode();
		map.put("orderCode", orderCode);
		String userId = (String)map.get("userId");
		orderService.OrderReady(map);
		return "success";		
		
	}
	
	//재고처리
	@RequestMapping(value="/reduceSaleProduct.", method=RequestMethod.POST)
	@ResponseBody
	public String reduceSaleProduct(@RequestParam int productCode
			, @RequestParam int purchaseQty) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("productCode", productCode);
		map.put("purchaseQty", purchaseQty);
		orderService.reduceSaleProduct(map);
		
		return "success";
	}
	
	@RequestMapping(value="/orderCancel", method=RequestMethod.GET)
	@ResponseBody
	public String orderCancel(HttpSession session) {
		String memId = (String)session.getAttribute("memId");
		orderService.orderCancel(memId);
		
		return "/miniproject";
	}
	
}
