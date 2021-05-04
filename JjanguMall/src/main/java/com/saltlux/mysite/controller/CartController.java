package com.saltlux.mysite.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.saltlux.mysite.dto.CartDTO;
import com.saltlux.mysite.service.CartService;
import com.saltlux.mysite.service.UserService;

@Controller
@RequestMapping("/cart")
public class CartController {
	@Autowired
	private UserService userService;
	
	@Autowired
	private CartService cartService;

	//장바구니 페이지
	@RequestMapping(value="/goods_cart", method=RequestMethod.GET)
	@ResponseBody
	public ModelAndView cart(HttpSession session) {
		
		String userId = (String) session.getAttribute("memId");
		
		List<CartDTO> list = cartService.getCart(userId);
		System.out.println("아이디="+userId+", 장바구니리스트="+list);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list",list);
		mav.addObject("display", "/cart/goods_cart.jsp");
		mav.setViewName("/main/nosIndex");
		return mav;
	}
	
	
	// 장바구니에 담기
	@RequestMapping(value = "/goods_cart_insert", method = RequestMethod.POST)
	@ResponseBody
	public String cartInsert(@ModelAttribute CartDTO cartDTO) {
		System.out.println(cartDTO);

		int checkCart = cartService.checkCart(cartDTO);
		if (checkCart == 0) { // 장바구니에 없는 상품일 경우
			// 장바구니에 추가
			cartService.cartInsert(cartDTO);
			
			//유저 장바구니 목록수 + 1
			userService.addCartCount(cartDTO.getUserId());
			
			return "success";
		}else {// 장바구니에 있는 상품일 경우
			// 장바구니에 수량추가
			cartService.cartInsertUpdate(cartDTO);
			//update tbl_cart set productQty = #{productQty} where userId = #{userId} and productCode = #{productCode}
			
			//유저 장바구니 목록수 + 1
			userService.addCartCount(cartDTO.getUserId());
			return "fail";
		}
		
	}
	
	// 장바구니 선택삭제
	@RequestMapping(value = "/deleteCart", method = RequestMethod.POST)
	@ResponseBody
	public void deleteCart(@RequestParam String userId, @RequestParam String productCode) {
		Map<String, String> map = new HashMap<String, String>();
		
		System.out.println("[회원 장바구니 선택삭제] userId="+userId+" productCode="+productCode );
		map.put("userId", userId);
		map.put("productCode", productCode);

		cartService.deleteCart(map);
		
		//유저 장바구니 목록수 - 1
		userService.subCartCount(userId);
	}

	// 전체삭제
	@RequestMapping(value = "/allDeleteCart", method = RequestMethod.POST)
	@ResponseBody
	public void allDeleteCart(@RequestParam String userId) {

		cartService.allDeleteCart(userId);

		//유저 장바구니 목록수 0
		userService.allDeleteCartCount(userId);
	}
	
	
	// 수량변경 수정 (button 사용)
	@RequestMapping(value = "/goods_cart_modify", method = RequestMethod.POST)
	public ModelAndView cartUpdate(@RequestParam int productQty, @RequestParam int cartCode,
			HttpSession session) {
		CartDTO cartDTO = new CartDTO();
		cartDTO.setProductQty(productQty);
		cartDTO.setCartCode(cartCode);
		cartService.cartUpdate(cartDTO);
		
		String userId = (String) session.getAttribute("memId");
		List<CartDTO> list = cartService.getCart(userId);

		ModelAndView mav = new ModelAndView();
		mav.addObject("display", "/cart/goods_cart.jsp");
		mav.addObject("list", list);
		mav.setViewName("/main/nosIndex");
		return mav;
	}
	
	@PostMapping("/deleteCartAfterPay")
	@ResponseBody
	public void deleteCartAfterPay(@RequestParam String cartCode, HttpSession session) {
		String userId = (String) session.getAttribute("memId");
		
		userService.subCartCount(userId); //장바구니 담긴 수 -1
		cartService.deleteCartAfterPay(Integer.parseInt(cartCode)); //장바구니 리스트에서 삭제
			
	}
	
}
