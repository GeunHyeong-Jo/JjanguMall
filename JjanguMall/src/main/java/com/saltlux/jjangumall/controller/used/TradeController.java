package com.saltlux.jjangumall.controller.used;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.saltlux.jjangumall.dto.used.TradeVo;
import com.saltlux.jjangumall.dto.used.UserVo;
import com.saltlux.jjangumall.security.Auth;
import com.saltlux.jjangumall.service.used.ItemService;
import com.saltlux.jjangumall.service.used.TradeService;



@Controller
@RequestMapping("/used/trade")
public class TradeController {

	
	@Autowired
	TradeService tradeService;
	
	@Autowired
	ItemService itemService;
	
	@Auth
	@RequestMapping("/apply")
	public String index(TradeVo tradeVo, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		UserVo authUser = (UserVo) session.getAttribute("authUser");
		
		tradeVo.setBuyerId(authUser.getId());
		
		tradeService.apply(tradeVo);
		 
		return "redirect:/used/user/buy";
	}
	
	
	@RequestMapping("/cancle")
	public String cancle(Long no) {
		
		int result = tradeService.cancle(no);
		return "redirect:/user/sell";
	}
	
	@RequestMapping("/succsess")
	public String sucsess(Long no, Long itemNo) {
		int result = tradeService.sucsess(no);
		itemService.itemSuccess(itemNo);
		return "redirect:/used/user/sell";
	}
	
	
	
}
