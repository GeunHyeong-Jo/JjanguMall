package com.saltlux.jjangumall.controller.used;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.saltlux.jjangumall.dto.used.ItemVo;
import com.saltlux.jjangumall.service.used.ItemService;

@Controller
public class UsedMainController {
	
	@Autowired
	ItemService itemService;

	@RequestMapping("used")
	public String main(Model model) {
		List<ItemVo> list = itemService.index();

		model.addAttribute("itemList", list); 
		return "used/main/index";
	}
	
	@RequestMapping("used/session")
	public String makeSession(HttpSession session) {
		
		
		session.setAttribute("memId", "1234");
		return "redirect:/used";
	}
	
}
