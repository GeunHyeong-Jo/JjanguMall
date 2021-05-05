package com.saltlux.jjangumall.controller.used;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.saltlux.jjangumall.dto.used.ItemVo;
import com.saltlux.jjangumall.dto.used.TradeVo;
import com.saltlux.jjangumall.dto.used.UserVo;
import com.saltlux.jjangumall.security.Auth;
import com.saltlux.jjangumall.service.used.ItemService;
import com.saltlux.jjangumall.service.used.UsedUserService;

@Controller
@RequestMapping("/used/user")
public class UsedUserController {

	
	@Autowired
	UsedUserService userService;
	
	@Autowired
	ItemService itemService;
	
	
	// ------------- Join
	@RequestMapping(value="/signup", method=RequestMethod.GET)
	public String Join() { 
		return "used/user/signup";
	}
	
	@RequestMapping(value="/signup", method=RequestMethod.POST)
	public String Join(UserVo vo) {
		
		userService.signUp(vo);
		return "redirect:/used/user/signin";
	}
	
	
	// -------------- Login
	@RequestMapping(value="/signin", method=RequestMethod.GET)
	public String login() {
		
		return "used/user/signin";
	}
	
	@RequestMapping(value="/auth", method=RequestMethod.POST)
	public String login(UserVo vo) {
		
		return "redirect:/used/";
	}
	
	
	// -------------- Update
	@Auth
	@RequestMapping(value="/update", method=RequestMethod.GET)
	public String update() {
		
		return "";
	}
	
	
	@Auth
	@RequestMapping(value="/update", method=RequestMethod.POST)
	public String update(UserVo vo) {
		
		return "";
	}
	
	
	// --------------- User Detail
	@Auth
	@RequestMapping(value="/seller/{id}")
	public String detail(@PathVariable("id") String id, Model model) {
		
		UserVo userVo = userService.seller(id);
		List<TradeVo> tradeList = userService.tradeList(id);
		model.addAttribute("userVo", userVo);
		model.addAttribute("tradeList", tradeList);
		
		for(TradeVo vo : tradeList) {
			System.out.println(vo);
		}
		return "used/user/detail";
	}
	
	// --------------- My Page
	@Auth
	@RequestMapping("/mypage")
	public String myPage(Model moded, HttpServletRequest reuqest) {
		
		return "used/user/mypage/mypage";
	}
	
	@Auth
	@RequestMapping("/sell")
	public String sell(Model model, HttpServletRequest reuqest) {
		
		HttpSession session = reuqest.getSession();
		String userId = (String) session.getAttribute("memId");
		
		List<TradeVo> list = userService.tradeList(userId);
		
		model.addAttribute("tradeList", list);
		return "used/user/mypage/sell";
	}
	
	@Auth
	@RequestMapping("/buy")
	public String buy(Model model, HttpServletRequest reuqest) {
		HttpSession session = reuqest.getSession();
		String userId = (String) session.getAttribute("memId");
		
		List<TradeVo> list = userService.tradeList(userId);
		
		model.addAttribute("tradeList", list);
		
		return "used/user/mypage/buy";
	}
	
	@Auth
	@RequestMapping("/sellitem")
	public String sellItem(Model model, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("memId");
		
		List<ItemVo> list = itemService.myItem(userId);
		for(ItemVo vo : list) {
			System.out.println(vo);
		}
		
		model.addAttribute("itemList", list);
		
		
		return "used/user/mypage/sellitem";
	}
	
}
