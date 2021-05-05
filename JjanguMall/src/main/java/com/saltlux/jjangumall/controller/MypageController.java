package com.saltlux.jjangumall.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.saltlux.jjangumall.dto.UserDTO;
import com.saltlux.jjangumall.service.store.SongUserService;

@Controller
@RequestMapping("/mypage")
public class MypageController {
	
	@Autowired
	private SongUserService userService;	
	
	//주문내역/배송조회 페이지
	@RequestMapping(value = "/mypage_orderlist", method = RequestMethod.GET)
	public ModelAndView orderlist(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		String userId = (String)session.getAttribute("memId");
		UserDTO userDTO = userService.checkId(userId);
		//List<OrderlistDTO> list = orderService.getOrderListInfo(userId);
		
		mav.addObject("userDTO", userDTO);
		//mav.addObject("list", list);
		mav.addObject("display", "/mypage/mypageIndex.jsp");
		mav.addObject("contents", "/mypage/mypage_orderlist.jsp");
		mav.setViewName("/main/nosIndex");
		return mav;
	}
}
