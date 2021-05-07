package com.saltlux.jjangumall.controller;

import java.util.List;

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

import com.saltlux.jjangumall.dto.CartDTO;
import com.saltlux.jjangumall.dto.com.CartAndProductDTO;
import com.saltlux.jjangumall.service.CartService;

@Controller
@RequestMapping("/cart")
public class CartController {
	
	@Autowired
	private CartService CartService;
	
	//장바구니 페이지
	@RequestMapping(value="/goods_cart", method=RequestMethod.GET)
	@ResponseBody
	public ModelAndView cart(HttpSession session) {
		
		String userId = (String) session.getAttribute("memId");
		
		List<CartAndProductDTO> list = CartService.getCart(userId);
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
		System.out.println("장바구니에 담기 "+cartDTO);

		int checkCart = CartService.checkCart(cartDTO);
		if (checkCart == 0) { // 장바구니에 없는 상품일 경우
			// 장바구니에 추가
			CartService.cartInsert(cartDTO);
			
			return "success";
		}else {// 장바구니에 있는 상품일 경우
			// 장바구니에 수량추가
			CartService.cartInsertUpdate(cartDTO);
			
			return "fail";
		}
		
	}
		
		// 장바구니 선택삭제
		@RequestMapping(value = "/deleteCart", method = RequestMethod.POST)
		@ResponseBody
		public void deleteCart(@RequestParam String userId, @RequestParam int carNo,@RequestParam int productNo,
				HttpSession session) {
			
			System.out.println("[회원 장바구니 선택삭제] userId="+userId+" productNo="+productNo );
			CartDTO cartDTO = new CartDTO();
			String userID = (String)session.getAttribute("memId");
			cartDTO.setUserID(userID);
			cartDTO.setCarNo(carNo);
			cartDTO.setProductNo(productNo);

			CartService.deleteCart(cartDTO);
		}

		// 전체삭제
		@RequestMapping(value = "/allDeleteCart", method = RequestMethod.POST)
		@ResponseBody
		public void allDeleteCart(@RequestParam String userId) {

			CartService.allDeleteCart(userId);
		}
		
		
		// 수량변경 수정 (button 사용)
		@RequestMapping(value = "/goods_cart_modify", method = RequestMethod.POST)
		public ModelAndView cartUpdate(@RequestParam int count, @RequestParam int carNo,@RequestParam int productNo,
				HttpSession session) {
			System.out.println("[회원 장바구니 수량수정]carNo="+carNo+",productNo="+productNo+",들어온 count="+count);
			
			CartDTO cartDTO = new CartDTO();
			String userID = (String)session.getAttribute("memId");
			cartDTO.setUserID(userID);
			cartDTO.setCount(count);
			cartDTO.setCarNo(carNo);
			cartDTO.setProductNo(productNo);
			CartService.cartInsertUpdate(cartDTO);
			
			String userId = (String) session.getAttribute("memId");
			List<CartAndProductDTO> list = CartService.getCart(userId);

			ModelAndView mav = new ModelAndView();
			mav.addObject("display", "/cart/goods_cart.jsp");
			mav.addObject("list", list);
			mav.setViewName("/main/nosIndex");
			return mav;
		}
		
		@PostMapping("/deleteCartAfterPay")
		@ResponseBody
		public void deleteCartAfterPay(@RequestParam String carNo, HttpSession session) {
			String userId = (String) session.getAttribute("memId");
			//미구현 - 트리거사용예정
			//CartService.deleteCartAfterPay(Integer.parseInt(carNo)); //장바구니 리스트에서 삭제
				
		}
	
}
