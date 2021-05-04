package com.saltlux.jjangumall.controller.used;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.saltlux.jjangumall.dto.used.ItemVo;
import com.saltlux.jjangumall.service.used.ItemService;

@Controller
public class MainController {
	
	@Autowired
	ItemService itemService;

	@RequestMapping("used")
	public String main(Model model) {
		List<ItemVo> list = itemService.index();

		model.addAttribute("itemList", list);
		return "main/index";
	}
	
}
