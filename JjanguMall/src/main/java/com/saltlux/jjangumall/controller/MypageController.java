package com.saltlux.jjangumall.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.saltlux.jjangumall.dto.OrderDTO;
import com.saltlux.jjangumall.dto.UserDTO;
import com.saltlux.jjangumall.dto.com.OrderlistAndProductDTO;
import com.saltlux.jjangumall.service.com.ComOrderService;
import com.saltlux.jjangumall.service.store.StoreUserService;

@Controller
@RequestMapping("/mypage")
public class MypageController {
	
	@Autowired
	private StoreUserService userService;	
	
	@Autowired
	private ComOrderService comOrderService;
	
	//주문내역/배송조회 페이지
	@RequestMapping(value = "/mypage_orderlist", method = RequestMethod.GET)
	public ModelAndView orderlist(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		String userId = (String)session.getAttribute("memId");
		UserDTO userDTO = userService.checkId(userId);
		
		List<OrderDTO> list = comOrderService.getOrder(userId); //추가된 코드
		
		mav.addObject("userDTO", userDTO);
		mav.addObject("list", list);
		mav.addObject("display", "/mypage/mypageIndex.jsp");
		mav.addObject("contents", "/mypage/mypage_orderlist.jsp");
		mav.setViewName("/main/nosIndex");
		return mav;
	}
	
	@RequestMapping(value = "mypage_orderview")
	public ModelAndView orderview(HttpSession session, HttpServletRequest  request) {
		ModelAndView mav = new ModelAndView();
		String orderNo =request.getParameter("orderNo");
		String userId= (String) session.getAttribute("memId");
		List<OrderlistAndProductDTO> list =  comOrderService.getOrderList(userId, orderNo);
		// 위에부분 @AuthUser로 줄일 수 있다
		UserDTO userDTO = userService.checkId(userId);
		
		OrderDTO orderDTO =  comOrderService.getOneOrder(userId,orderNo);
		mav.addObject("list", list);
		//mav.addObject("orderDTO", orderDTO);
		mav.addObject("rName",orderDTO.getRName());
		mav.addObject("rPhone",orderDTO.getRPhone());
		mav.addObject("rZipcode",orderDTO.getRZipcode());
		mav.addObject("rAddress",orderDTO.getRAddress());
		mav.addObject("userDTO", userDTO);
		mav.addObject("display", "/mypage/mypageIndex.jsp");
		mav.addObject("contents", "/mypage/mypage_orderview.jsp");
		mav.setViewName("/main/nosIndex");
		return mav;
	}
	
}
